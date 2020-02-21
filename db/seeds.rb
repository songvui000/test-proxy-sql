# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


companies = [
  {
    name: 'anhviet',
    subdomain: 'anhviet'
  },
  {
    name: 'vuhan',
    subdomain: 'wuhan'
  },
  {
    name: 'donglao',
    subdomain: 'donglao'
  }
]

Admin.create(
  name: 'admin',
)

companies.each do |com|
  Company.create(com)
  Apartment::Tenant.create(com[:subdomain])
  Apartment::Tenant.switch! com[:subdomain]
  User.create(
    name: com[:name],
  )
end
