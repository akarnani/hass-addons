ARG BUILD_FROM
FROM $BUILD_FROM

ADD config.json /tmp/config.json

RUN apk update && \
    apk --no-cache add go libc-dev git jq ca-certificates && \
    go get github.com/akarnani/oauth2_proxy && \
    apk del go libc-dev git && \
    rm -rf /root/go/src/* && \
    rm -rf /root/go/pkg/*

ADD run.sh /run.sh

RUN chmod a+x /run.sh

CMD /run.sh

EXPOSE 443 80
