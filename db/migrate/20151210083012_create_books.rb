class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.monetize :price, currency: { present: false }

      t.timestamps null: false
    end
  end
end
