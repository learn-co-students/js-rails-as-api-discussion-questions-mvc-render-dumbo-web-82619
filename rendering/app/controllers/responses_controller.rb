class ResponsesController < ApplicationController
  require 'csv'

  def plain
    data = "Early bird gets the worm. But cookie taste better than worm. So me sleep in. - Cookie Monster"
    render plain: data
  end

  def html
    data = "<html>
              <body>
                <q>Early bird gets the worm. But cookie taste better than worm. So me sleep in.</q>
                <cite>Cookie Monster</cite>
              </body>
            </html>".html_safe
    render html: data
  end

  def json
    data = {
      author: "Cookie Monster",
      quote:"Early bird gets the worm. But cookie taste better than worm. So me sleep in.",
    }
    render json: data
  end

  def xml
    data = "<quote>
    <author>Cookie Monster</author>
    <text>Early bird gets the worm. But cookie taste better than worm. So me sleep in.</text>
    </quote>"
    render xml: data
  end

  def csv
    data =  CSV.generate do |csv|
      csv << ["author", "name"]
      csv << ["Cookie Monster", "Early bird gets the worm. But cookie taste better than worm. So me sleep in."]
      send_data data, filename: 'cookie'
    end
  end

  def png
    filename = "public/data.png"
    send_file filename
  end
end
