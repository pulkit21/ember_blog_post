class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :post_path
end
