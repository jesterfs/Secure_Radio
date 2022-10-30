require_relative 'radio'

class SecureRadio < Radio
  def play
    sample = audio_stream
    encoded_sample = encode_audio(sample)
    puts "The radio plays: " + encoded_sample
  end

  private
  
    def encode_audio(string)
      array1 = string.split('')
      hash1 = Hash.new
      hash2 = Hash.new
      alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
      alpha_arr = alpha.split('')
  
      alpha_arr.each_with_index do |letter, index|
        if index > 25
          index = index + (100 - 26)
        end
        hash1[letter] = index
        hash2[index] = letter
      end
  
      array1.each_with_index do |letter, index|
        
  
        if array1[index] != ' '
          newNum = hash1[letter] + 5
          if newNum > 25 || newNum > 125
            newNum = newNum - 26
          end
          array1[index] = hash2[newNum]
        end
      end
      return array1.join
    end

  
end