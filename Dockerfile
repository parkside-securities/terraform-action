FROM golang:alpine

COPY entrypoint /usr/local/bin
COPY plan /usr/local/bin
COPY apply /usr/local/bin
COPY util /usr/local/bin

RUN apk --update --no-cache add\
    python3\
    bash\
    curl\
    openssl\
    jq\
    git\
    openssh

ENTRYPOINT ["entrypoint"]