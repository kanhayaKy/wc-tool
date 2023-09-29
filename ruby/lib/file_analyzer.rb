class FileAnalyzer

  def analyze_option(file_path, option = nil)
    @file_data = read_file(file_path)

    case option
    when '-c'
      "#{count_bytes()} #{file_path}"
    when '-l'
      "#{count_lines()} #{file_path}"
    when '-w'
      "#{count_words()} #{file_path}"
    when '-m'
      "#{count_chars()} #{file_path}"
    when nil
      "#{analyze()} #{file_path}"
    else
      raise "Usage: rwc [-c | -l | -w | -m] <file>"
    end
  end

  private

  def read_file(file_path)
    if file_path.nil?
      STDIN.read
    elsif File.file?(file_path)
      File.read(file_path, encoding: 'utf-8')
    else
      raise "rwc: #{file_path}: No such file"
    end
  end

  def analyze
    bytes = count_bytes()
    lines = count_lines()
    words = count_words()
    chars = count_chars()

    "#{lines} #{words} #{bytes}"
  end

  def count_bytes()
    @file_data.bytesize
  end

  def count_lines()
    @file_data.split("\n").length
  end

  def count_words()
    @file_data.split(" ").length
  end

  def count_chars()
    @file_data.size
  end
end
