#!/usr/bin/env ruby
require_relative '../lib/file_analyzer'

file_path = ARGV[-1]
option = ARGV[-2]

begin
  if option.nil? && !file_path.nil? && file_path.start_with?("-")
    option = file_path
    file_path = nil
  end

  file_analyzer = FileAnalyzer.new()
  puts file_analyzer.analyze_option(file_path, option)
rescue RuntimeError => e
  # Handle the exception
  puts "#{e.message}"
end
