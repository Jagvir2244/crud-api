class ProductSerializer
  include JSONAPI::Serializer
  attributes :name, :color, :brand
end
