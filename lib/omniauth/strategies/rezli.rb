require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Rezli < OmniAuth::Strategies::OAuth2
      option :name, :rezli

      option :client_options, {
        :site => "https://www.rezli.com",
        :authorize_url => "/oauth/authorize",
        :token_url => "/oauth/token",
      }

      uid { raw_info["id"] }

      info do
        prune!({
          'verified_email' => raw_info['email'],
        })
      end

      extra do
        hash = {}
        hash['raw_info'] = raw_info unless skip_info?
        prune! hash
      end

      def raw_info
        @raw_info ||= access_token.get('/api/me.json').parsed
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end
