class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.integer :member_count

      t.timestamps null: false
    end
  end
end
