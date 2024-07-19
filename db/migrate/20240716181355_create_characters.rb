class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.text :history
      t.float :height
      t.integer :intelligence
      t.integer :strength
      t.integer :dexterity
      t.integer :charisma
      t.integer :constitution
      t.integer :life
      t.integer :mana
      t.boolean :status
      t.boolean :ready
      t.references :campaign, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
