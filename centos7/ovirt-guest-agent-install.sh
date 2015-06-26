#!/bin/bash
# Install scriptlet for ovirt/rhevm-guest-agent

prefix=/host
dbusdir=/etc/dbus-1/system.d
ovirt_dbus=org.ovirt.vdsm.Credentials.conf

if [ -e "$prefix/$dbusdir/$ovirt_dbus" ] ; then
	echo "Backing up $prefix/$dbusdir/$ovirt_dbus to $prefix/$dbusdir/$ovirt_dbus.atomicnew"
	cp $prefix/$dbusdir/$ovirt_dbus $prefix/$dbusdir/$ovirt_dbus.new
fi

echo "Installing $ovirt_dbus to $prefix/$dbusdir/"
cp  $dbusdir/$ovirt_dbus $prefix/$dbusdir/


# Add the ovirtagent user and group

hostgroup=`nsenter --mount=/host/proc/1/ns/mnt -- getent group ovirtagent`
echo "Host group is ${hostgroup}"
if [ "${hostgroup}" == "" ]; then
	echo "Creating ovirtagent group on host system"
	nsenter --mount=/host/proc/1/ns/mnt -- groupadd -r -g 175 ovirtagent
fi


hostuser=`nsenter --mount=/host/proc/1/ns/mnt -- getent passwd ovirtagent`
echo "Host user is ${hostuser}"
if [ "${hostuser}" == "" ]; then
	echo "Creating ovirtagent user on host system"
	nsenter --mount=/host/proc/1/ns/mnt -- useradd -r -g 175 ovirtagent -c "oVirt Guest Agent" -d /usr/share/ovirt-guest-agent -s /sbin/nologin
fi

#nsenter --mount=/host/proc/1/ns/mnt -- getent passwd ovirtagent > /dev/null || \
#    /usr/sbin/useradd -u 175 -g 175 -o -r ovirtagent \
#    -c "oVirt Guest Agent" -d /usr/share/ovirt-guest-agent -s /sbin/nologin


