require_relative "quesiondatabase"
require_relative "users"
require_relative "questions"

class QuestionFollow

    attr_reader :user_id, :question_id

    def self.find_by_id(id) 
        f = QuestionsDatabase.instance.execute(SELECT * FROM question_follows WHERE question_follows.id = id)
        QuestionFollow.new(f)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
    
end