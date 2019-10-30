#INSTALL NODEJS

#download it from https://nodejs.org/en/download/
#unzip the binary archive to /usr/local/lib/nodejs
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf node-v10.15.3-linux-x64.tar.xz -C /usr/local/lib/nodejs

#set the environment variable ~/.profile, add below to the end
export PATH=/usr/local/lib/nodejs/node-v10.15.3-linux-x64/bin:$PATH

#test installation 
node -v
npm version
npx -v

#(optionnal) to create sudo link (because "export" is not persistent)
sudo ln -s /usr/local/lib/nodejs/node-v10.15.3-linux-x64/bin/node /usr/bin/node
sudo ln -s /usr/local/lib/nodejs/node-v10.15.3-linux-x64/bin/npm /usr/bin/npm
sudo ln -s /usr/local/lib/nodejs/node-v10.15.3-linux-x64/bin/npx /usr/bin/npx

#download the framework
git clone https://github.com/mistersound/ndfs-evaluation.git

#create two directory for the app
cd ndfs-evaluation/
mkdir conf  #for conf files
mkdir store #to stock replication files

#make shure "nfd-start" is running
#client advertising for /lacl

#ON NODE 1
#the advertising must be /upec/storage on nodes
node storage.js

#ON CLIENT
#ndnputchunks fileName < file
#node client.js /domain/storage/repF/repI/fileName
ndnputchunks /lacl/data/0/9 < hello.txt
node client.js /upec/storage/2/2/lacl/data/0/9

