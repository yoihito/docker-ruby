FROM ubuntu:14.04
MAINTAINER yoihito

# Install essentials	
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get -y install python-software-properties
RUN apt-get -y install build-essential libreadline-dev libssl-dev zlib1g-dev libxml2-dev libxslt-dev git libpq-dev libmysqlclient-dev libpq-dev nodejs libcurl4-openssl-dev libffi-dev imagemagick libjpeg-progs pngcrush
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get -y install git-core curl

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

# Install ruby-build
RUN mkdir -p /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

ENV RBENV_ROOT /usr/local/rbenv
ENV PATH /usr/local/rbenv/bin:/usr/local/rbenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV RUBY_CONFIGURE_OPTS --with-readline-dir="/usr/lib/x86_64-linux-gnu/libreadline.so"

RUN rbenv install 2.1.2
RUN rbenv global 2.1.2 

