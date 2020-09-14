class CreateBookAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :book_authors do |t|
      t.bigint :author_id
      t.bigint :book_id

      t.timestamps
    end
  end
end
