FROM ruby:alpine

ENV LANG C.UTF-8
ENV RUNTIME_PACKAGES="build-base libffi-dev"

RUN mkdir /app
WORKDIR /app

RUN apk --update add $RUNTIME_PACKAGES
RUN gem install bundler --no-document

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

COPY app /app
RUN bundle install
CMD ["ruby", "/app/app.rb"]
