FROM hypriot/rpi-node:0.12.0
MAINTAINER Stefan Scherer <stefan@hypriot.com>

RUN apt-get update && apt-get install -y \
    git-core \
    make \
    build-essential \
    libnotify-bin \
    libgconf-2-4 \
    libnss3 \
    libgtk2.0-0 \
    libxtst6 \
    --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

RUN git clone -b linux-support https://github.com/zedtux/kitematic /kitematic
WORKDIR /kitematic
RUN npm install boom && \
  sed -i 's/"electron-version": "0.27.2",/"electron-version": "0.29.0",/' package.json && \
  sed -i 's/"electron-prebuilt": "^0.27.3",/"electron-prebuilt": "^0.29.0",/' package.json && \
  make

CMD ["npm", "start"]
