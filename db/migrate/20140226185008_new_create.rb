class NewCreate < ActiveRecord::Migration
  def change
		create_table :tasks do |t|
			t.text :content
			t.boolean :complete
			t.timestamps
		end
  end
end
