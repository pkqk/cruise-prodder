class CruiseProdder

  attr_accessor :server, :project

  def initialize(project = nil)
  end

  def build_fixed(build, previous_build)
    if server and project
      trigger_cruise_control_build(server, project)
    end
  end
  
end