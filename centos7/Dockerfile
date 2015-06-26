FROM centos:centos7
MAINTAINER Vinzenz Feenstra <vfeenstr@redhat.com>

RUN yum update -y; \
yum -y install epel-release; \
yum -y install ovirt-guest-agent-common; \
yum clean all

# Debug only, can be removed
RUN yum -y install file strace less dbus

LABEL Version=1.0
LABEL Vendor="Red Hat" License="ASL 2.0"

LABEL INSTALL="docker run --rm --privileged --pid=host -v /:/host -e HOST=/host -e IMAGE=IMAGE -e NAME=NAME IMAGE /usr/local/bin/ovirt-guest-agent-install.sh"

LABEL RUN="docker run --privileged --pid=host --net=host -v /sysroot:/sysroot -v /dev/virtio-ports/com.redhat.rhevm.vdsm:/dev/virtio-ports/com.redhat.rhevm.vdsm -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket --env container=docker --restart=always ovirt-agent"


ADD ovirt-guest-agent-install.sh /usr/local/bin/
ADD ovirt-guest-agent-uninstall.sh /usr/local/bin/

CMD /sbin/modprobe virtio_console; \
/bin/touch /run/ovirt-guest-agent.pid; \
/bin/chown ovirtagent:ovirtagent /run/ovirt-guest-agent.pid; \
/usr/bin/python /usr/share/ovirt-guest-agent/ovirt-guest-agent.py

