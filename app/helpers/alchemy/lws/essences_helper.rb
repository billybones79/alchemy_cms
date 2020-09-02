module Alchemy
  module Lws
    module EssencesHelper
      # Adds class attribute to the rendered HTML of an EssenceRichtext essence
      # via its Alchemy::Content because:
      # - Method Alchemy::ElementsBlockHelper::ElementViewHelper#render cannot add
      #   HTML attributes to EssenceRichtext essences via its third argument for
      #   unknown reasons;
      # - Alchemy::Content has an ingredient setter while other modules do not
      #   (ex: Alchemy::ElementsBlockHelper::ElementViewHelper).
      #
      # This helper performs a single string substitution on <p> tags and thus
      # isn't robust, idempotent nor compatible with other essences (I'm a newb).
      #
      # TO DO: Convert class_string into a Hash to support attributes other than
      # "class" (ex: html_attributes = {class: "...", id: "...", ...}).
      def add_class_to_richtext_content(content, class_string)
        content.ingredient = content.ingredient.gsub('<p', "<p class=\"#{class_string}\"")
      end
    end
  end
end
