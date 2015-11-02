require 'spec_helper'

describe Terminate::Options do
  let(:options) { Terminate::Options.new }
  subject { options }

  context "without arguments" do
    before { 
      ARGV.clear
    }
    its(:pid) { should eq 0 }
    its(:timeout) { should eq 10 }
    its(:signal) { should eq 'TERM' }
  end

  context "with short arguments" do
    before { 
      ARGV.clear
      ARGV[0] = "1234"
      ARGV[1] = "-t"
      ARGV[2] = "30"
      ARGV[3] = "-s"
      ARGV[4] = "USR1"
    }
    its(:pid) { should eq 1234 }
    its(:timeout) { should eq 30 }
    its(:signal) { should eq 'USR1' }
  end

  context "with long arguments" do
    before { 
      ARGV.clear
      ARGV[0] = "1234"
      ARGV[1] = "--timeout"
      ARGV[2] = "30"
      ARGV[3] = "--signal"
      ARGV[4] = "USR1"
    }
    its(:pid) { should eq 1234 }
    its(:timeout) { should eq 30 }
    its(:signal) { should eq 'USR1' }
  end
end
