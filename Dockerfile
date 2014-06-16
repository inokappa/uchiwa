FROM centos:6.4

RUN rpm --import http://ftp.riken.jp/Linux/fedora/epel/RPM-GPG-KEY-EPEL-6
RUN rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y git
RUN yum -y install --enablerepo epel nodejs npm 
RUN npm install pm2@latest -g

RUN mkdir -p /opt/uchiwa
ADD . /opt/uchiwa
RUN cd /opt/uchiwa; npm install

EXPOSE 3000
CMD ["cd", "/opt/uchiwa", "pm2", "start", "/opt/uchiwa/app.js", "--no-daemon", "--name", "uchiwa"]
