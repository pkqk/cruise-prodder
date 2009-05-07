class CruiseProdder

  attr_accessor :server, :project
  attr_writer :port
  def port
    @port || 3333
  end

  def initialize(project = nil)
  end
  
  def build_finished(build)
    return if build.failed?
    if server and project
      Net::HTTP.new(server.to_s, port).post("/projects/build/#{project}",'')
    end
  end

end
