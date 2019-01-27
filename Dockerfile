FROM openhab/openhab:2.4.0

RUN apt-get update && apt-get install build-essential libusb-dev socat -y && \
    wget -nv -O /tmp/libk8055.tar.gz http://prdownloads.sourceforge.net/libk8055/libk8055.0.4.1.tar.gz && \
    mkdir /tmp/libk8055 && \
    tar xfz /tmp/libk8055.tar.gz -C /tmp/libk8055 && \
    cd /tmp/libk8055/src && \
    sed -i 's/?//' /tmp/libk8055/src/Makefile && \ 
    make all && make install && \
    cd /tmp && rm -r libk8055 && apt-get purge build-essential -y && apt-get autoremove -y