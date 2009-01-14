require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

describe Verbal::Spanish::Numbers do

  it 'should return correct string' do
    Verbal::Spanish::Numbers.to_words(0).should      == 'cero'
    Verbal::Spanish::Numbers.to_words(100).should    == 'cien'
    Verbal::Spanish::Numbers.to_words(15).should     == 'quince'
    Verbal::Spanish::Numbers.to_words(33).should     == 'triente y tres'
    Verbal::Spanish::Numbers.to_words(400).should  == 'cuartocientos'
    Verbal::Spanish::Numbers.to_words(908).should  == 'novecientos y ocho'
		Verbal::Spanish::Numbers.to_words(999).should  == 'novecientos noventa y nuevo'
    Verbal::Spanish::Numbers.to_words(1000).should  == 'uno mil'
    Verbal::Spanish::Numbers.to_words(1020).should  == 'uno mil veinte'
  end

 
end
