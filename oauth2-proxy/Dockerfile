FROM %%BASE_IMAGE%%

ADD config.json /tmp/config.json

RUN apk update && \
    apk --no-cache add go libc-dev git jq ca-certificates && \
    go get github.com/akarnani/oauth2_proxy && \
    go get github.com/akarnani/redirect-https && \
    apk del go libc-dev git && \
    rm -rf /root/go/src/* && \
    rm -rf /root/go/pkg/*

ADD run.sh /run.sh

RUN chmod a+x /run.sh

CMD /run.sh

EXPOSE 443 80
