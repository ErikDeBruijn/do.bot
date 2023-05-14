class WellKnownController < ApplicationController
  def ai_plugin
    @base_uri = base_uri
    @app_name = app_name
  end

  def openapi
    response.headers['Content-Disposition'] = 'inline'
    @base_uri = base_uri
    @app_name = app_name

    render plain: render_to_string('well_known/openapi', layout: false), content_type: 'text/yaml'
  end

  def app_name = "TO.DO.bot Plugin"

  def base_uri
    "#{request.protocol}#{request.host}#{":#{request.port}" if ![80, 443].include?(request.port)}"
  end
end
