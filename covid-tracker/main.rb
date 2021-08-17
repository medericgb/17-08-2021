require "sinatra"
require "rest-client"
require "json"

get "/" do
    return "Covid Tracker"
end

# Get covid data
get "/api/covid/all" do
    content_type :json
    url = "https://api.covid19api.com/summary"
    response = RestClient.get(url)
    data = JSON.parse(response)
    return data.to_json
end

# Get covid data for a country
get "/api/covid/country/:country" do
    content_type :json
    country = params['country']
    url = "https://api.covid19api.com/total/country/#{country}"
    response = RestClient.get(url)
    data = JSON.parse(response)
    return data.to_json
end

# Get covid data for a country last infos
get "/api/covid/country/:country/last" do
    content_type :json
    country = params['country']
    url = "https://api.covid19api.com/total/country/#{country}"
    response = RestClient.get(url)
    data = JSON.parse(response)
    return data.last.to_json
end