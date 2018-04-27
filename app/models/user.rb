class User 
  attr_accessor :un, :pw, :fname, :lname
  def initialize(un, pw, fname, lname)
  @un = un
  @pw = pw
  @fname = fname
  @lname = lname
  end

def model_name
  @un = un
end

end
