json.extract! reply, :id, :sender, :body, :message_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)
