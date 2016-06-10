vagrant-hadoop-cluster
======================

Deploys hadoop in a virtualized psuedo-cluster.

Modified from https://github.com/calo81/vagrant-hadoop-cluster

## Requirements

* vagrant

## Usage

Clone the repo and cd to the directory.

`vagrant up`

`vagrant ssh master`

`/opt/hadoop-xxx/bin/hadoop namenode -format`

`/opt/hadoop-xxx/sbin/start-dfs.sh`
