FROM ubuntu:latest

RUN mkdir miner 
WORKDIR /miner
COPY ./install-xmrig.sh ./install-xmrig.sh

# get XMRig
RUN ./install-xmrig.sh

# set docker container cmd
WORKDIR /miner/xmrig/build
RUN mkdir /miner-config
CMD ["sh", "-c", "./xmrig -c /miner-config/config.json"]
