class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :location
      t.string :type
      t.text :description
      t.string :website_url
      t.string :facebook_url

      t.timestamps
    end
  end
end
