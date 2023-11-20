#!/usr/bin/env ruby
require_relative 'app'

# Execute the app
def main
  puts "\n\nWelcome to School Library App!"
  app = App.new
  app.run
end

main
