require 'spec_helper'

describe Terminate do
  describe ".execute" do
    context "when process not found" do
      let(:pid) { 
        `echo 1`
        $?.pid
      }
      after{ Terminate.execute(pid) }
      it { expect(Terminate).to receive(:info).with("Process #{pid} is not found.") }
    end

    context "when process found and terminate in time" do
      let(:pid) { 
        pid = Process.spawn 'sleep 1'
        Process.detach pid
        pid
      }
      after{ Terminate.execute(pid) }
      it { 
        expect(Terminate).to receive(:info).twice do |message|
          expect(message).not_to eq "Timeout, send SIGNAL KILL to process #{pid}."
        end
      }
    end

    context "when process found and terminate in time" do
      let(:pid) { fork{} }
      after{ Terminate.execute(pid, 0.1) }
      it { 
        expect(Terminate).to receive(:info).twice do |message|
          expect(message).not_to eq "Process #{pid} is done."
        end
      }
    end
  end

  describe ".info" do
    let(:logger) { double(:logger) }
    before { 
      allow(logger).to receive(:info)
      Terminate.logger = logger
    }
    after{ Terminate.info('message') }
    it { expect(logger).to receive(:info).with("message") }
  end
end
