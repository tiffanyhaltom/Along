class CreateRoadtrips < ActiveRecord::Migration
  def change
    create_table :roadtrips do |t|
      t.string :name
      t.string :origin
      t.string :destination
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
