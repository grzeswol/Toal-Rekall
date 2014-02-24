class CreateTasks < ActiveRecord::Migration
  def change
		create_table :item do |i|
			i.text :content
			i.boolean :done
			i.timestamps
		end
  end
end
