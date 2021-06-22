FactoryBot.define do
  factory :item do
    title                 {'Tシャツ'}
    info                  {'東京の若者に人気なブランドです！'}
    category_id           {2}
    condition_id          {2}
    delivery_charge_id    {2}
    delivery_source_id    {2}
    delivery_day_id       {2}
    price                 {12000}
    association :user
  end
end
