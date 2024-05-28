FROM ruby:2.7.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /chat_system
WORKDIR /chat_system

COPY Gemfile /chat_system/Gemfile

RUN bundle install

COPY . /chat_system