#!/bin/bash
namenode=192.168.20.254
d1=192.168.20.1
d2=192.168.20.2
d3=192.168.20.3
d4=192.168.20.4
d5=192.168.20.5
d6=192.168.20.6
d7=192.168.20.7
d8=192.168.20.8
d9=192.168.20.9
d10=192.168.20.10
d11=192.168.20.11
d12=192.168.20.12
d13=192.168.20.13
d14=192.168.20.14
d15=192.168.20.15
d16=192.168.20.16

##INSTALLATION

#check where java is installed
path=`which java`

#remove the last two components (bin/java) of the path
path=`readlink -f $path | rev | cut -d / -f 3- | rev`/

#set the environment variable (add this line to ~/.bashrc to get it permanently)
export JAVA_HOME=$path

#download the Hadoop 3.1.2 version
wget -O ~/hadoop-3.1.2.tar.gz http://mirror.ibcp.fr/pub/apache/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz

#extract files
tar xzf ~/hadoop-3.1.2.tar.gz

##CONFIGURATION

#add property to core-site.xlm
file=~/hadoop-3.1.2/etc/hadoop/core-site.xml
head -n -3 $file > temp.txt
mv temp.txt $file
echo "
<configuration>
    <property>
        <name>fs.default.name</name>
        <value>hdfs://$namenode:9000</value>
    </property>
</configuration>" >> $file

#create directory who contains data
mkdir data
mkdir data/namenode
mkdir data/datanode

#edit hdfs-site.xml
file=~/hadoop-3.1.2/etc/hadoop/hdfs-site.xml
head -n -4 $file > temp.txt
mv temp.txt $file
echo "
<configuration>
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>home/user/data/nameNode</value>
    </property>

    <property>
        <name>dfs.datanode.data.dir</name>
        <value>home/user/data/dataNode</value>
    </property>

    <property>
        <name>dfs.replication</name>
        <value>3</value>
    </property>
	
	<property>
		<name>dfs.namenode.datanode.registration.ip-hostname-check</name>
		<value>false</value>
	</property>
</configuration>" >> $file

#the file "workers" is used to start required daemons on all nodes
file=~/hadoop-3.1.2/etc/hadoop/workers
echo "$d1
$d2
$d3
$d4
$d5
$d6
$d7
$d8
$d9
$d10
$d11
$d12
$d13
$d14
$d15
$d16" > $file

#duplicate config files on each node
ssh-keygen
for node in $d1 $d2 $d3 $d4 $d5 $d6 $d7 $d8 $d9 $d10 $d11 $d12 $d13 $d14 $d15 $d16 ; do
        ssh-copy-id -i ~/.ssh/id_rsa.pub user@$node
        ssh-add
        scp hadoop-*.tar.gz $node:~
        ssh user@$node 'tar -xzf hadoop-3.1.2.tar.gz'
        scp ~/hadoop-3.1.2/etc/hadoop/* $node:~/hadoop-3.1.2/etc/hadoop/;
done

#HDFS needs to be formatted like any classical file system
~/hadoop-3.1.2/bin/hdfs namenode -format
