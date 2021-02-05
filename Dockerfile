# getting base image alpine
FROM alpine:3.9

# installing mkdocs
RUN apk update && apk upgrade \
&& apk --update --no-cache add python3-dev python-dev python3 python py3-pip py-pip \
&& pip install mkdocs && rm -rf /var/cache/apk/*

# setting dir for dockerfile
WORKDIR /docs

# setting mount point
VOLUME /docs

# expose port
EXPOSE 8000

ENTRYPOINT ["mkdocs"]