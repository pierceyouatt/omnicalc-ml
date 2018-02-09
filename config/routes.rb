Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get("/text-tag", {:controller => "texttag", :action => "autotag"})
  get("/text-tag/results", {:controller => "texttag", :action => "autotag_results"})
  get("/colorize", {:controller => "texttag", :action => "colorize"})
  get("/colorize/results", {:controller => "texttag", :action => "colorize_results"})
end
