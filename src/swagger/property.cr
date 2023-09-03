require "json"

module Swagger
  struct Property
    include JSON::Serializable

    def self.use_reference(name : String)
      new(ref: "#/components/schemas/#{name}")
    end

    property name
    property type
    property format
    property items
    property description
    property default_value
    property example
    property required

    @[JSON::Field(key: "$ref")]
    getter ref : String? = nil

    def initialize(@name : String, @type : String = "string", @format : String? = nil,
                   @items : String? = nil, @description : String? = nil,
                   @default_value : (String | Int32 | Int64 | Float64 | Bool)? = nil,
                   @example : (String | Int32 | Int64 | Float64 | Bool)? = nil,
                   @required : Bool? = nil, @ref : String? = nil)
    end
  end
end
