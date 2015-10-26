#!/bin/bash

AGENT_RPM=ovirt-guest-agent-common-1.0.11-1.fc22.noarch.rpm

curl -o $AGENT_RPM https://dl.fedoraproject.org/pub/fedora/linux/updates/22/x86_64/o/$AGENT_RPM

curl -o Dockerfile https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/fedora/Dockerfile
curl -o ovirt-container-hibernate.sh https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/fedora/ovirt-container-hibernate.sh
curl -o ovirt-container-shutdown.sh https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/fedora/ovirt-container-shutdown.sh
curl -o ovirt-guest-agent-install.sh https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/fedora/ovirt-guest-agent-install.sh
curl -o ovirt-guest-agent-uninstall.sh https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/fedora/ovirt-guest-agent-uninstall.sh
