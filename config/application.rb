require_relative 'boot'

require 'rails/all'
require 'pry'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AddressSearch
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.default_locale = :"pt-BR"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
    	# binding.pry
	  # "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
	  class_attr_index = html_tag.index 'class="'

	  if class_attr_index
	    html_tag.insert class_attr_index+7, 'default_rails_error '
	  else
	    html_tag.insert html_tag.index('>'), ' class="default_rails_error"'
	  end
	  html_tag.html_safe
	}
  end
end
