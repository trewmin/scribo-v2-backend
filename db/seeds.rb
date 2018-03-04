# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  name = Faker::Pokemon.unique.name
  User.create(user_name: name, password: name, first_name: name, last_name: name, email: "#{name}@#{name}.com")
end

5.times do
  Lecture.create(title: Faker::Pokemon.unique.location, date_time: (DateTime.now + 7 + Random.rand(20)), admin: User.all.sample)
end

User.all.each do
  |user|
  lecture = Lecture.all.sample
  if lecture.admin != user
    user.lectures.push(Lecture.all.sample)
  end
end

Notebook.all.each do
  |notebook|
  notebook.content = Faker::Pokemon.unique.move
  notebook.save
end
