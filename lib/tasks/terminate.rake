desc "Terminate Process"
task :terminate do
  ARGV.shift
  options = Terminate::Options.new
  cmd = "terminate #{ARGV.join(' ')}"
  puts "Command: #{cmd}"
  puts `#{cmd}`
  ARGV.each { |a| task a.to_sym do ; end }
end
