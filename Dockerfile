FROM centos:centos7
RUN yum install -y epel-release && yum install -y python2-pip ansible git

RUN mkdir /src
RUN git clone https://github.com/openshift/openshift-restclient-python /src
WORKDIR /src

RUN pip install -r requirements.txt

RUN pip install .
WORKDIR /tmp
ADD https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz /tmp
RUN tar zxvf /tmp/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && mv /tmp/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /bin/
RUN useradd ansible -d /opt
ADD run.sh /opt/run.sh
RUN chgrp -R 0 /opt \
    && chmod -R g+rwX /opt/
RUN chmod 777 /etc/passwd
CMD ["/opt/run.sh"]
