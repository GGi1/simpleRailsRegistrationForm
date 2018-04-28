class User
  # @@ count will keep count of the number of objects created:
  @@count = 0
  attr_accessor :un, :pw, :email, :fname, :lname, :city, :state, :zip, :country, :other
  def initialize(un, pw, email, fname, lname, *other)
  @un = un
  @pw = pw
  @email = email
  @fname = fname
  @lname = lname
  @other = other.join(',')
  @city = "city"
  @state = "state"
  @zip = "zip"
  @country = "USA"
  @@count +=1
  end

def self.get_count
  @@count
end
#the User.get_count should return the number of created users


end
