#simply a module with a method that generates an array with every possible guess

module KnuthCodes

  def get_knuth_codes

    key = {"1" => "red",
      "2" => "orange",
      "3" => "yellow",
      "4" => "green",
      "5" => "blue",
      "6" => "purple"}
      
    options = (1111..6666).to_a

    codes = options.map do |code| 
      code.to_s.split("")
    end

    knuth_codes = codes.reject do |code|
      code.include?("7") || code.include?("8") || code.include?("9") || code.include?("0")
    end

    color_knuth_codes = knuth_codes.map do |code|
                          code.map do |value|
                            value = key[value]
                          end
                        end

    color_knuth_codes
  end

  

end