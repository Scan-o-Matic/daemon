FROM ubuntu:16.04
RUN apt update && apt -y install usbutils software-properties-common python-pip
RUN echo -e "\n" | add-apt-repository ppa:rolfbensch/sane-release
RUN apt-get update
RUN apt -y install libsane=1.0.27-xenial1 sane-utils=1.0.27-xenial1 libsane-common=1.0.27-xenial1
# Add scanner id to sane config in case scanimage -L cannot find the scanner automatically
# Epson V800
RUN echo "usb 0x4b8 0x12c" >> /etc/sane.d/epson2.conf
# Epson V700
RUN echo "usb 0x4b8 0x151" >> /etc/sane.d/epson2.conf

