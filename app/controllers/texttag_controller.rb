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
  def colorize
    render("/colorize/colorize.html.erb")
  end
  def colorize_results
    @input = params.fetch("user_url")
    input = {image: @input}
    client = Algorithmia.client(ENV['ALGORITHMIA_KEY'])
    algo = client.algo('deeplearning/ColorfulImageColorization/1.1.7')
    @results = algo.pipe(input).result
    result_output = @results['output']
    algorithmia_path = result_output.split("data://")[1]
    @original_image_url = params[:image_url]
    @colorized_image_url = "https://algorithmia.com/v1/data/#{algorithmia_path}"
    render("/colorize/results.html.erb")
  end
  def imagetag
    render("/imagetag/imagetag.html.erb")
  end
  def imagetag_results
    @input = params.fetch("user_url")
    input = {image: @input}
    client = Algorithmia.client(ENV['ALGORITHMIA_KEY'])
    algo = client.algo('deeplearning/IllustrationTagger/0.4.0')
    @results = algo.pipe(input).result
    render("/imagetag/results.html.erb")   
  end
end
