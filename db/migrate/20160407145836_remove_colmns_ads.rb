class RemoveColmnsAds < ActiveRecord::Migration
    def up
  	remove_column :advertisements, :image_url
  end

  def down
  	add_column :advertisements, :image_url, :string
  end
end
