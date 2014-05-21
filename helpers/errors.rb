def app_error(message)
  output = {results: {
      message: message
  }}

  halt 500, output.to_json
end

def required_params_exception(missing_param)
  output = {results: {
      message: "#{missing_param} is required"
  }}

  halt 400, output.to_json
end

def bad_oauth_exception
  output = {results: {
      message: "The oAuth token was provided but was invalid"
  }}

  halt 401, output.to_json
end

def bad_client_exception
  output = {results: {
      message: "The client_id was provided but was invalid"
  }}

  halt 401, output.to_json
end

def not_authorized(message)
  output = {results: {
      message: message
  }}

  halt 403, output.to_json
end

def not_allowed
  output = {results: {
      message: "This end point is not allowed."
  }}

  halt 405, output.to_json
end

def not_implemented(method = nil)
  output = {results: {
      message: "This end point has not been completely implemented yet: #{method}"
  }}

  halt 501, output.to_json
end

def oauth_client_create_error(messages)
  output = {results: {
      message: "Creating an app failed.",
      errors: [
        messages.each do |message|
          {error: message}
        end
      ]
  }}

  halt 500, output.to_json
end