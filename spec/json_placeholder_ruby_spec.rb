require "spec_helper"

RSpec.describe JsonPlaceholderRuby do
  it "has a version number" do
    expect(JsonPlaceholderRuby::VERSION).not_to be nil
  end

  context "show" do
    before do
      @id = 1
      @body = {userId: 1, id: @id, title: "this is the title", body: "this is the body"}
      @stub = stub_request(:get, "http://jsonplaceholder.typicode.com/posts/#{@id}").to_return(body: @body.to_s)
    end

    it "should expect a request to be made" do
      JsonPlaceholderRuby.show(@id)
      expect(@stub).to have_been_requested
    end

    it "should return a body" do
      expect(JsonPlaceholderRuby.show(@id).response.body).to eql(@body.to_s)
    end
  end

  context "index" do
    before do
      @id = 2
      @body = [{userId: 1, id: @id, title: "this is the title", body: "this is the body"}]
      @stub = stub_request(:get, "http://jsonplaceholder.typicode.com/posts").to_return(body: @body.to_s)
    end

    it "should expect a request to be made" do
      JsonPlaceholderRuby.index
      expect(@stub).to have_been_requested
    end

    it "should return a body" do
      expect(JsonPlaceholderRuby.index.response.body).to eql(@body.to_s)
    end
  end

  context "create" do
    before do
      @id = 3
      @body = {userId: 1, id: @id, title: "this is the title", body: "this is the body"}
      @stub = stub_request(:post, "http://jsonplaceholder.typicode.com/posts").to_return(body: @body.to_s, status: 201)
    end

    it "should expect a request to be made" do
      JsonPlaceholderRuby.create(@body)
      expect(@stub).to have_been_requested
    end

    it "should return a body" do
      expect(JsonPlaceholderRuby.create(@body).response.body).to eql(@body.to_s)
    end

    it "should return a status code" do
      expect(JsonPlaceholderRuby.create(@body).response.code).to eql("201")
    end
  end

  context "update" do
    before do
      @id = 4
      @body = {userId: 1, id: @id, title: "this is the title", body: "this is the body"}
      @stub = stub_request(:put, "http://jsonplaceholder.typicode.com/posts/#{@id}").to_return(body: @body.to_s, status: 200)
    end

    it "should expect a request to be made" do
      JsonPlaceholderRuby.update(@id, @body)
      expect(@stub).to have_been_requested
    end

    it "should return a body" do
      expect(JsonPlaceholderRuby.update(@id, @body).response.body).to eql(@body.to_s)
    end

    it "should return a status code" do
      expect(JsonPlaceholderRuby.update(@id, @body).response.code).to eql("200")
    end
  end

  context "destroy" do
    before do
      @id = 4
      @body = {}
      @stub = stub_request(:delete, "http://jsonplaceholder.typicode.com/posts/#{@id}").to_return(body: @body.to_s, status: 200)
    end

    it "should expect a request to be made" do
      JsonPlaceholderRuby.destroy(@id)
      expect(@stub).to have_been_requested
    end

    it "should return a body" do
      expect(JsonPlaceholderRuby.destroy(@id).response.body).to eql(@body.to_s)
    end

    it "should return a status code" do
      expect(JsonPlaceholderRuby.destroy(@id).response.code).to eql("200")
    end
  end


end
