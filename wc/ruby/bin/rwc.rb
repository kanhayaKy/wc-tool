#!/usr/bin/env ruby

def get_file_data(file_path)
  file_data = File.read(file_path)
  return file_data
end

def count_bytes(data="")
  data.bytesize
end
# Test cases for count_bytes
# puts count_bytes() # should return 0
# puts count_bytes("") # should return 0
# puts count_bytes("hello world") # should return 11


option, file_path, *args = ARGV

file_data = get_file_data(file_path)

case option
when '-c'
  puts "Counting the bytes in the file"
  puts count_bytes(file_data)
else
  puts "Invalid option"
end
