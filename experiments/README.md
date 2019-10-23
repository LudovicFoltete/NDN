# Experiments on the ndn cluster

## Introduction

Named Data Networking (NDN) is one of ﬁve projects funded by the U.S. National Science Foundation under its Future Internet Architecture Program.

The NDN project investigates evolution from today’s host-centric network architecture (IP) to a data-centric network architecture (NDN). This conceptually simple shift has far-reaching implications for how we design, develop, deploy, and use networks and applications. 

## Prerequisites

Cluster configuration

 - 17 Virtual Machine that includes :
	- 16 nodes of storage (receive replication) with 8Go RAM, 50Go storage and 2 CPU
	- 1 client (initiates replication) with 16Go RAM, 50Go storage and 1 CPU
 - CPU is Intel(R) Xeon(R) Silver 4114 with 2,20 GHz
 - DIMM DRAM ED0 1400 MHz
 - SATA AHCI controller (VMware) 66 MHz
 - One virtual switch connects all the VM.

This experiments assumes :

 - OS is Ubuntu 16.04
 - [ndn-cxx](http://named-data.net/doc/ndn-cxx/current/) has been installed (from [ppa](https://named-data.net/doc/NFD/current/INSTALL.html) or [sources](https://github.com/named-data/ndn-cxx))
 - [NFD](https://github.com/named-data/NFD) has been installed (forwarding daemon)
 - [ndn-tools](https://github.com/named-data/ndn-tools) has been installed (essential command-line tools)
 - [NLSR](https://github.com/named-data/NLSR) (NDN Link State Routing Protocol) has been installed ( require [ChronoSync](https://github.com/named-data/ChronoSync) and [PSync](https://github.com/named-data/PSync) )
 - VM are configured like [this](https://github.com/LudovicFoltete/ndn_installation).

This experiments are made on [NDFS](https://github.com/mistersound/ndfs-evaluation), that require [nodejs](https://nodejs.org/en/download/) (version >= 10.15.3 )

## Inputs

|Input             | Experiment1 | Experiment2 | Experiment3 | Experiment4|
|------------------|-------------|-------------|-------------|------------|
|File size         | 500Mo       | 500Mo       | 5Go         | 5Go        |
|Replication factor| 3           | 15          | 3           | 15         |

You can download files of different sizes at http://bouygues.testdebit.info

## Experiments

In this following instructions :

 - The client advertise /lacl
 - The storage's nodes advertise /upec/storage
 - All VMs run the [nfd](https://github.com/named-data/NLSR) and [nlsr](https://github.com/named-data/NLSR) daemons.

[ndn6-tools](https://github.com/yoursunny/ndn6-tools) is used instead of ndn-tools because [ndnputchunks](https://github.com/named-data/ndn-tools/tree/master/tools/chunks/putchunks) needs too much memory.
Therefore we use [file-server](https://github.com/yoursunny/ndn6-tools/blob/master/file-server.md) command-line to serve file from nodes.

On all storage node, run : 
		
	node storages.js

On client, place files in a directory, and run (for a replication factor of 3) :

	ndnputchunks /lacl/data/0/1 < /directory/file
	node client.js /upec/storage/3/3/lacl/data/0/1


## Outputs

|     Output    | Experiment1 | Experiment2 | Experiment3 | Experiment4|
|---------------|-------------|-------------|-------------|------------|
|  Throughput   |
|Average IO rate|
|    Runtime    |
|  Performance  |