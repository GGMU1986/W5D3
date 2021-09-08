require_relative "quesiondatabase"
require_relative "users"

class Question
    attr_accessor :title, :body, :user_id

    def self.find_by_id(id)
        q = QuestionsDataBase.instance.execute(SELECT * FROM questions WHERE questions.id = id)
        Questions.new(q)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end
end