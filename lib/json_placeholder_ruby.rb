require "json_placeholder_ruby/version"
require "httparty"

module JsonPlaceholderRuby
  include HTTParty
  base_uri 'http://jsonplaceholder.typicode.com/posts'

  def self.show(id)
    get("/1")
  end

  def self.index
  end

  def self.create
  end

  def self.update
  end

  def self.destroy
  end
end
