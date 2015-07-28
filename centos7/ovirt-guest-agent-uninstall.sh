#!/bin/bash
# Install scriptlet for rhevm-guest-agent

prefix=/host
dbusdir=/etc/dbus-1/system.d
ovirt_dbus=org.ovirt.vdsm.Credentials.conf

if [ -e "$prefix/$dbusdir/$ovirt_dbus" ] ; then
	echo "Backing up $prefix/$dbusdir/$ovirt_dbus to $prefix/$dbusdir/$ovirt_dbus.atomicnew"
	cp $prefix/$dbusdir/$ovirt_dbus $prefix/$dbusdir/$ovirt_dbus.new

echo "Installing $ovirt_dbus to $prefix/$dbusdir/"
cp  $dbusdir/$ovirt_dbus $prefix/$dbusdir/



