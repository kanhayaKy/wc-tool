#!/usr/bin/env ruby

def get_file_data(file_path)
  file_data = File.read(file_path, :encoding => 'utf-8')
  return file_data
end

def count_bytes(data="")
  data.bytesize
end
# Test cases for count_bytes
# puts count_bytes() # should return 0
# puts count_bytes("") # should return 0
# puts count_bytes("hello world") # should return 11

def count_lines(data="")
  data.split("\n").length
end

def count_words(data="")
  data.split(" ").length
end

option, file_path, *args = ARGV

file_data = get_file_data(file_path)

case option
when '-c'
  puts "Counting the bytes in the file"
  puts count_bytes(file_data)
when '-l'
  puts "Counting the lines in the file"
  puts count_lines(file_data)
when '-w'
  puts "Counting the words in the file"
  puts count_words(file_data)
else
  puts "Invalid option"
end
