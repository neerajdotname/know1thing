module FrankHelpers

  def partial(*args)
    render_partial(*args)
  end

  def slidedeck
    result = []
    Pathname.new(File.dirname(__FILE__)).join("dynamic", "slidedeck").children.each do |child|
      slide_name = child.basename.to_s.gsub("_", "").gsub(".erb", "").gsub(".haml", "")
      result << render_partial("slidedeck/#{slide_name}", :slide_name => slide_name)
    end
    result.join("\n")
  end

end