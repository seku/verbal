module Verbal
  module Spanish

    module Numbers


EXPONENT_ESP = {
        0 => '',
        3 => 'mil',
        6 => 'million',
        9 => 'billion',
        12 => 'trillion',
        15 => 'quadrillion',
        18 => 'quintillion',
        21 => 'sextillion'
      }

Unit = {
0 => 'cero', 
1 => 'uno',
2 => 'dos',
3 => 'tres',
4 => 'cuatro',
5 => 'cinco',
6 => 'seis',
7 => 'siete',
8 => 'ocho',
9 => 'nuevo',
10 => 'diez',
11 => 'once',
12 => 'doce',
13 => 'trece',
14 => 'catorce',
15 => 'quince',
16 => 'dieciseis',
17 => 'diecisiete',
18 => 'dieciocho',
19 => 'diecinueve',
20 => 'veinte',
21 => 'veintiuno',
22 => 'veintidós', 
23 => 'veintitrèes', 
24 => 'veinticuatro', 
25 => 'veinticinco', 
26 => 'veintiséis', 
27 => 'veintisiete', 
28 => 'veintiocho', 
29 => 'veintinueve'}

Tent ={
3 => 'triente',
4 => 'cuarenta',
5 => 'cincuenta',
6 => 'sesenta',
7 => 'setenta',
8 => 'ochenta',
9 => 'noventa'}
   
Hundred ={
1 => 'ciento',
2 => 'doscientos', 
3 => 'trescientos', 
4 => 'cuartocientos', 
5 => 'quinientos', 
6 => 'seisentos', 
7 => 'setentos', 
8 => 'ochentos', 
9 => 'novecientos'}



     def to_words(value)
        raise 'value must be an integer' unless value.is_a?(Integer)
        @exponent            = Verbal::Core::exponent(value)
        @extracted_exponents = Verbal::Core::process_thousands(value)
        @in_words = ''
        @extracted_exponents.each do |e, v|
          @in_words << "#{process_hundreds(v, e, @exponent)} #{EXPONENT_ESP[e]} "
        end
        return @in_words.strip.squeeze(' ')
      end
      




 
def  process_hundreds(value,current_exponent, value_exponent)
 # raise 'value should be in range: 0.999' unless <0..999).include?(value) 
  if value==100 #100
   'cien'
  elsif value < 100 
   prefix = "#{(value_exponent != 0 && current_exponent == 0) ? 'e' : '0'}"
   process_tens(value,prefix)
  elsif value > 100 && (value / 10) % 10 == 0 && (value % 10) == 0 #x00
   Hundred[value/100]
  elsif value > 100 && (value / 10) % 10 == 0
   return "#{Hundred[value / 100]} y #{process_tens((value % 100),0)}"
  else 
   return "#{Hundred[value / 100]} #{process_tens((value % 100),0)}"
  end
 
end

def process_tens(value,prefix)
  raise 'value should be in range: 0..99' unless (0..99).include?(value)
  if value < 10 && prefix == 'e'  
   return " y #{Unit[value]}"
  elsif value < 30
   Unit[value]
  elsif value >= 30 && value < 100 && (value % 10) == 0
   Tent[value / 10]
  else 
   return "#{Tent[value / 10]} y #{Unit[value % 10]}"
  end
end
 module_function :to_words, :process_hundreds, :process_tens	  


end
  end
end






















