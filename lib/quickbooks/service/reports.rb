module Quickbooks
  module Service
    class Reports < BaseService


      # https://developer.intuit.com/docs/0025_quickbooksapi/0053_auth_auth/oauth_management_api#Reconnect
      def reports report_name,params
        result = nil
        #params = {:date_macro=>"This Fiscal Year-to-date"}

        url = add_query_string_to_url("#{url_for_base}/reports/#{report_name}",params)
        response = do_http_get(url)
        if response
          code = response.code.to_i
          if code == 200
            result = response.plain_body
          end
        end

        result
      end

    end
  end
end
