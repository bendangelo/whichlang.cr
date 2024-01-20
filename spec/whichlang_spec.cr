require "./spec_helper"

describe Whichlang do

  describe ".detect" do
    it "detects english" do
      input = "this is the best day ever"
      Whichlang.detect(input).should eq Whichlang::Lang::Eng
    end

    it "detects french" do
      input = "parles-tu français?"
      Whichlang.detect(input).should eq Whichlang::Lang::Fra
    end

    it "detects empty input" do
      input = " "
      Whichlang.detect(input).should eq Whichlang::Lang::Unknown
    end
  end

  describe ".detect?" do
    it "detects english" do
      input = "this is the best day ever"
      Whichlang.detect?(input).should eq Whichlang::Lang::Eng
    end

    it "detects french" do
      input = "parles-tu français?"
      Whichlang.detect?(input).should eq Whichlang::Lang::Fra
    end

    it "detects empty input" do
      input = " "
      Whichlang.detect?(input).should eq nil
    end
  end
end
