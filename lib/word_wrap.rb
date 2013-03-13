class WordWrap
  def self.wrap(string, column_length)
    if string.size > column_length
          left = string[0..column_length-1].strip 
          right = string[column_length..string.size].strip

          left + "\n" + wrap(right, column_length)
    else
      string
    end
  end
end