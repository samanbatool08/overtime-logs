user = User.create(first_name: "saman", last_name: "test", email: "saman@test.com", password: "asdasd", password_confirmation: "asdasd")
puts "1 user created"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: user.id)
end
puts "100 posts have been created"