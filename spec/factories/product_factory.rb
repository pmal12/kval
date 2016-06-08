FactoryGirl.define do
  factory :product do
    title "Sometitle"
    description "description"
    image_file_name "something.jpg"
    category_id "3"
    price "4.89"
  end
end