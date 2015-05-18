# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'user1')
User.create(username: 'user2')
Role.create(name: 'Admin')
Role.create(name: 'Publisher')
Permission.create(name: 'Create users', action: 'create', subject_class: 'User')
Permission.create(name: 'Read users', action: 'read', subject_class: 'User')
Permission.create(name: 'Update users', action: 'update', subject_class: 'User')
Permission.create(name: 'Destroy users', action: 'destroy', subject_class: 'User')