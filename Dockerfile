FROM ubuntu:18.04

RUN dpkg --add-architecture i386 && apt-get update && \
  apt-get install -y libc6:i386 libx11-6:i386 libxext6:i386 libstdc++6:i386 libexpat1:i386 wget sudo make && \
  rm -rf /var/lib/apt/lists/*
RUN wget -nv -O /tmp/xc32 http://ww1.microchip.com/downloads/en/DeviceDoc/xc32-v2.40-full-install-linux-installer.run && \
  sudo chmod +x /tmp/xc32 &&  \
  /tmp/xc32 --mode unattended --unattendedmodeui none --netservername localhost --LicenseType FreeMode --prefix /opt/microchip/xc32/v2.40 && \
  rm /tmp/xc32
RUN wget -nv -O /tmp/harmony http://ww1.microchip.com/downloads/en/DeviceDoc/harmony_v2_02_00b_linux_installer.run && \
  sudo chmod +x /tmp/harmony && \
  /tmp/harmony --mode unattended --unattendedmodeui none
RUN wget -nv -O /tmp/mplabx http://ww1.microchip.com/downloads/en/DeviceDoc/MPLABX-v5.40-linux-installer.tar &&\
  cd /tmp && tar -xf /tmp/mplabx && rm /tmp/mplabx && \
  mv MPLAB*-linux-installer.sh mplabx && \
  sudo ./mplabx --nox11 -- --unattendedmodeui none --mode unattended --ipe 0 --8bitmcu 0 --16bitmcu 0 --othermcu 0 --collectInfo 0 --installdir /opt/mplabx && \
  rm mplabx


COPY build.sh /build.sh

ENTRYPOINT [ "/build.sh" ]