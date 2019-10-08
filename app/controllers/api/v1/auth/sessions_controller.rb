module Api
  module V1
    module Auth
      class SessionsController < DeviseTokenAuth::SessionsController
        include ExceptionHandler
        include ActAsApiRequest
        include DeviseTokenAuth::Concerns::SetUserByToken

        before_action :authenticate_api_v1_user!, only: :destroy

        def render_create_success
          render :create
        end

        def render_destroy_success
          head :no_content
        end

        def render_create_error_bad_credentials
          render_errors(I18n.t('errors.authentication.invalid_credentials'), :forbidden)
        end
      end
    end
  end
end