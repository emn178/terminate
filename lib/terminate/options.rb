module Terminate
  class Options
    attr_reader :help

    def initialize
      @help = ''
      @options = {}
      OptionParser.new do |opts|
        opts.banner = "Usage: wait_stop [pid] [options]"
        opts.on('-t', '--timeout=TIMEOUT', 'Timeout to kill(seconds, default is 10)') { |v| @options[:timeout] = v }
        opts.on('-s', '--signal=SIGNAL', 'SIGNAL to terminate(default TERM)') { |v| @options[:signal] = v }
        @help = opts.to_s
      end.parse!
    end

    def pid
      ARGV[0].to_i
    end

    def timeout
      timeout = @options[:timeout].to_i
      timeout <= 0 ? 10 : timeout
    end

    def signal
      @options[:signal] || 'TERM'
    end
  end
end
