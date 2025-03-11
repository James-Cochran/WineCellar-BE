class WineSerializer
  include JSONAPI::Serializer

  set_type :wine
  attributes :name, :wine_type, :rating, :notes
end
