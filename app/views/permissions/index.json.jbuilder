json.array!(@permissions) do |permission|
  json.extract! permission, :id, :action, :subject_class, :name
  json.url permission_url(permission, format: :json)
end
