#
# Jekyll server Dockerfile #
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV JEKYLL_VERSION 4.2.1
WORKDIR /srv/jekyll/website

# Update & install packages for jekyll
RUN apt-get update && \
    apt-get install -y ruby-full build-essential zlib1g-dev

RUN useradd -ms /bin/bash jekyll && \
    usermod -u 1000 jekyll

#Install jekyll
RUN gem install jekyll:${JEKYLL_VERSION} bundler minimal-mistakes-jekyll

EXPOSE 4000

USER jekyll

CMD ["/usr/local/bin/bundle", "exec", "/var/lib/gems/2.5.0/gems/jekyll-4.2.0/exe/jekyll", "serve", "--port", "4000", "--host", "0.0.0.0"]
