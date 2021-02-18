###########
# BUILDER #
###########

FROM ruby:2.4.1 as builder

# Add NodeJS to sources list
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Add Yarn to the sources list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# Install dependencies
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    nodejs \
    yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

# Create a user and a directory for the app code
RUN mkdir -p /app
WORKDIR /app

# Adding gems
ADD Gemfile yarn.lock package.json /app/

RUN bundle install && yarn install


#########
# FINAL #
#########

FROM ruby:2.4.1

RUN mkdir /app

# # adding source code
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /usr/lib/node_modules/npm/node_modules/ /app/node_modules

WORKDIR /app

COPY . .

### fix permission ###
RUN chmod -R +x bin

# # # run db migrations and run the app and expose the port
# # CMD bin/rails db:migrate RAILS_ENV=development && bundle exec "rackup -P /tmp/rack.pid --host 0.0.0.0 --port 8080"
#CMD bin/rails db:migrate RAILS_ENV=development && bin/rails db:seed && bundle exec "rackup -P /tmp/rack.pid --host 0.0.0.0 --port 3000git "
CMD bundle exec "rackup -P /tmp/rack.pid --host 0.0.0.0 --port 3000"


