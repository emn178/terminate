# terminate

[![Build Status](https://api.travis-ci.org/emn178/terminate.png)](https://travis-ci.org/emn178/terminate)
[![Coverage Status](https://coveralls.io/repos/emn178/terminate/badge.svg?branch=master)](https://coveralls.io/r/emn178/terminate?branch=master)

Terminate process or kill if timeout.

## Installation

Add this line to your application's Gemfile:

    gem 'terminate'

And then execute:

    bundle

Or install it yourself as:

    gem install terminate

## Usage
You can call `Terminate.execute` in your ruby program.
```Ruby
# process to terminate
Terminate.execute(pid)

# specify timeout, default 10
Terminate.execute(pid, 30)

# specify SIGNAL, default 'TERM'
Terminate.execute(pid, 30, 'USR1')
```

### Rake
You can alos run by `rake`:

    bundle exec terminate [pid] -- [options]

Eg.

    # default timeout is 10 seconds
    bundle exec terminate 1234

    # set timeout 30
    bundle exec terminate 1234 -- -t 30
    # or
    bundle exec terminate 1234 -- --timeout=30

### Command Line
You can alos run by `terminate` in command line.

    terminate [pid] [options]

Eg.

    # default timeout is 10 seconds
    terminate 1234

    # set timeout 30
    terminate 1234 -t 30
    # or
    terminate 1234 --timeout=30

## License
The project is released under the [MIT license](http://www.opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/terminate  
Author: emn178@gmail.com
