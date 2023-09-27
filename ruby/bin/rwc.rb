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

def count_chars(data="")
  data.size
end


case ARGV.length
when 0
  abort "Invalid Usage, print help"
when 1
  file_path, *args = ARGV
  option = nil
when 2
  option, file_path, *args = ARGV
else
  abort "Invalid Usage, print help"
end

if File.exists?(file_path)
  file_data = get_file_data(file_path)
else
  abort "rwc: #{file_path}: No such file"
end

case option
when nil
  bytes = count_bytes(file_data)
  lines = count_lines(file_data)
  words = count_words(file_data)
  puts "#{lines} #{words} #{bytes} #{file_path}"
when '-c'
  puts "#{count_bytes(file_data)} #{file_path}"
when '-l'
  puts "#{count_lines(file_data)} #{file_path}"
when '-w'
  puts "#{count_words(file_data)} #{file_path}"
when '-m'
  puts "#{count_chars(file_data)} #{file_path}"
else
  puts "Invalid option"
end
