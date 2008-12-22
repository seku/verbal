module Verbal
  
  VERSION = '1.1.0'

  module Core
		
    
    # returns exponent of value in cubic interval
    # 0 for 0-999, 3 for 1000-999999, 6 for 1_000_000-999_999_999 and so on ...
     
    def exponent(value)
      ((value.to_s.length - 1) / 3) * 3
    end


    # returns array of pairs (exponent and corresponding value), so number can be easily converted to words
    # 1_512_999 => [[6, 1], [3, 512], [0,999]] 

    
    def process_thousands(value)
      readable_slices = []
	  if value == 0
        readable_slices << [0,0]
	  else 
	    e  = exponent(value)
        
          while e > 0
            remainder ||= value
            readable_slices << [e, (remainder / 10**e)]
            remainder = remainder % 10**e
            e -= 3
          end
          readable_slices << [0, value % 10**3]
          return readable_slices.sort.reverse.delete_if {|k, v| v.zero?}
      end
    end
    module_function :process_thousands, :exponent

  end
end
