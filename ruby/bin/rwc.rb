#!/usr/bin/env ruby

###############################
######## HELPER METHODS #######
###############################

def get_file_data(file_path)
  if File.exists?(file_path)
    file_data = File.read(file_path, :encoding => 'utf-8')
  else
    abort "rwc: #{file_path}: No such file"
  end
  return file_data
end

def count_bytes(data="")
  data.bytesize
end

def count_lines(data="")
  data.split("\n").length
end

def count_words(data="")
  data.split(" ").length
end

def count_chars(data="")
  data.size
end


###############################
####### RUNNER CODE BEGIN #####
###############################

case ARGV.length
when 0
  file_data = STDIN.read
when 1
  file_path, *args = ARGV
  file_data = get_file_data(file_path)
  option = nil
when 2
  option, file_path, *args = ARGV
  file_data = get_file_data(file_path)
else
  abort "Invalid Usage, print help"
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
