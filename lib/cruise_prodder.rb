class CruiseProdder

  attr_accessor :server, :project
  attr_reader :port
  def port
    @port || 3333
  end

  def initialize(project = nil)
  end

  def build_fixed(build, previous_build)
    if server and project
      Net::HTTP.new(server.to_s, port).post("/projects/build/#{project}",'')
      CruiseControl::Log.event("Triggering build of #{project} on #{server}:#{port}")
    end
  end
  
end