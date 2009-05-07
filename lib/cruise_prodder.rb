class CruiseProdder
  
  class Proddee
    def initialize(server, project, port)
      @server, @project, @port = server, project, port
    end

    def trigger
      Net::HTTP.new(@server.to_s, @port).post("/projects/build/#{@project}",'')
    end
  end

  def initialize(project = nil)
    @proddees = []
  end
  
  def notify(server, project, port=3333)
    @proddees << Proddee.new(server, project, port)
  end
  
  def build_finished(build)
    return if build.failed?
    @proddees.each { |proddee| proddee.trigger }
  end

end
