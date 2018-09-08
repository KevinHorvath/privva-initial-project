class MenuTabBuilder < TabsOnRails::Tabs::TabsBuilder
  def tab_for(tab, name, options, html_options = {}, item_options = {})
    item_options[:class] = item_options[:class].to_s.split(' ').push('active').join(' ') if current_tab?(tab)
    content = @context.link_to(name, options, html_options)
    @context.content_tag(:li, content, item_options)
  end
end
