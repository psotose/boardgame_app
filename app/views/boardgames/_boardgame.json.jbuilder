json.extract! boardgame, :id, :name, :rules, :created_at, :updated_at
json.url boardgame_url(boardgame, format: :json)
