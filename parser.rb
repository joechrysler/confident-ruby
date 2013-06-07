# Usage:
#   call `ruby parser.rb filename` to parse an arbitrary csv into a hash
#   assumes the first line is the structure of the csv

class Array
  def strip_newlines()
    self.map{ |s| s.gsub(/\n|\r/,'') }
  end
end

def parse_structure(line)
  line.split(',').strip_newlines
end

def parse_line(line, structure)
  Hash[structure.zip(line.split(',').strip_newlines)]
end

def parser(io)
  structure = parse_structure(io.readline)
  records = []
  io.each_line do |line|
    records << parse_line(line, structure)
  end
  records
end

begin
  puts parser(File.open ARGV[0])
rescue
end
