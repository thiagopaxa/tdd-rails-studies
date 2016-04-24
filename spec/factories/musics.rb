FactoryGirl.define do
  factory :music do
    title {Faker::Name.title}
    name_author {Faker::Name.name}
    band nil
  end
end
