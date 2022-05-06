User.create!(id: 0,
             name:  "Example User",
             email: "example@railstutorial.org",
             birthday: Time.zone.now,
             address:   "foobar")

99.times do |n|
        
    id = n+1
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    birthday = Time.zone.now - n
    User.create!(id: id,
                name: name,
                email: email,
                birthday:              birthday)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }