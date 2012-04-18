
module Ohai
  module JSONCompatYajl
    def to_json
      ::Yajl::Encoder.new.encode(@data)
    end

    # Pretty Print this object as JSON
    def json_pretty_print(item=nil)
      ::Yajl::Encoder.new(:pretty => true).encode(item || @data)
    end
  end

  module JSONCompatJson
    def to_json
      ::JSON.generate(@data)
    end

    def json_pretty_print(item=nil)
      ::JSON.pretty_generate(item || @data)
    end
  end

end

begin
  require 'yajl'
  Ohai::JSONCompat = Ohai::JSONCompatYajl
rescue LoadError
  require 'json'
  Ohai::JSONCompat = Ohai::JSONCompatJson
end

