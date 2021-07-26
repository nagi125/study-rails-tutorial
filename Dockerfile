FROM ruby:2.7.4

ENV TZ Asia/Tokyo
ENV LANG C.UTF-8

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs yarn && \
    apt-get clean && \
    rm -rf /var/cache/apt

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install --path vendor/bundle

CMD ["/bin/bash", "/app/docker-entrypoint.sh"]
