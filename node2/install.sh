#SETTING UP THE SECURITY

#generate the router key
ndnsec-key-gen /ndn/upec/%C1.Router/router2 > router2.key

#generate the certificate for the router key
ndnsec-cert-dump -i /ndn/upec/%C1.Router/router2 > router2.cert

#install the router certificate
ndnsec-cert-install -f router2.cert

#to verify that the certificates have been installed
ndnsec-list

#CONFIGURING NFD

#configure physical network
sudo mv interfaces /etc/network/

#start nfd
nohup nfd-start

#configure each face that a computer uses to connect to a neighboring computer
nfdc face create udp4://192.168.10.1
nfdc face create udp4://192.168.10.2

#SETTING UP THE CONFIGURATION FILE

#move all files in the NLSR directory
mv ~/NLSR/nlsr.conf ~/NLSR/nlsr.conf.backup
mv nlsr.conf ~/NLSR/
mv router2.cert ~/NLSR/
mv router2.key ~/NLSR/
mv start_nlsr.sh ~/NLSR/

