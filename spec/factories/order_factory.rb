FactoryGirl.define do
  factory :order do
    name "John"
    address  "Some street"
    email  "John@gmail.com"
    pay_type  "Check"
    phone_number  "23456789"
  end
end