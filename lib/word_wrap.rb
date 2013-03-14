class WordWrap
  def self.wrap(string, column_length)
    if string.size > column_length
      split_index = string[0..column_length].rindex(' ') || column_length
      left = string[0..split_index-1].strip 
      right = string[split_index..string.size].strip
      left + "\n" + wrap(right, column_length)
    else
      string
    end
  end
end