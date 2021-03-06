require 'rails'
require 'graphql'
require 'devise_token_auth'

module GraphqlDevise
  class Error < StandardError; end

  class InvalidMountOptionsError < GraphqlDevise::Error; end

  @schema_loaded     = false
  @mounted_resources = []

  def self.schema_loaded?
    @schema_loaded
  end

  def self.load_schema
    @schema_loaded = true
  end

  def self.mount_resource(resource)
    @mounted_resources << resource
  end

  def self.resource_mounted?(resource)
    @mounted_resources.include?(resource)
  end
end

require 'graphql_devise/concerns/controller_methods'
require 'graphql_devise/schema'
require 'graphql_devise/types/authenticatable_type'
require 'graphql_devise/types/credential_type'
require 'graphql_devise/types/mutation_type'
require 'graphql_devise/types/query_type'
require 'graphql_devise/default_operations/mutations'
require 'graphql_devise/default_operations/resolvers'
require 'graphql_devise/resolvers/dummy'

require 'graphql_devise/engine'
require 'graphql_devise/version'
require 'graphql_devise/error_codes'
require 'graphql_devise/user_error'
require 'graphql_devise/detailed_user_error'

require 'graphql_devise/mount_method/option_sanitizer'
require 'graphql_devise/mount_method/options_validator'
require 'graphql_devise/mount_method/operation_preparer'
require 'graphql_devise/mount_method/operation_sanitizer'
