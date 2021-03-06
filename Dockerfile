FROM debian 
RUN dpkg --add-architecture i386 \
&& apt -y update \
&& apt -y upgrade \
&& apt-get -y install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 \
&& apt-get -y install  libstdc++6 libgcc1 libcurl4-gnutls-dev \
&& apt -y install wget \
&& mkdir /steamcmd \
&& mkdir /dts \
&& mkdir -p /root/.klei/DoNotStarveTogether \
&& wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /steamcmd/steamcmd_linux.tar.gz \
&& tar -xzvf /steamcmd/steamcmd_linux.tar.gz -C /steamcmd \
&& /steamcmd/steamcmd.sh +force_install_dir /dts +login anonymous +app_update 343050 +quit 
COPY --chmod=777 run-master.sh /dts/bin64/run-master.sh 
COPY --chmod=777 run-master-and-caves.sh /dts/bin64/run-master-and-caves.sh 
COPY --chmod=777 run-caves.sh /dts/bin64/run-caves.sh
WORKDIR /dts/bin64
