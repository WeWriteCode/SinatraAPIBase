def required_params_check(required_params)
  required_params.each do | param |
    if params[param].nil?
      required_params_exception(param)
    end
  end
end

def current_user
  # You could do something here to find a User object
end

def json_results(results, pretty = false, debug = false)
  if pretty || params[:pretty] == "1"
    if debug || request.env['HTTP_DEBUG'] == "1"
      puts JSON.pretty_generate(results)
    end

    JSON.pretty_generate(results)
  else
    if debug || request.env['HTTP_DEBUG'] == "1"
      puts results.to_json
    end

    results.to_json
  end
end
