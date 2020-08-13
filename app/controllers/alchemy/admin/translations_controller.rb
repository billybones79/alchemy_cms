module Alchemy
  module Admin
    class TranslationsController < Alchemy::Admin::BaseController

      before_action :load_page, except: :reload_page_select

      authorize_resource class: Alchemy::PageTranslation



      def load_page
        @page = Page.find(params[:id])
      end

      def create

        if params[:page_id].blank?
          @page.translate_in params[:language_id]

        else
          @page.link_translation Alchemy::Page.find(params[:page_id])

        end

        do_redirect_to edit_admin_page_path id: (@page.translations.where("alchemy_page_translations.language_id = ?", params[:language_id])).last.id and return

      end

      def unlink
        @page.unlink_translation params[:to]
        redirect_back_or_to_default
      end

      def reload_page_select
        @language = params[:language_id]
        respond_to do |format|
          format.html {}
          format.js {}
        end
      end

    end
  end

end
