# Version: 0.1
FROM centos
MAINTAINER Pyshen "pyshen@example.com"

# yum update
RUN yum -y update && yum -y install wget

# install lib devel
RUN yum install -y python-devel mysql-devel openldap-devel gcc && wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate && python get-pip.py


# create app web
RUN mkdir -p /opt/webapp/
ADD requirement.txt /opt/webapp/requirement.txt


# install python lib env
WORKDIR /opt/webapp/
RUN pip install --upgrade pip && pip install -r requirement.txt

# modify lib env
COPY __init__.py /lib/python2.7/site-packages/flask_bootstrap/__init__.py
COPY datastructures.py /lib/python2.7/site-packages/werkzeug/datastructures.py

# open port
EXPOSE 5000
