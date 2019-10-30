# CLUSTER'S INSTALLATION
This repository contains the command to install the HDFS and the NDFS cluster.

## HDFS 

Make shure java is installed on all the nodes. 

You can check that with : `java -version`

If java is not installed, run this command to install the OpenJDk :
```
sudo apt install default-jre
```

Then be sure that all IP addresses written in the script match the IP addresses of your datanodes and namenode.

Edit the *install_hdfs.sh* script if necessary.

You can run on the namenode : 
```
./install_hdfs.sh
```