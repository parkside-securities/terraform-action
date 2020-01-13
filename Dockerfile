FROM golang:alpine
ENV DATADOG_API_KEY=$DATADOG_API_KEY
RUN printenv

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
    openssh;\
    pip3 install envkey

ENTRYPOINT ["entrypoint"]