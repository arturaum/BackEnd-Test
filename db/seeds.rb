# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Composition.find_or_create_by!(name: 'Евгений Онегин', author: 'А.С. Пушкин')
Composition.find_or_create_by!(name: 'Борис Годунов', author: 'А.С. Пушкин')
Composition.find_or_create_by!(name: 'Медный всадник', author: 'А.С. Пушкин')
Composition.find_or_create_by!(name: 'Преступление и наказание', author: 'Ф.М. Достоевский')
Composition.find_or_create_by!(name: 'Бесы', author: 'Ф.М. Достоевский')
Composition.find_or_create_by!(name: 'Generation П', author: 'В.О. Пелевин')
Composition.find_or_create_by!(name: 'Властелин колец', author: 'Д.Р. Толкин')

Publisher.find_or_create_by!(name: 'ЛитРес')
Publisher.find_or_create_by!(name: 'Аврора')
Publisher.find_or_create_by!(name: 'Литературная Россия')

Shop.find_or_create_by!(name: 'Книгомир')
Shop.find_or_create_by!(name: 'Дом книги')
Shop.find_or_create_by!(name: 'Впендюрь книгу')

Book.destroy_all

composition_ids = Composition.ids
composition_ids = composition_ids.sample(rand(4..composition_ids.length))
publisher_ids = Publisher.ids
publisher_ids = publisher_ids.sample(rand(1..publisher_ids.length)) +
    publisher_ids.sample(rand(1..publisher_ids.length))
shop_ids = Shop.ids
shop_ids = shop_ids.sample(rand(2..shop_ids.length)) +
    shop_ids.sample(rand(2..shop_ids.length)) +
    shop_ids.sample(rand(2..shop_ids.length))

# Генерируем книги
composition_ids.each do |ci|
  publisher_ids.each do |pi|
    shop_ids.each do |si|

      Book.create! composition_id: ci,
                   publisher_id: pi,
                   shop_id: si,
                   sold: rand(10) > 3

    end
  end
end
