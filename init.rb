require 'redmine'

Redmine::Plugin.register :redmine_pdf_macro do
  name 'Redmine PDF Macro'
  author 'Jorge Rodriguez <Jorge.rodriguez@forgeservicelab.fi>'
  description 'Allows a pdf file to be embeded'
  version '0.0.1'

  Redmine::WikiFormatting::Macros.register do
    desc "Embed a PDF file"
    macro :pdf do |obj, args|
      content = %Q{<object data="#{args[0]}" type="application/pdf" width="100%"
 height="100%">
  <p>It appears you don't have a PDF plugin for this browser.
  No biggie... you can <a href="#{args[0]}">click here to download the PDF file.
</a></p>
</object>}

      return "#{ CGI::unescapeHTML(content) }".html_safe
    end

  end
end

