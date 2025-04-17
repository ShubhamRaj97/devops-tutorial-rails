FROM ruby:3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /myDevops

# Copy Gemfile files and install gems
COPY myDevops/Gemfile myDevops/Gemfile.lock ./
RUN bundle install

# Copy the entire Rails app
COPY myDevops .

# Expose Rails server port
EXPOSE 3000

# Run the Rails server
CMD ["rails", "server", "-b", "192.168.0.157"]
