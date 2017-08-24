# Installation on Compute Engine

Execute the following commands in order to have a ready-to-go GlusterFS replicated volume:

    $ sudo su
    # apt update
    # apt upgrade
    # apt install glusterfs-server
    # gluster peer probe ${INTERNAL_IP_OF_OTHER_GLUSTER_INSTANCE}
    # gluster volume create volume1 replica 2 transport tcp ${INTERNAL_IP_OF_THIS_GLUSTER_INSTANCE}:/gluster-storage ${INTERNAL_IP_OF_OTHER_GLUSTER_INSTANCE}:/gluster-storage force
    # gluster volume start volume1
