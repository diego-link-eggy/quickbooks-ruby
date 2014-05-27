# https://developer.intuit.com/docs/0025_quickbooksapi/0050_data_services/030_entity_services_reference/department

module Quickbooks
  module Model
    class Department < BaseModel
      XML_COLLECTION_NODE = "Department"
      XML_NODE = "Department"
      REST_RESOURCE = 'Department'

      xml_accessor :id, :from => 'Id', :as => Integer
      xml_accessor :sync_token, :from => 'SyncToken', :as => Integer
      xml_accessor :meta_data, :from => 'MetaData', :as => MetaData
      xml_accessor :name, :from => 'Name'
      xml_accessor :fully_qualified_name, :from => 'FullyQualifiedName'

      xml_accessor :sub_department?, :from => 'SubDepartment'
      xml_accessor :parent_ref, :from => 'ParentRef', :as => BaseReference

      xml_accessor :active?, :from => 'Active'

      reference_setters :parent_ref
    end
  end
end