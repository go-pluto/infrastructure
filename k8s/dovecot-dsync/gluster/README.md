sudo su
apt-get update
apt-get install glusterfs-server
gluster peer probe $ip
gluster volume create volume1 replica 2 transport tcp ip1:/gluster-storage ip2:/gluster-storage force
gluster volume start volume1

