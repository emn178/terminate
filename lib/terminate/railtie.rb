if defined? ::Rails
  module Terminate
    class Railtie < Rails::Railtie
      rake_tasks do
        load "tasks/terminate.rake"
      end
    end
  end
end
