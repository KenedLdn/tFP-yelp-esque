class AddSlugToPlace < ActiveRecord::Migration
  def change
    add_column :places, :cached_slug, :string
  end
end
