require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

APP_CONFIG = YAML.load_file(File.expand_path('../application_config.yml', __FILE__))
CREDENTIALS = YAML.load_file(File.expand_path('../credentials.yml', __FILE__))

module HomePage
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.active_record.raise_in_transactional_callbacks = true
  end

  def self.default_feedback_emails
    @default_feedback_emails ||= APP_CONFIG[Rails.env]['emails']['feedback']
  end

  def self.admin_credentials
    @admin_credentials ||= CREDENTIALS[Rails.env]['admin']
  end
end
