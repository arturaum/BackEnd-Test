class CreateCompositions < ActiveRecord::Migration[5.1]
  def change
    create_table :compositions do |t|
      t.string :author
      t.string :name

      t.timestamps
    end
    add_index :compositions, :author
    add_index :compositions, :name
  end
end
