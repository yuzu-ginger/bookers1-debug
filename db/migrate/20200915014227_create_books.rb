class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title  # [debug] titleカラム追加
      t.text :body

      t.timestamps
    end
  end
end
