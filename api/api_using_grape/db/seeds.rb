15.times do
  Book.create!(isbn: Faker::Number.number(4), title:       Faker::Superhero.power, stock: Faker::Number.between(2, 19))
end
book_ids = Book.ids
95.times do
  Flow.create!(book_id: book_ids.sample, newStock:      Faker::Number.between(2, 15), previousStock:    Faker::Number.between(2, 15))
end