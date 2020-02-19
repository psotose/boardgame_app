class Boardgame < ApplicationRecord
    has_many_attached :pieces_images 
    has_many_attached :boards_images
end
