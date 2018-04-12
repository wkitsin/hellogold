# module Users
  class RegistrationsController < Devise::RegistrationsController

    def create
    	build_resource(sign_up_params)

      resource_saved = resource.save
      yield resource if block_given?
      if resource_saved
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          redirect_to root_path
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          redirect_to root_path
        end
      else
        clean_up_passwords resource
        @validatable = devise_mapping.validatable?
        if @validatable
          @minimum_password_length = resource_class.password_length.min
        end
        redirect_to root_path
      end
    end

    protected

    def sign_up_params
        params[:user].permit(:email, :password, :password_confirmation, :role)
    end

  end
# end
