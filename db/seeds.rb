# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'random_data'

 # Create Posts
 50.times do
 # #1 ! raises an error if data used for seeding has issues

   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4 pick a random post to associate a comment with
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

puts "#{Post.count}"
# to create/find **and** return, thus keeping our post reference
# the same, assign entire find_or_create_by command to a variable
post = Post.find_or_create_by(title: 'The Royal Wedding', body: 'Yeah I watched it.')
puts "#{Post.count}"

 puts "#{Comment.count}"
 # see comment above re: variable assignment.
 # Comment below is also a viable solution.
Comment.find_or_create_by(post: post, title: 'The Royal Wedding', body: 'LOL')
#Comment.find_or_create_by(post: Post.last, title: 'Comment Title', body: 'LOL')
 puts "#{Comment.count}"

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
