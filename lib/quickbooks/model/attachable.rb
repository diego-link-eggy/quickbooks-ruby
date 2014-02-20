module Quickbooks
  module Model
    class Attachable < BaseModel
      XML_COLLECTION_NODE = "Attachable"
      XML_NODE = "Attachable"
      REST_RESOURCE = 'upload'

      xml_accessor :id, :from => 'Id', :as => Integer
      xml_accessor :sync_token, :from => 'SyncToken', :as => Integer
      xml_accessor :meta_data, :from => 'MetaData', :as => MetaData
      xml_accessor :file_access_uri, :from => 'FileAccessUri', :as => Integer
      xml_accessor :content_type, :from => 'ContentType'
      xml_accessor :file_name, :from => 'FileName'
      xml_accessor :attachable_ref, :from => 'AttachableRef', :as => AttachableRef
      xml_accessor :size, :from => 'Size', :as => Integer

    end
  end
end
