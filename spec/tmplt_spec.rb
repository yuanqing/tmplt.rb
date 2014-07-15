require "spec_helper"

describe Tmplt do

  it "should raise an ArgumentError if tmpl is not a string" do
    data = { :foo => "bar" }
    expect { Tmplt.render(1, data) }.to raise_error(ArgumentError)
  end

  it "should raise an ArgumentError if data is not a hash" do
    data = []
    expect { Tmplt.render("{{ 0 }}", data) }.to raise_error(ArgumentError)
  end

  it "should replace the tag with the corresponding value in the data hash" do
    data = { :foo => "bar" }
    expect(Tmplt.render("{{ foo }}", data)).to eq("bar")
    expect(Tmplt.render("{{foo}}", data)).to eq("bar")
  end

  it "should be a global replace" do
    data = { :foo => "bar" }
    expect(Tmplt.render("{{ foo }} {{ foo }}", data)).to eq("bar bar")
  end

  it "should replace the tag with the empty string if the tag is not found in the data" do
    data = {}
    expect(Tmplt.render("{{ foo }}", data)).to eq("")
  end

  it "should allow numeric tag names" do
    data = { 0 => "foo" }
    expect(Tmplt.render("{{ 0 }}", data)).to eq("foo")
  end

  it "should allow whitespace within the tag name" do
    data = { "foo bar" => "baz" }
    expect(Tmplt.render("{{ foo bar }}", data)).to eq("baz")
    expect(Tmplt.render("{{foo bar}}", data)).to eq("baz")
  end

  it "should match the string key and not the symbol key if the two keys have the same name" do
    data = {
      :foo => "bar",
      "foo" => "baz"
    }
    expect(Tmplt.render("{{ foo }}", data)).to eq("baz")
  end

  it "should match the symbol key and not the string key if the tag name is prefixed with ':'" do
    data = {
      :foo => "bar",
      "foo" => "baz"
    }
    expect(Tmplt.render("{{ :foo }}", data)).to eq("bar")
  end

  it "should interpolate numeric values" do
    data = {
      :foo => 3.14,
      :bar => 159,
    }
    expect(Tmplt.render("{{ foo }}{{ bar }}", data)).to eq("3.14159")
  end

  it "should interpolate Proc values" do
    data = {
      :foo => "qux",
      :bar => "quux",
      :baz => Proc.new {|d| "#{d[:foo]} #{d[:bar]}" }
    }
    expect(Tmplt.render("{{ baz }}", data)).to eq("qux quux")
  end

  it "should interpolate nested keys" do
    data = {
      :foo => {
        "bar baz" => {
          :qux => "quux"
        }
      }
    }
    expect(Tmplt.render("{{ foo.bar baz.qux }}", data)).to eql("quux")
    expect(Tmplt.render("{{foo . bar baz . qux}}", data)).to eql("quux")
  end

end
