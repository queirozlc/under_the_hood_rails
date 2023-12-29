class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.text :bio
      t.string :avatar
      t.string :github_url
      t.string :website_url
      t.string :linkedin_url

      t.timestamps
    end
  end
end
