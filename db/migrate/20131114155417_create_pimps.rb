class CreatePimps < ActiveRecord::Migration
  def change
    create_table :pimps do |t|
      t.string :description

      t.timestamps
    end
  end
end
