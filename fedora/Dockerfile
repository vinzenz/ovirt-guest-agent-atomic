FROM fedora
MAINTAINER Vinzenz Feenstra <evilissimo@redhat.com>

ADD logger_conf /root/logger_conf
RUN dnf update -y; \
    dnf -y install ovirt-guest-agent-common --enablerepo=updates-testing; \
    dnf clean all
RUN rpm -qa | grep -q 'ovirt-guest-agent-common'
RUN cat /root/logger_conf >> /etc/ovirt-guest-agent.conf && rm /root/logger_conf

LABEL BZComponent="ovirt-guest-agent-docker"
LABEL Name="ovirtguestagent/fedora-atomic"
LABEL Version="1.0.12"
LABEL Release="3"
LABEL Vendor="Red Hat"
LABEL License="ASL 2.0"
LABEL Architecture="x86_64"


LABEL INSTALL="docker run --rm --privileged --pid=host -v /:/host -e HOST=/host -e IMAGE=IMAGE -e NAME=NAME IMAGE /usr/local/bin/ovirt-guest-agent-install.sh"

LABEL RUN="docker run --privileged --pid=host --net=host -v /:/host -e HOST=/host -v /proc:/hostproc -v /dev/virtio-ports/com.redhat.rhevm.vdsm:/dev/virtio-ports/com.redhat.rhevm.vdsm --env container=docker --restart=always -e IMAGE=IMAGE -e NAME=NAME IMAGE"

ADD ovirt-guest-agent-install.sh /usr/local/bin/
ADD ovirt-guest-agent-uninstall.sh /usr/local/bin/
ADD ovirt-container-shutdown.sh /usr/local/bin/
ADD ovirt-container-hibernate.sh /usr/local/bin/
ADD start-container-agent.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/ovirt-*.sh

CMD /bin/bash /usr/local/bin/start-container-agent.sh
