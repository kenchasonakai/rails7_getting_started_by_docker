FROM ruby:3.1.2
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential libpq-dev nodejs yarn
RUN mkdir /sample_blog_rails7
WORKDIR /sample_blog_rails7
RUN gem install bundler:2.3.17
COPY Gemfile /sample_blog_rails7/Gemfile
COPY Gemfile.lock /sample_blog_rails7/Gemfile.lock
COPY yarn.lock /sample_blog_rails7/yarn.lock
RUN bundle install
RUN yarn install
COPY . /sample_blog_rails7
