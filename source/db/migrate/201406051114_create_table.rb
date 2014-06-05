class CreateTable < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :username
			t.string :password
			t.string :email
			t.timestamps
		end
		create_table :tweets do |t|
			t.string :content
			t.belongs_to :user
			t.timestamps
		end
	end
end