class CreatePageTranslations < ActiveRecord::Migration[4.2]
  def up
    create_table "alchemy_page_translations" do |t|
      t.references :from, index: true, foreign_key: {to_table: :alchemy_pages}
      t.references :to, index: true, foreign_key: {to_table: :alchemy_pages}

      t.references   :language

    end
  end

  def down
    drop_table :alchemy_page_translations
  end
end
