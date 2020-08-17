class CreatePageExcerpt < ActiveRecord::Migration[4.2]
  def change
    add_column :alchemy_pages, :long_excerpt, :text
    add_column :alchemy_pages, :short_excerpt, :text

  end

end
