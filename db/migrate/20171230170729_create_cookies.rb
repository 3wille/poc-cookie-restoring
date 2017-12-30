class CreateCookies < ActiveRecord::Migration[5.1]
  def change
    create_table :cookies do |t|
      t.string :cookie_string
      t.string :address

      t.timestamps
    end
  end
end
