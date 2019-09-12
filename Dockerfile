#
# Jekyll server Dockerfile #
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV JEKYLL_VERSION v3.8.6
WORKDIR /srv/jekyll/website

# Update & install packages for jekyll
RUN apt-get update && \
    apt-get install -y ruby-full build-essential zlib1g-dev

#Install jekyll
RUN gem install jekyll bundler jekyll-theme-minima

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--port", "4000", "--host", "0.0.0.0"]
