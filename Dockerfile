FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt install -y \
            ffmpeg \
            imagemagick \ 
            unzip \
            wget \
            file \
            rsync

RUN cd /usr/local/bin && \
    wget https://github.com/Jack000/Expose/archive/master.zip && \
    unzip master.zip && \
    rm master.zip 

ENV PATH="/usr/local/bin/Expose-master:${PATH}" 

RUN mkdir /expose-input
WORKDIR /expose-input

ENTRYPOINT [ "expose.sh" ]
#CMD [ "/bin/bash" ]