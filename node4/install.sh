#SETTING UP THE SECURITY

#generate the router key
ndnsec-key-gen /ndn/upec/%C1.Router/router4 > router4.key

#generate the certificate for the router key
ndnsec-cert-dump -i /ndn/upec/%C1.Router/router4 > router4.cert

#install the router certificate
ndnsec-cert-install -f router4.cert

#to verify that the certificates have been installed
ndnsec-list

#CONFIGURING NFD

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

#SETTING UP THE CONFIGURATION FILE

#move all files in the NLSR directory
mv ~/NLSR/nlsr.conf ~/NLSR/nlsr.conf.backup
mv nlsr.conf ~/NLSR/
mv router4.cert ~/NLSR/
mv router4.key ~/NLSR/
mv start_nlsr.sh ~/NLSR/

