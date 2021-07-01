FactoryBot.define do
  factory :purchase_address do
    postal_code              {'150-0001'}
    municipality             {'横浜市'}
    delivery_source_id       {2}
    house_number             {'青山1-11'}
    building_name            {'柳ビル103'}
    phone_number             {'09011112222'}
    token                    {"tok_abcdefghijk00000000000000000"}
  end
end
