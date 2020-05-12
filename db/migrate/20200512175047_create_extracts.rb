class CreateExtracts < ActiveRecord::Migration[6.0]
  def change
    create_table :extracts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type_transaction
      t.float :value
      t.references :account, null: false, foreign_key: true
      t.float :tax

      t.timestamps
    end
  end
end
