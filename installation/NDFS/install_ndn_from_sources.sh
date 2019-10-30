//install git
apt-get install git

//download ndn-cxx (main dependence of NFD)
git clone https://github.com/named-data/ndn-cxx

//download NFD
git clone --recursive https://github.com/named-data/NFD

//download ndn-tools (ping, dump...)
git clone https://github.com/named-data/ndn-tools

//install ndn-cxx library and its requirements
apt-get install build-essential pkg-config libboost-all-dev libsqlite3-dev libssl-dev libpcap-dev libsystemd-dev

//(optional) install valgrind
apt-get install valgrind valgrind-dbg kcachegrind alleyoop valkyrie

//to build manpages and API documentation
apt-get install doxygen graphviz python-sphinx

//to build ndn-cxx
cd ndn-cxx/
./waf configure
./waf
sudo ./waf install

//if ndn-cxx library is installed into a non-standard path
export PKG_CONFIG_PATH=/user/local/lib/pkgconfig/

#to build NFD
cd NFD/
./waf configure
./waf
sudo ./waf install
sudo ldconfig

#to build ndn-tools
cd ndn-tools/
./waf configure
./waf
sudo ./waf install
sudo ldconfig

#to create proper config file
cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn.nfd.conf