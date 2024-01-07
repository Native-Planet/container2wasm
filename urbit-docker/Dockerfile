FROM alpine:latest
ARG TAG
ENV TAG=${TAG}
RUN apk update && apk add bash curl libcap tmux util-linux avahi
COPY urbit /usr/sbin/urbit
WORKDIR /urbit
COPY start-urbit.sh .
CMD [ "/bin/bash", "start-urbit.sh" ]
