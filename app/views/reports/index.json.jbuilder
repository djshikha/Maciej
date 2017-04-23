json.array!(@reports) do |report|
  json.extract! report, :id, :desc, :sql
  json.url report_url(report, format: :json)
end
