class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      # taskとの紐付け
      t.references :task, null: false
      # コメントを入れる
      t.text :content, null: false
      t.timestamps
    end
  end
end
