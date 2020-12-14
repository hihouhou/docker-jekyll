#
# Jekyll server Dockerfile #
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV JEKYLL_VERSION 4.2.0
WORKDIR /srv/jekyll/website

# Update & install packages for jekyll
RUN apt-get update && \
    apt-get install -y ruby-full build-essential zlib1g-dev

#Install jekyll
RUN gem install jekyll:${JEKYLL_VERSION} bundler jekyll-theme-minima

EXPOSE 4000

COPY main.scss /var/lib/gems/2.5.0/gems/minima-2.5.1/assets/main.scss

CMD ["bundle", "exec", "jekyll", "serve", "--port", "4000", "--host", "0.0.0.0"]
