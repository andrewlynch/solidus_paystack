# Configure Solidus Preferences
# See http://docs.solidus.io/Spree/AppConfiguration.html for details

# Solidus version defaults for preferences that are not overridden
#Spree.load_defaults '3.2.0.alpha'

Spree.config do |config|
  # Core:
  # Default currency for new sites
  config.currency = "USD"

  # from address for transactional emails
  config.mails_from = "store@example.com"

  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false

  # When set, product caches are only invalidated when they fall below or rise
  # above the inventory_cache_threshold that is set. Default is to invalidate cache on
  # any inventory changes.
  # config.inventory_cache_threshold = 3

  # Configure adapter for attachments on products and taxons (use ActiveStorageAttachment or PaperclipAttachment)
  config.image_attachment_module = 'Spree::Image::ActiveStorageAttachment'
  config.taxon_attachment_module = 'Spree::Taxon::ActiveStorageAttachment'

  # Defaults
  # Permission Sets:

  # Uncomment and customize the following line to add custom permission sets
  # to a custom users role:
  # config.roles.assign_permissions :role_name, ['Spree::PermissionSets::CustomPermissionSet']


  # Frontend:

  # Custom logo for the frontend
  # config.logo = "logo/solidus.svg"

  # Template to use when rendering layout
  # config.layout = "spree/layouts/spree_application"


  # Admin:

  # Custom logo for the admin
  # config.admin_interface_logo = "logo/solidus.svg"

  # Gateway credentials can be configured statically here and referenced from
  # the admin. They can also be fully configured from the admin.
  #
  config.static_model_preferences.add(
    SolidusPaystack::PaymentMethod,
    'paystack_env_credentials',
    public_api_key: ENV['PAYSTACK_PUBLIC_KEY'],
    private_api_key: ENV['PAYSTACK_SECRET_KEY'],
    currency: ENV['CURRENCY'],
    # server: Rails.env.production? ? 'production' : 'test',
    test_mode: !Rails.env.production?
  )
end




Spree.user_class = "Spree::LegacyUser"

# Rules for avoiding to store the current path into session for redirects
# When at least one rule is matched, the request path will not be stored
# in session.
# You can add your custom rules by uncommenting this line and changing
# the class name:
#
# Spree::UserLastUrlStorer.rules << 'Spree::UserLastUrlStorer::Rules::AuthenticationRule'
