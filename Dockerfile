FROM golang:alpine

COPY cmd /usr/local/bin
COPY entrypoint /usr/local/bin
COPY util /usr/local/bin

RUN apk --update --no-cache add\
    ca-certificates\
    build-base\
    python3\
    bash\
    curl\
    openssl\
    jq\
    git\
    openssh
    #pip3 install /usr/local/bin/envkey-action

ENTRYPOINT ["entrypoint"]