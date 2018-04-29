class AddPhotosFields < ActiveRecord::Migration
  def change
        add_column :photos, :user_id, :integer
        add_column :photos, :type, :string
        add_column :photos, :sequence, :string
        add_column :photos, :active, :boolean, default: false
        add_column :photos, :url, :string
	      add_column :photos, :created_at, :datetime
    	  add_column :photos, :updated_at, :datetime    
  end
end
