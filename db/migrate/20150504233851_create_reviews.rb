class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.text :content
      t.belongs_to :user
      t.belongs_to :check_in

      t.timestamps null: false
    end
  end
end
