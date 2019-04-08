module ContextService
  private

  def context_service
    Object.const_get "#{service_module}::#{controller_context}::#{action_context}"
  end

  def service_module
    ''
  end

  def controller_context
    convert_name(params[:controller])
  end

  def action_context
    convert_name(params[:action])
  end

  def convert_name(name)
    name = name.to_s.sub(/^[a-z\d]*/) { $&.capitalize }
    name.gsub(%r{(?:_|(/))([a-z\d]*)}) { "#{Regexp.last_match(1)}#{Regexp.last_match(2).capitalize}" }.gsub('/', '::')
  end
end
