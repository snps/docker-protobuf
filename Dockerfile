FROM alpine:3.6

LABEL com.apple.author="Felix Glas"

ARG USER=proto

RUN apk update && apk add \
    bash \
    protobuf

RUN adduser -D $USER

USER $USER

WORKDIR /home/$USER

ENTRYPOINT ["protoc"]
