class CreatePageTranslations < ActiveRecord::Migration
  def up
    create_table "alchemy_page_translations" do |t|
      t.references   :page, "from"
      t.references   :page, "to"
      t.references   :language

    end
  end

  def down
    drop_table :alchemy_page_translations
  end
end
