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
        if params[:user_answer] == 'correct'
            correct++
            total++
            percent = correct/total
        end

        question.update(total_correct: correct, total_tested: total, percent_correct: percent)
        render json: question
    end
end
