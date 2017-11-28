require 'aws-sdk-core'
require 'aws-sigv4'

require_relative 'recordapi-sdk/types'
require_relative 'recordapi-sdk/client_api'
require_relative 'recordapi-sdk/client'
require_relative 'recordapi-sdk/errors'
require_relative 'recordapi-sdk/resource'
require_relative 'recordapi-sdk/customizations'

# This module provides support for reinvent-record-api. This module is available in the
# `recordapi-sdk` gem.
#
# # Client
#
# The {Client} class provides one method for each API operation. Operation
# methods each accept a hash of request parameters and return a response
# structure.
#
# See {Client} for more information.
#
# # Errors
#
# Errors returned from reinvent-record-api all
# extend {Errors::ServiceError}.
#
#     begin
#       # do stuff
#     rescue Recordapi::Errors::ServiceError
#       # rescues all service API errors
#     end
#
# See {Errors} for more information.
#
# @service
module Recordapi

  GEM_VERSION = '1.0.0'

end
