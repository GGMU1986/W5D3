require_relative "questiondatabase"

class User

    attr_reader :fname, :lname

    def self.find_by_id(id)
        u = QuestionsDataBase.instance.execute("SELECT * FROM users WHERE users.id = id")
        User.new(u)
    end

    def self.find_by_name(fname, lname)
        u = QuestionsDataBase.instance.execute("SELECT * FROM users WHERE users.fname = fname AND users.lname = lname")
        User.new(u)
    end

    def initialize(options)
       @id = options['id']
       @fname = options['fname'] 
       @lname = options['lname'] 
    end
end