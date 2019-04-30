#SETTING UP THE SECURITY

#generate the router key
ndnsec-key-gen /ndn/edu/uaslp/%C1.Router/client > client.key

#generate the certificate for the router key
ndnsec-cert-dump -i /ndn/edu/uaslp/%C1.Router/client > client.cert

#install the router certificate
ndnsec-cert-install -f client.cert

#to verify that the certificates have been installed
ndnsec-list

#CONFIGURING NFD

#configure each face that a computer uses to connect to a neighboring computer
nfdc face create udp4://192.168.10.1
nfdc face create udp4://192.168.10.2
