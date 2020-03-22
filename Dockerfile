FROM ubuntu:eoan
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y apt-utils git wget mc aptitude nano sudo curl tzdata software-properties-common build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*
ENV TZ=Australia/Adelaide
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ARG UID=99
ARG GID=100
RUN groupadd -g $GID -o abc
RUN useradd -m -u $UID -g $GID -o -s /bin/bash abc
