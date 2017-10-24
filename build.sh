#!/bin/bash

docker build -t wesparish/deluge:ubuntu-1604 . && \
  docker tag wesparish/deluge:ubuntu-1604 wesparish/deluge:latest && \
  docker push wesparish/deluge:ubuntu-1604 && \
  docker push wesparish/deluge:latest
