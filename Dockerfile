FROM ubuntu:16.04

MAINTAINER Georgy Schapchits

ENV INFLUX_MASTER_HOST localhost
ENV KAPACITOR_HOST localhost
ENV PORT 8084
ENV KAPACITOR_LOG_PATH kapacitor-logs

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -yq samba gettext
RUN apt-get install -y graphviz

COPY config.json clearFile.sh tickscript-studio VERSION ./
COPY server server
COPY static static
COPY frontend frontend

RUN chmod +x clearFile.sh

EXPOSE ${PORT}

CMD echo `envsubst < config.json` > config.json && ./tickscript-studio
