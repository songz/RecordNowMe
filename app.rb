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
  otArchive = OTSDK.get_archive_manifest(archiveId, 'moderator_token')
  otVideoResource = otArchive.resources[0]
  videoId = otVideoResource.getId()
  url = otArchive.downloadArchiveURL(videoId, 'moderator_token')
  content_type :json
  return url.to_json
end
