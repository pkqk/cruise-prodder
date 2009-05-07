class CruiseProdder

  attr_accessor :server, :project
  attr_reader :port
  def port
    @port || 3333
  end

  def initialize(project = nil)
  end
  
  def build_finished(build)
    puts("Build finished")
    return if build.failed?
    puts("Triggering build of #{project} on #{server}:#{port}")
    if server and project
      Net::HTTP.new(server.to_s, port).post("/projects/build/#{project}",'')
    end
  end

end