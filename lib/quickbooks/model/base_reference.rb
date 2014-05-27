module Quickbooks
  module Model
    class BaseReference < BaseModel
      xml_convention :camelcase
      xml_accessor :name, :from => '@name' # Attribute with name 'name'
      xml_accessor :type, :from => '@type' 
      xml_accessor :value, :from => :content

      def initialize(value = nil)
        if BaseModel === value 
          self.value = value.id
          self.type = value.class.const_get(:XML_NODE)
        else  
          self.value = value
        end  
      end

      def to_i
        self.value.to_i
      end

      def to_s
        self.value.to_s
      end
    end
  end
end
