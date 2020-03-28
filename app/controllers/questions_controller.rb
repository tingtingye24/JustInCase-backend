class QuestionsController < ApplicationController

    def index
        question = Question.all 
        render json: question
    end


    def update
        question = Question.find(params[:id])
        correct = question.total_correct
        total = question.total_tested
        percent = question.percent_correct
        total+=1
        if params[:user_answer] == 'correct'
            correct+=1
            percent = (correct.to_f/total) * 100
        end
        

        question.update(total_correct: correct, total_tested: total, percent_correct: percent)
        render json: question
    end
end
