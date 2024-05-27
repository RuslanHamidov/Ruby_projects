def cipher_caesar(word, shift)
    low_alpha = ("a".."z").to_a
    up_alpha = low_alpha.map(&:upcase)
    cipher_string = ""

    word.each_char do |char|
      if low_alpha.include?(char)
        array = low_alpha
      elsif up_alpha.include?(char)
        array = up_alpha
      else
        cipher_string += char
        next
      end

      index = array.find_index(char)
      new_index = (index + shift) % array.size
      cipher_string += array[new_index]
    end

    cipher_string
  end
