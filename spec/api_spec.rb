require 'spec_helper'
require 'kintone/api'

describe Kintone::Api do
  let(:target) { Kintone::Api.new(domain, user, password) }
  let(:domain) { "www.example.com" }
  let(:user) { "Administrator" }
  let(:password) { "cybozu" }

  describe "#get" do
    before(:each) do
      stub_request(
        :get,
        "https://www.example.com/k/v1/path?p1=abc&p2=def"
      ).
      with(:headers => {"X-Cybozu-Authorization" => "QWRtaW5pc3RyYXRvcjpjeWJvenU="}).
      to_return(:body => "{\"abc\":\"def\"}", :status => 200)
    end

    subject { target.get(path, params) }
    let(:path) { "path" }
    let(:params) { {"p1" => "abc", "p2" => "def"} }

    it { expect(subject).to eq({"abc" => "def"}) }
  end

  describe "#post" do
    before(:each) do
      stub_request(
        :post,
        "https://www.example.com/k/v1/path"
      ).
      with(:headers => {"X-Cybozu-Authorization" => "QWRtaW5pc3RyYXRvcjpjeWJvenU=", "Content-Type" => "application/json"},
           :body => "{\"p1\":\"abc\",\"p2\":\"def\"}").
      to_return(:body => "{\"abc\":\"def\"}", :status => 200)
    end

    subject { target.post(path, body) }
    let(:path) { "path" }
    let(:body) { {"p1" => "abc", "p2" => "def"} }

    it { expect(subject).to eq({"abc" => "def"}) }
  end

  describe "#put" do
    before(:each) do
      stub_request(
        :put,
        "https://www.example.com/k/v1/path"
      ).
      with(:headers => {"X-Cybozu-Authorization" => "QWRtaW5pc3RyYXRvcjpjeWJvenU=", "Content-Type" => "application/json"},
           :body => "{\"p1\":\"abc\",\"p2\":\"def\"}").
      to_return(:body => "{\"abc\":\"def\"}", :status => 200)
    end

    subject { target.put(path, body) }
    let(:path) { "path" }
    let(:body) { {"p1" => "abc", "p2" => "def"} }

    it { expect(subject).to eq({"abc" => "def"}) }
  end
  
  describe "#delete" do
    before(:each) do
      stub_request(
        :delete,
        "https://www.example.com/k/v1/path?p1=abc&p2=def"
      ).
      with(:headers => {"X-Cybozu-Authorization" => "QWRtaW5pc3RyYXRvcjpjeWJvenU="}).
      to_return(:body => "{\"abc\":\"def\"}", :status => 200)
    end

    subject { target.delete(path, params) }
    let(:path) { "path" }
    let(:params) { {"p1" => "abc", "p2" => "def"} }

    it { expect(subject).to eq({"abc" => "def"}) }
  end
end