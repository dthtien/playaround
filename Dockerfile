FROM ruby:3.2.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set production environment
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="production" \
    BUNDLE_WITHOUT="development"

WORKDIR /app
COPY Gemfile Gemfile.lock /app
RUN bundle install && bundle exec bootsnap precompile --gemfile

COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE=DUMMY ./bin/rails assets:precompile

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

EXPOSE 3000

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
