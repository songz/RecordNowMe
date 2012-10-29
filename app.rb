require 'sinatra'
require 'opentok'
require 'json'
require 'awesome_print'

# ============ Configuration =========
# FOR documentation notes, please visit our github page:
# https://github.com/opentok/Opentok-Ruby-SDK
# REPLACE WITH YOUR API KEY
API_KEY = ENV['TB_KEY']
# REPLACE WITH YOUR API SECRET
API_SECRET = ENV['TB_SECRET']
# Since we're not doing group video chats, we can simply use a pre-existing session
SESSIONID = "2_MX4yMDc1MjM4MX4xMjcuMC4wLjF-TW9uIE9jdCAwOCAxNToyMjoxMyBQRFQgMjAxMn4wLjg2NzY5ODU1fg"
# =========== End of Configuration ====

# Creating an OpenTok Object
OTSDK = OpenTok::OpenTokSDK.new API_KEY, API_SECRET

get '/' do
  # You need your key and valid token to create a standalone recorder
  # Tokens expire after 24 hours so we have to generate them
  @key = API_KEY
  @token = OTSDK.generateToken :session_id => SESSIONID, :role => OpenTok::RoleConstants::MODERATOR
  erb :main
end

post '/download' do
  # Tokens expire after 24 hours so we have to generate them
  token = OTSDK.generateToken :session_id => SESSIONID, :role => OpenTok::RoleConstants::MODERATOR
  archiveId = params['archiveId']

  # First, get an archive Manifest, which contains details about the archive
  otArchive = OTSDK.get_archive_manifest(archiveId, token)

  # Each archive resource is a video. Since we are using standalone Recorder,
  # There will only be one video in the first index
  otVideoResource = otArchive.resources[0]

  # From the resource, get the videoID
  videoId = otVideoResource.getId()

  # With the VideoID, we can now retrieve the download URL
  response = otArchive.downloadArchiveURL(videoId, token)
  content_type :json
  return response.to_json
end
