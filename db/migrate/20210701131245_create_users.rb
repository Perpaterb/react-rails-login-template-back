class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :googleId
      t.string :password
      t.string :imageUrl
      t.string :familyName
      t.string :givenName

      t.timestamps
    end
  end
end
