FROM kalilinux/kali-rolling
RUN apt-get update && apt-get upgrade -y && apt-get -y install nmap && apt-get -y install python3
RUN mkdir /data
WORKDIR /data
COPY scope.txt .


RUN nmap -iL ./scope.txt -sV --open --top-ports 50 -v -v -oN tcp.txt  -oX tcp-scan.xml -Pn -n;
RUN nmap -iL ./scope.txt -sU --open --top-ports 50  -v -v -oN full_UDP.txt -oX udp-scan.xml -Pn -n;

VOLUME /data


RUN python3 -m http.server
Run box="hostname -i"
RUN echo "Server has been spun up on http://$box:8000"
