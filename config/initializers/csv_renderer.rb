ActionController::Renderers.add :csv do |obj, options|
  csv = obj.respond_to?(:to_csv) ? obj.to_csv(options) : obj

  if filename = options[:filename]
    send_data csv, type: Mime[:csv], disposition: "attachment; filename=#{filename}.csv"
  else
    self.content_type   ||= Mime[:csv]
    self.response_body  = csv
  end
end
