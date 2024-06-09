def substrings(string, dictionary)
  arr = string.split(" ")
  frequencies = Hash.new(0)
  dictionary.each do |substring|
    arr.each do |word|
    if word.include?(substring)
      frequencies[substring] += 1
    end
  end
  end
end
