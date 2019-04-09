module Alchemy
  class PageTranslation < ActiveRecord::Base
    belongs_to :from, class_name: "Alchemy::Page", inverse_of: :translations_relation
    belongs_to :to, class_name: "Alchemy::Page",  inverse_of: :translates_relation


  end
end
