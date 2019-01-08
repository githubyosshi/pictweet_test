FactoryGirl.define do

  factory :user do
    # nickname              "abe"
    # email                 "kkk@gmail.com"
    # password              "00000000"
    # password_confirmation "00000000"
    password = Faker::Internet.password(8)
    name Faker::Name.last_name
    email Faker::Internet.free_email
    password password
    password_confirmation password
  end

end
