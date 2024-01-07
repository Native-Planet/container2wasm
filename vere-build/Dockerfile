FROM debian:buster
RUN apt-get update && apt-get install -y \
    g++ \
    unzip \
    zip \
    zlib1g-dev \
    wget \
    tar \
    make \
    sudo \
    xz-utils \
    bzip2 \
    pkg-config \
    libexpat1-dev \
    autoconf \
    autoconf-archive \
    automake \
    libtool \
    m4
RUN apt-get install -y apt-transport-https curl gnupg
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
RUN mv bazel-archive-keyring.gpg /usr/share/keyrings
RUN echo "deb [signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt update && apt install bazel
RUN apt-get install -y automake git libtool
RUN apt-get install -y musl musl-dev musl-tools
WORKDIR /workspace
RUN git clone https://github.com/yapishu/vere
WORKDIR /workspace/vere
RUN git checkout master
ENV USER=root
RUN arch=$(uname -m) && \
    if [ "$arch" = "x86_64" ]; then \
        bazel run //bazel/toolchain:x86_64-linux-musl-gcc; \
    elif [ "$arch" = "aarch64" ]; then \
        bazel run //bazel/toolchain:aarch64-linux-musl-gcc; \
    else \
        echo "Unsupported architecture: $arch"; \
        exit 1; \
    fi
RUN bazel build :urbit
RUN ls -lath /workspace/vere/bazel-bin/pkg/vere/
