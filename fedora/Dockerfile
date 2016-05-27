FROM fedora
MAINTAINER Vinzenz Feenstra <evilissimo@redhat.com>

ADD logger_conf /root/logger_conf
RUN dnf update -y; \
    dnf -y install ovirt-guest-agent-common --enablerepo=updates-testing; \
    dnf clean all
RUN rpm -qa | grep -q 'ovirt-guest-agent-common'
RUN cat /root/logger_conf >> /etc/ovirt-guest-agent.conf && rm /root/logger_conf

LABEL BZComponent="ovirt-guest-agent-docker"
LABEL Name="ovirt/ovirt-guest-agent"
LABEL Version="1.0.12"
LABEL Release="1"
LABEL Vendor="Red Hat"
LABEL License="ASL 2.0"
LABEL Architecture="x86_64"


LABEL INSTALL="docker run --rm --privileged --pid=host -v /:/host -e HOST=/host -e IMAGE=IMAGE -e NAME=NAME IMAGE /usr/local/bin/ovirt-guest-agent-install.sh"

LABEL RUN="docker run --privileged --pid=host --net=host -v /:/host -e HOST=/host -v /proc:/hostproc -v /etc/redhat-release:/etc/redhat-release -v /dev/virtio-ports/com.redhat.rhevm.vdsm:/dev/virtio-ports/com.redhat.rhevm.vdsm --env container=docker --restart=always -e IMAGE=IMAGE -e NAME=NAME IMAGE"

ADD ovirt-guest-agent-install.sh /usr/local/bin/
ADD ovirt-guest-agent-uninstall.sh /usr/local/bin/
ADD ovirt-container-shutdown.sh /usr/local/bin/
ADD ovirt-container-hibernate.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/ovirt-*.sh

CMD  /bin/rm -f /usr/share/ovirt-guest-agent/LockActiveSession.py{c,o};                                        \
     /bin/rm -f /usr/share/ovirt-guest-agent/LogoutActiveUser.py{c,o};                                         \
     /bin/truncate -s 0 /usr/share/ovirt-guest-agent/LockActiveSession.py;                                  \
     /bin/truncate -s 0 /usr/share/ovirt-guest-agent/LogoutActiveUser.py;                                   \
     /bin/rm -f /usr/share/ovirt-guest-agent/CredServer.py*;                                                \
     /bin/ln -sf /usr/local/bin/ovirt-container-shutdown.sh /usr/share/ovirt-guest-agent/ovirt-shutdown;    \
     /bin/ln -sf /usr/local/bin/ovirt-container-hibernate.sh /usr/share/ovirt-guest-agent/ovirt-hibernate;  \
     /bin/chown ovirtagent:ovirtagent /dev/virtio-ports/com.redhat.rhevm.vdsm; \
     /usr/bin/python /usr/share/ovirt-guest-agent/ovirt-guest-agent.py
