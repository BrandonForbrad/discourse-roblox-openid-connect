# frozen_string_literal: true

require "faraday/logging/formatter"

class OIDCFaradayFormatter < Faraday::Logging::Formatter
  def request(env)
    warn <<~LOG
      RBXOIDC Debugging: request #{env.method.upcase} #{env.url.to_s}

      Headers: #{env.request_headers}

      Body: #{env[:body]}
    LOG
  end

  def response(env)
    warn <<~LOG
      RBXOIDC Debugging: response status #{env.status}

      From #{env.method.upcase} #{env.url.to_s}

      Headers: #{env.response_headers}

      Body: #{env[:body]}
    LOG
  end
end
