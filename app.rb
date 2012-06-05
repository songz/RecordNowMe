require 'bundler/setup'
require 'sinatra'
require 'opentok'
require 'json'

OTSDK = OpenTok::OpenTokSDK.new '1127', 'moderator_token'

def printa a
  p "============"
  p "============"
  p "============"
  p "============"
  p "============"
  p "============"
  p a
  p "============"
  p "============"
  p "============"
  p "============"
  p "============"
end


get '/' do
  erb :main
end

post '/download' do
  archiveId = params['archiveId']
  printa archiveId
  otArchive = OTSDK.get_archive_manifest('9f39fcf0-303e-4b52-8a91-5f06800404d4', 'moderator_token')
  otVideoResource = otArchive.resources[0]
  videoId = otVideoResource.getId()
  url = otArchive.downloadArchiveURL(videoId, 'moderator_token')
  content_type :json
  return url.to_json
end
