require "json_placeholder_ruby/version"
require "httparty"

module JsonPlaceholderRuby
  include HTTParty
  base_uri "http://jsonplaceholder.typicode.com"

  def self.show(id)
    get("/posts/#{id}")
  end

  def self.index
    get("/posts")
  end

  def self.create(body={})
    post("/posts", body: body)
  end

  def self.update(id, body={})
    put("/posts/#{id}", body: body)
  end

  def self.destroy(id)
    delete("/posts/#{id}")
  end
end
