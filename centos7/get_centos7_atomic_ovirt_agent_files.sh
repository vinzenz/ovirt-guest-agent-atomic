#!/bin/bash

AGENT_RPM=ovirt-guest-agent-common-1.0.11-1.el7.noarch.rpm

curl -o $AGENT_RPM https://dl.fedoraproject.org/pub/epel/7/x86_64/o/$AGENT_RPM

curl -o Dockerfile https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/centos7/Dockerfile
curl -o ovirt-container-hibernate.sh https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/centos7/ovirt-container-hibernate.sh
curl -o ovirt-container-shutdown.sh https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/centos7/ovirt-container-shutdown.sh
curl -o ovirt-guest-agent-install.sh https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/centos7/ovirt-guest-agent-install.sh
curl -o ovirt-guest-agent-uninstall.sh https://raw.githubusercontent.com/vinzenz/ovirt-guest-agent-atomic/master/centos7/ovirt-guest-agent-uninstall.sh
