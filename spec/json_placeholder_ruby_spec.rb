require "spec_helper"

RSpec.describe JsonPlaceholderRuby do
  it "has a version number" do
    expect(JsonPlaceholderRuby::VERSION).not_to be nil
  end

  context "show" do
    before do
      @id = 1
      @body = {userId: 1, id: @id, title: "this is the title", body: "this is the body"}
      @stub = stub_request(:get, "http://jsonplaceholder.typicode.com/posts/#{@id}").
      to_return(body: @body.to_s)
    end

    it "should expect a request to be made" do
      JsonPlaceholderRuby.show(@id)
      expect(@stub).to have_been_requested
    end

    it "should return a body" do
      expect(JsonPlaceholderRuby.show(@id).response.body).to eql(@body.to_s)
    end

  end
end
