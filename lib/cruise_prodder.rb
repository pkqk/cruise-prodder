class CruiseProdder

  def notifier_blocks
    @notifier_blocks || []
  end
  
  def fixed_notification(&block)
    (@notifier_blocks ||= []) << block
  end
  
  def build_fixed(fixed_build, previous_build)
    notifier_blocks.each do |block|
      block.call(fixed_build, previous_build)
    end
  end
  
end