# getting base image alpine
FROM alpine:3.9

# installing mkdocs
RUN apk update && apk upgrade \
&& apk --update --no-cache add python3-dev python-dev python3 python py3-pip py-pip \
&& pip install mkdocs && rm -rf /var/cache/apk/* \
&& export SONAR_SCANNER_VERSION=4.4.0.2170 \
&& export SONAR_SCANNER_HOME=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-linux \
&& curl --create-dirs -sSLo $HOME/.sonar/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip \
&& unzip -o $HOME/.sonar/sonar-scanner.zip -d $HOME/.sonar/ \
&& export PATH=$SONAR_SCANNER_HOME/bin:$PATH \
&& export SONAR_SCANNER_OPTS="-server" \

# setting dir for dockerfile
WORKDIR /docs

# setting mount point
VOLUME /docs

# expose port
EXPOSE 8000

ENTRYPOINT ["mkdocs"]
