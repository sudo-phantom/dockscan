FROM kalilinux/kali-rolling
RUN apt-get update && apt-get upgrade -y && apt-get -y install nmap && apt-get -y install python3 python3-pip git
RUN mkdir /data
WORKDIR /data
COPY scope.txt .
COPY parse.py .
COPY requirements.txt .
#scan for open tcp and udp
RUN nmap -iL ./scope.txt -sV --open --top-ports 20 -T 3 -v -v -oN tcp.txt  -oX tcp-scan.xml -Pn -n;
RUN nmap -iL ./scope.txt -sU --open --top-ports 20 -T 3 -v -v -oN full_UDP.txt -oX udp-scan.xml -Pn -n;

# Run vunlers nmap (add additional 3x on time)
#RUN git clone https://github.com/vulnersCom/nmap-vulners.git
#RUN cp nmap-vulners/vulners.nse /usr/share/nmap/scripts/
#RUN nmap -sV --open --script vulners --script-args mincvss=5.0 -iL ./scope.txt -v -v -oX vulners-open.xml -oG vulners-tcp.txt -Pn -n;
VOLUME /data

RUN pip3 install -r ./requirements.txt
RUN python3 parse.py
