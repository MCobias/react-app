FROM ubuntu:latest
LABEL Marcelo Cobias <marcelocobias18@gmail.com>

WORKDIR /usr/

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y
RUN apt-get install -y build-essential \
    apt-utils \
    git \
    cmake \
    wget \
    nano \
    libssl-dev \
    python \
    perl \
    curl \
    unzip \
    pkg-config \
    curl 

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install nodejs -y
RUN npm install npm@latest -g

RUN npm install -g create-react-app

RUN create-react-app react-app

EXPOSE 3000 3000

WORKDIR /usr/react-app/

ENTRYPOINT ["npm start"]

