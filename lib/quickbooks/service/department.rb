module Quickbooks
  module Service
    class Department < BaseService

      def delete(department)
        department.active = false
        update(department, :sparse => true)
      end

      private

      def default_model_query
        "SELECT * FROM DEPARTMENT"
      end

      def model
        Quickbooks::Model::Department
      end
    end
  end
end
