require_relative "questiondatabase"
require_relative "users"
require_relative "questions"

class QuestionLike

    attr_reader :user_id, :question_id

    def self.find_by_id(id)
        l = QuestionsDatabase.instance.execute("SELECT * FROM question_likes WHERE question_likes.id = #{id}")
        QuestionLike.new(l.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
    
end