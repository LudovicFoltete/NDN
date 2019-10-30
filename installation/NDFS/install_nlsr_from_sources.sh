#NFD and its requirements must be install
#INSTALLATION PART

#install requirements
git clone https://github.com/named-data/ChronoSync
cd ChronoSync/
./waf configure
./waf
sudo ./waf install

git clone https://github.com/named-data/PSync
cd PSync/
./waf configure
./waf
sudo ./waf install

#install NLSR (Named Data Link State Routing)
git clone https://github.com/named-data/NLSR
cd NLSR/
./waf configure
./waf
sudo ./waf install

sudo ldconfig

#to create dir for nlsr file (include nlsr.conf maked by nlsr)
mkdir /var/lib/nlsr

#to get rights to nlsr to write in
chmod 777 /var/lib/nlsr

#SETTING UP THE SECURITY

#generate the router key
ndnsec-key-gen /ndn/edu/uaslp/%C1.Router/routerX > routerX.key

#generate the certificate for the router key
ndnsec-cert-dump -i /ndn/edu/uaslp/%C1.Router/routerX > routerX.cert

#install the router certificate
ndnsec-cert-install -f routerX.cert

#to verify that the certificates have been installed
ndnsec-list

#CONFIGURING NFD

#test physical network configuration
ping 192.168.10.2

#remember to start "nfd-start" in an other terminal
nfd-status

#configure each face that a computer uses to connect to a neighboring computer
nfdc face create udp4://192.168.10.2

#to display the face id
nfdc face list

#to verify the status of the face
nfdc face show id 265 #because <face-id> = 265

#SETTING UP THE CONFIGURATION FILE

#see https://named-data.net/doc/NLSR/current/ROUTER-CONFIG.html
touch nlsr.conf

#STARTING NLSR

#general command (recommended to open in other terminal)
nlsr -f nlsr.conf

#to verify what is NLSR doing
export NDN_LOG=nlsr.*=TRACE && nlsr -f nlsr.conf

#TURNING EVERYTHING OFF

#1 - stop nlsr processus by pressing Ctrl-C
#2 - destroy the face to the remote computers
nfdc face destroy 265

#3 - stop NFD
nfd-stop
