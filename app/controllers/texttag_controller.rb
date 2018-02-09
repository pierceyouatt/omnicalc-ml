class TexttagController < ApplicationController
  def autotag
    render("/text-tag/text-tag.html.erb")
  end
  def autotag_results
    @input = params.fetch("user_text")
    client = Algorithmia.client(ENV['ALGORITHMIA_KEY'])
    algo = client.algo('nlp/AutoTag/1.0.1')
    @results = algo.pipe(@input).result
    render("/text-tag/results.html.erb")
  end
end
