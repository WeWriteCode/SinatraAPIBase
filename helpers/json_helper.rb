def build_meta(type, id)
  hostname = Socket.gethostname

  if (hostname == 'vagrant') || (hostname == 'precise64')
    domain = 'localhost:8888'
  else
    domain = 'production-domain.com'
  end

  meta_hash = Hash.new()
  meta_hash['links'] = Hash.new()
  meta_hash['links']['self'] = 'http://' + domain + '/' + type + '/' + id.to_s

  meta_hash
end
