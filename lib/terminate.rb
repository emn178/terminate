require 'timeout'
require 'terminate/options'
require 'terminate/railtie'

module Terminate
  def self.logger=(logger)
    @@logger = logger
  end

  def self.logger
    @@logger
  end

  def self.pid_exist?(pid)
    begin
      Process.getpgid( pid )
      true
    rescue Errno::ESRCH
      false
    end
  end

  def self.execute(pid, timeout = 10, signal = 'TERM')
    if pid_exist?(pid)
      Process.kill(signal, pid)
      info "Send SIGNAL #{signal} to process #{pid}."
      begin
        Timeout.timeout(timeout) do
          while pid_exist?(pid)
            sleep 0.1
          end
          info "Process #{pid} is done."
        end
      rescue Timeout::Error
        Process.kill('KILL', pid)
        info "Timeout, send SIGNAL KILL to process #{pid}."
      end
    else  
      info "Process #{pid} is not found."
    end
  end

  def self.info(*args)
    logger.info(*args) unless logger.nil?
  end
end
