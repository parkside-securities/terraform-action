FROM golang:alpine

COPY apply /usr/local/bin
COPY entrypoint /usr/local/bin
COPY plan /usr/local/bin
COPY test /usr/local/bin
COPY util /usr/local/bin

RUN apk --update --no-cache add\
    build-base\
    python3\
    bash\
    curl\
    openssl\
    jq\
    git\
    openssh

ENTRYPOINT ["entrypoint"]