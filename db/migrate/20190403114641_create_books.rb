class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :publisher_id
      t.integer :shop_id
      t.boolean :sold, default: false, null: false

      t.timestamps
    end
    add_index :books, :name
    add_index :books, :author
    add_index :books, :sold
    add_index :books, [:publisher_id, :shop_id],
              name: 'index_books_on_publisher_id_and_shop_id'
    add_index :books, [:shop_id, :publisher_id],
              name: 'index_books_on_shop_id_and_publisher_id'

  end
end
