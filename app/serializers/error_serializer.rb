module ErrorSerializer
  def ErrorSerializer.serialize(errors)
    json = {}
    json_errors = errors.to_hash().map do |k, v|
      {field: k, reasons: v}
    end
    json[:error] = json_errors
    json
  end
end