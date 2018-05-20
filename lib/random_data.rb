# #5 file is a module b/c it's standalone lib with no dependencies
  #or inheritance requirements.
 module RandomData
 # #6 building random paragraphs from sentences
   def self.random_paragraph
     sentences = []
     rand(4..6).times do
       sentences << random_sentence
     end

     sentences.join(" ")
   end

 # #7 creating random sentences with var no. of words; capitalizing
   def self.random_sentence
     strings = []
     rand(3..8).times do
       strings << random_word
     end

     sentence = strings.join(" ")
     sentence.capitalize << "."
   end

 # #8 creating random words by shuffling letters
   def self.random_word
     letters = ('a'..'z').to_a
     letters.shuffle!
     letters[0,rand(3..8)].join
   end
 end
