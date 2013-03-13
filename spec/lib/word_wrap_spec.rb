require 'rspec'
require './lib/word_wrap'

describe WordWrap do
  describe "wrap" do
    subject {WordWrap::wrap(string, column_length)}
    let(:string){ "something" }
    let(:column_length){ 5 }

    its(:class){ should == String}

    context "line length < column length" do
      let(:column_length){ 99 }
      it {should == string}
    end

    context "line length > column length" do
      let(:string) { "Fly me to the moon" }
      let(:column_length){ 9 }
      it {should include "\n" }
    end

    context "line 3 times longer than max length" do
      let(:string) { "the the the" }
      let(:column_length) { 4 }
      it { should == "the\nthe\nthe"}
    end

    context "word length > column length" do
      let(:string) { "welker" }
      let(:column_length) { 4 }
      it { should == "welk\ner" }

      context "with existing words" do
        let(:string) { "bye welker"}
        it { should == "bye\nwelk\ner"}
      end

      context "with a few words" do
        let(:string) { "aa aa aa" }
        let(:column_length) { 5 }
        it { should == "aa aa\naa"}
      end

      context "with periods" do
        let(:string) { "aaa.aaa.aaa."}
        it { should == "aaa.\naaa.\naaa."}
      end

      context "with tabs" do
        let(:string) { "a\tb\tc"}
        let(:column_length) { 3 }
        it { should == "a\tb\nc"}
      end
    end
  end
end