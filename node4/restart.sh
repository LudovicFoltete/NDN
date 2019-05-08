#start nfd
nohup nfd-start > /dev/null

#wait a little to let time for nfd to start completely
echo "NFD IS STARTING, PLEASE WAIT..."
sleep 15

#configure each face that a computer uses to connect to a neighboring computer
nfdc face create udp4://192.168.10.1
nfdc face create udp4://192.168.10.2
nfdc face create udp4://192.168.10.3
nfdc face create udp4://192.168.10.254
nfdc face create udp4://192.168.10.5
nfdc face create udp4://192.168.10.6
nfdc face create udp4://192.168.10.7
nfdc face create udp4://192.168.10.8
nfdc face create udp4://192.168.10.9
nfdc face create udp4://192.168.10.10
nfdc face create udp4://192.168.10.11
nfdc face create udp4://192.168.10.12
nfdc face create udp4://192.168.10.13
nfdc face create udp4://192.168.10.14
nfdc face create udp4://192.168.10.15
nfdc face create udp4://192.168.10.16