class CreatePrescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.text :content
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
