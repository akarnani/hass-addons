FROM alpine:3.6

RUN apk update && \
    apk --no-cache add go libc-dev git jq ca-certificates && \
    go get github.com/bitly/oauth2_proxy && \
    apk del go libc-dev git && \
    rm -rf /root/go/src/*

ADD run.sh /run.sh

RUN chmod a+x /run.sh

CMD /run.sh

EXPOSE 4180
