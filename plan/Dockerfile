FROM golang:alpine

COPY action /usr/local/bin
COPY util /usr/local/bin

RUN apk --update --no-cache add\
    python3\
    bash\
    curl\
    openssl\
    jq\
    git\
    openssh

ENTRYPOINT ["action"]