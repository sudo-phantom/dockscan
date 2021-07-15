mkdir segmentation_test_results/;
clear;
sudo nmap -iL ./scope.txt -sT -p1-65535 -vv -oN segmenttaion_test_results/full_syn.txt --script-trace;
clear;
sudo nmap -iL ./scope.txt -sU -p1-65535  -vv -oN segmenttaion_test_results/full_UDP.txt --script-trace;
clear;
sudo nmap -iL ./scope.txt -sV  -n -vv -oN segmenttaion_test_results/ACK.txt --script-trace;
clear;
sudo nmap -iL ./scope.txt -sF  -g 53 -vv -oN segmenttaion_test_results/spoof_dns.txt --script-trace;
clear;
echo "results have been added to a director name 'segmenttaion_test_results' in this directory";
