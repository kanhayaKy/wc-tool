require 'minitest/autorun'
require_relative '../lib/file_analyzer'

# Test program file analyzer
class FileAnalyzerTest < Minitest::Test
  def setup
    @file_analyzer = FileAnalyzer.new
    @file_path = "./test.txt"
  end

  def test_invalid_file
    error = assert_raises(RuntimeError) do
      @file_analyzer.analyze_option("random.txt")
    end
    assert_match "rwc: random.txt: No such file", error.message
  end

  def test_without_option
    assert_equal "7143 58164 334997 #{@file_path}", @file_analyzer.analyze_option(@file_path)
  end

  def test_invalid_option
    error = assert_raises(RuntimeError) do
      @file_analyzer.analyze_option(@file_path, "-k")
    end
     assert_match "Usage: rwc [-c | -l | -w | -m] <file>", error.message
  end

  def test_with_option_c
    assert_equal "334997 #{@file_path}", @file_analyzer.analyze_option(@file_path, "-c")
  end

  def test_with_option_l
    assert_equal "7143 #{@file_path}", @file_analyzer.analyze_option(@file_path, "-l")
  end

  def test_with_option_w
    assert_equal "58164 #{@file_path}", @file_analyzer.analyze_option(@file_path, "-w")
  end

  def test_with_option_m
    assert_equal "332101 #{@file_path}", @file_analyzer.analyze_option(@file_path, "-m")
  end
end
