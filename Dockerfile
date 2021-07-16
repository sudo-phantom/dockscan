FROM kalilinux/kali-rolling
RUN apt-get update && apt-get upgrade -y && apt-get -y install nmap && apt-get -y install python3 python3-pip
RUN mkdir /data
WORKDIR /data
COPY scope.txt .
COPY convert.py .
COPY requirements.txt .

RUN nmap -iL ./scope.txt -sV --open --top-ports 50 -v -v -oN tcp.txt  -oX tcp-scan.xml -Pn -n;
RUN nmap -iL ./scope.txt -sU --open --top-ports 50  -v -v -oN full_UDP.txt -oX udp-scan.xml -Pn -n;
RUN nmap -sV --open -sC -iL ./scope.txt -v -v --top-ports 100 -oX tcp-open.xml -oG open-tcp.txt -n;
VOLUME /data

RUN pip3 install -r ./requirements.txt
RUN python3 converter.py
RUN python3 parse.py
#RUN nmap -iL ./scope.txt -sV  -n -vv -oN ACK.txt --script-trace;
#RUN nmap -iL ./scope.txt -sF  -g 53 -vv -oN spoof_dns.txt --script-trace;
#ENTRYPOINT nmap -sC -sV --top-ports 100 -iL scope.txt -oN results.txt
#ENTRYPOINT nmap -sT --open --top-ports 50 -iL scope.txt -oN tcp-results.txt
