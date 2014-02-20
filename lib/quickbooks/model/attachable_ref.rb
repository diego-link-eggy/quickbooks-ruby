module Quickbooks
  module Model
    class AttachableRef < BaseModel
      XML_COLLECTION_NODE = "AttachableRef"
      XML_NODE = "AttachableRef"

      xml_accessor :entity_ref, :from => 'EntityRef', :as => BaseReference
      xml_accessor :line_info, :from => 'LineInfo'
      xml_accessor :include_on_send?, :from => 'IncludeOnSend'
      xml_accessor :inactive?, :from => 'Inactive'
      xml_accessor :no_ref_only?, :from => 'NoRefOnly'

      reference_setters :entity_ref


    end
  end
end
