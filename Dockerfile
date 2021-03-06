FROM ruby:alpine

ENV LANG C.UTF-8
ENV RUNTIME_PACKAGES="build-base libffi-dev nodejs"

RUN mkdir /app
WORKDIR /app

RUN apk --update add $RUNTIME_PACKAGES
RUN gem install bundler --no-document

COPY app /app

# RUN bundle install --path vendor/bundle
# CMD ["bundle", "exec", "rackup", "-p", "4567"]
RUN bundle install
RUN npm install --verbose
CMD ["ruby", "app.rb"]
