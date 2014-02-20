module Quickbooks
  module Service
    class Upload < BaseService
      def create(entity, image_data)
        raise Quickbooks::InvalidModelException.new(entity.errors.full_messages.join(',')) unless entity.valid?
        options = {}
        xml = entity.to_xml_ns(options)
        log "------ New Attachable ------"
        log xml

        boundary="WUlKV_AtI1-uGU0dtt-ebGl0zL9pZudYnaI8t2g"

        headers = {}
        headers['Accept'] = 'application/xml'
        headers['Content-Type'] = "multipart/form-data; boundary=#{boundary}"
        headers['Accept-Encoding'] =  'gzip, deflate'

        body = ""
        # headers['Content-Type'] =  'image/jpeg'
        #headers['Content-Disposition'] =  "multipart/form-data; boundary=#{boundary}"

        # body += "Content-Type: multipart/form-data; boundary=#{boundary}\r\n"


        body += "\r\n--#{boundary}\r\n"

        body += "Content-Disposition: form-data; name=\"file_metadata_1\"\r\nContent-Type: application/xml; charset=UTF-8\r\nContent-Transfer-Encoding: 8bit\r\n\r\n"

        # body += 'Content-Disposition: form-data; name="file_metadata_1"'
        # body += 'Content-Type: application/xml; charset=UTF-8'
        # body += '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        # <Attachable xmlns="http://schema.intuit.com/finance/v3">'
        # body +="
        #     <FileName>capture.jpg</FileName>
        #     <ContentType>image/jpeg</ContentType>
        #     <Lat>25.293112341223</Lat>
        #     <Long>-21.3253249834</Long>
        #     <PlaceName>Fake Place</PlaceName>
        #     <Note>This is a picture of Yujungs dog eating bubbles</Note>
        #     <Tag>Sammie</Tag>
        #     <Size>#{}</Size>
        # </Attachable>"

        body += '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
       
        body += "\r\n" 

        body +=  xml

        body += "\r\n--#{boundary}\r\n"
       

        body += "Content-Disposition: form-data; name=\"file_content_1\"; filename=\"capture.jpg\"\r\nContent-Type: image/jpeg\r\nContent-Transfer-Encoding: binary\r\n\r\n"
        # body += 'Content-Disposition: form-data; name="file_content_1"; filename="capture.jpg"
        #          Content-Type: image/jpeg
        #          Content-Transfer-Encoding: binary

        #          '

        #body += "Content-Disposition: form-data; name=\"file_content_1\"; filename=\"capture.jpg\"\r\nContent-Type: image/jpeg\r\n"
        body += image_data  
        
        body += "--#{boundary}--\r\n"


 






        url = url_for_resource(model.resource_for_singular) + '?'

        log "------ New Req url ------"
        log url
        log "------ New Req headers------"
        log headers
        log "------ New Req body------"
        log "BODY(#{body.class}) = #{body == nil ? "<NIL>" : body.inspect}"
        #log body
        response = @oauth.post(url, body, headers)
        #check_response(response)

        log "RESPONSE CODE = #{response.code}"
        log "RESPONSE BODY = #{response.plain_body}"
        status = response.code.to_i

        nil
        # #response = do_http_post(url, body, nil, headers)
        # if response.code.to_i == 200
        #   model.from_xml(parse_singular_entity_response(model, response.plain_body))
        # else
        #   nil
        # end
      end
      
      private
     
      def model
        Quickbooks::Model::Attachable
      end

    end
  end
end
