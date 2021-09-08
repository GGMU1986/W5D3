require_relative "questiondatabase"
require 'byebug'

class User

    attr_reader :fname, :lname

    def self.find_by_id(id)
        u = QuestionsDataBase.instance.execute("SELECT * FROM users WHERE users.id = #{id}")
        User.new(u.first)
    end

    def self.find_by_name(fname, lname)
        debugger
        u = QuestionsDataBase.instance.execute("SELECT * FROM users WHERE (users.fname = #{fname} AND users.lname = #{lname})")
        User.new(u.first)
    end

    def initialize(options)
       @id = options['id']
       @fname = options['fname'] 
       @lname = options['lname'] 
    end
end

p User.find_by_name('Super', 'Man')