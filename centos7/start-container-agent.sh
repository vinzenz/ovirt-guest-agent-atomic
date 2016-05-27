#!/bin/bash

/bin/rm -f /usr/share/ovirt-guest-agent/LockActiveSession.py{c,o}
/bin/rm -f /usr/share/ovirt-guest-agent/LogoutActiveUser.py{c,o}

# Fake being the host - To show the Atomic Host release
/bin/rm -f /etc/redhat-release
/bin/ln -sf /host/etc/redhat-release /etc/redhat-release

/bin/truncate -s 0 /usr/share/ovirt-guest-agent/LockActiveSession.py
/bin/truncate -s 0 /usr/share/ovirt-guest-agent/LogoutActiveUser.py

/bin/rm -f /usr/share/ovirt-guest-agent/CredServer.py*

/bin/ln -sf /usr/local/bin/ovirt-container-shutdown.sh /usr/share/ovirt-guest-agent/ovirt-shutdown
/bin/ln -sf /usr/local/bin/ovirt-container-hibernate.sh /usr/share/ovirt-guest-agent/ovirt-hibernate

/bin/ln -sf /usr/share/ovirt-guest-agent/LockActiveSession.py /usr/share/ovirt-guest-agent/ovirt-locksession
/bin/ln -sf /usr/share/ovirt-guest-agent/LogoutActiveUser.py /usr/share/ovirt-guest-agent/ovirt-logout
/bin/ln -sf /usr/share/ovirt-guest-agent/container-list /usr/share/ovirt-guest-agent/ovirt-container-list
/bin/ln -sf /usr/share/ovirt-guest-agent/scripts/hooks/defaults/flush-caches /usr/share/ovirt-guest-agent/ovirt-flush-caches

/bin/chown ovirtagent:ovirtagent /dev/virtio-ports/com.redhat.rhevm.vdsm

/usr/bin/python /usr/share/ovirt-guest-agent/ovirt-guest-agent.py
