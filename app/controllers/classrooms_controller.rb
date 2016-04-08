class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  before_action :students
  before_action :courses

  def index
    @classrooms = Classroom.all
  end

  def show
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

  def create
    @classroom = Classroom.new(classroom_params)
      if @classroom.save
        redirect_to classrooms_url, notice: 'atualização feita com sucesso.' 
      else
        render :new 
      end
  end

  def update
      if @classroom.update(classroom_params)
        redirect_to classrooms_url, notice: 'atualização feita com sucesso.' 
      else
        render :edit 
      end
  end

  def destroy
    @classroom.destroy
      redirect_to classrooms_url, notice: 'deletado com sucesso.' 
  end

  private
    def students
      @students = Student.all
    end

    def courses
      @courses = Course.all
    end

    def set_classroom
      @classroom = Classroom.find(params[:id])
    end


    def classroom_params
      params.require(:classroom).permit(:student_id, :course_id, :entry_at)
    end
end
