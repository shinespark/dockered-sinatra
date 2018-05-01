FROM ruby:alpine

ENV LANG C.UTF-8
# ENV RUNTIME_PACKAGES="libxml2-dev libxslt-dev tzdata mariadb-client-libs nodejs imagemagick ca-certificates"
# ENV DEV_PACKAGES="build-base mariadb-dev"

RUN mkdir /app
WORKDIR /app

# RUN apk --update add $RUNTIME_PACKAGES
# RUN apk --update add $DEV_PACKAGES
RUN gem install bundler --no-document
RUN bundle config build.nokogiri --use-system-libraries

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install --path vendor/bundle
COPY rails /app
