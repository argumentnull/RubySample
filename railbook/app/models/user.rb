class User < ActiveRecord::Base
  def self.authenticate(username, password)
    usr = find_by(username: username)
    if usr != nil && usr.password == Digest::SHA1.hexdigest(usr.salt + password) then
      usr
    else
      return
    end
  end
end
