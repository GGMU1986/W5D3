require_relative "questiondatabase"
require_relative "users"
require 'byebug'

class Question
    attr_accessor :title, :body, :user_id

    def self.find_by_id(id)
        q = QuestionsDataBase.instance.execute("SELECT * FROM questions WHERE questions.id = #{id}")
        Question.new(q.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end
end

p Question.find_by_id(3)