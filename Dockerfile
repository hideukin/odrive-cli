FROM python:latest

# INSTALL ON LINUX
# https://docs.odrive.com/docs/odrive-sync-agent#install-on-linux
RUN set -ex \
  && apt update \
  && apt install -y \
  cron \
  vim \
  && od="/.odrive-agent/bin" \
  && curl -L "https://dl.odrive.com/odrive-py" --create-dirs -o "$od/odrive.py" \
  && curl -L "https://dl.odrive.com/odriveagent-lnx-64" | tar -xvzf- -C "$od/" \
  && curl -L "https://dl.odrive.com/odrivecli-lnx-64" | tar -xvzf- -C "$od/"

ENV PATH $PATH:/.odrive-agent/bin

# RUN ON LINUX
# https://docs.odrive.com/docs/odrive-sync-agent#run-on-linux
ENTRYPOINT nohup "/.odrive-agent/bin/odriveagent" > /dev/null
