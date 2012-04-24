require 'active_record'
require 'ruby-prof'

# Profile the code
result = RubyProf.profile do
  ActiveRecord::Base
end

# Print a graph profile to text
printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, {})

