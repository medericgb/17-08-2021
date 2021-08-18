require "sinatra"
require "rest-client"
require "json"

get "/" do
    return "Covid Tracker"
end

# Get covid data
get "/api/covid/all-countries" do
    content_type :json
    url = "https://corona.lmao.ninja/v2/countries/"
    response = RestClient.get(url)
    data = JSON.parse(response)
    return data.to_json
end

# Get covid data for a country
get "/api/covid/country/:country" do
    content_type :json
    country = params['country']
    url = "https://corona.lmao.ninja/v2/countries/#{country}"
    response = RestClient.get(url)
    data = JSON.parse(response)
    return data.to_json
end

# Covid Tracker Render
get "/covid-tracker" do
    send_file "index.html"
end