class MarkupGenerator
  attr_reader :result
  def initialize(&block)
    instance_eval(&block)
  end
 
  private
 
  def method_missing(name, *args, &block)
    tag = name.to_s
    content = args.first
    @result ||= ''
    @result << "<#{tag}>"
    if block_given?
      instance_eval(&block)
    else
      @result << content
    end
    @result << "</#{tag}>"
  end
end
