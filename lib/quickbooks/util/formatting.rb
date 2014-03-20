module Quickbooks
  module Util
    module Formatting
      def format_time(time)
        time.strftime("%Y-%m-%dT%H:%M:%S%:z")
      end
      module_function :format_time
    end
  end
end
