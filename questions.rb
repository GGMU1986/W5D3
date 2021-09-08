require 'sqlite3'
require 'singleton'

class QuestionsDataBase < SQLite3::DataBase
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question

    def self.find_by_id(id)
        q = QuestionsDataBase.instance.execute(SELECT * FROM questions WHERE questions.id = id)
        Questions.new(q)
    end

    
end