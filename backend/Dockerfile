FROM ruby:2.5

WORKDIR /app
COPY . /app
RUN bundle install -j4

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "3000"]
