#SETTING UP THE SECURITY

#generate the router key
ndnsec-key-gen /ndn/upec/%C1.Router/client > client.key

#generate the certificate for the router key
ndnsec-cert-dump -i /ndn/upec/%C1.Router/client > client.cert

#install the router certificate
ndnsec-cert-install -f client.cert

#to verify that the certificates have been installed
ndnsec-list

#SETTING UP THE CONFIGURATION FILE

#give the rights to execute scripts
chmod +x start_nlsr.sh
chmod +x start_nfd.sh

#move files in the NLSR directory
mv ~/NLSR/nlsr.conf ~/NLSR/nlsr.conf.backup
mv nlsr.conf ~/NLSR/
mv client.cert ~/NLSR/
mv client.key ~/NLSR/
mv start_nlsr.sh ~/NLSR/

#move start script to home
mv start_nfd.sh ~/

#SETTING UP THE NETWORK

#move the configuration file (we use static ip address)
sudo mv -f interfaces /etc/network/

#restart the network
sudo /etc/init.d/networking restart