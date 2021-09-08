require_relative "quesiondatabase"
require_relative "questions"
require_relative "users"

class Reply

    attr_reader :question_id, :parent_id, :user_id, :body
    
    def self.find_by_id(id)
        r = QuestionsDatabase.instance.execute(SELECT * FROM replies WHERE replies.id = id)
        Reply.new(r)
    end

    # def self.find_by_reply(body)
    # end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @user_id = options['user_id']
        @body = options['body']
    end
end