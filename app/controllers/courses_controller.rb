class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
      if @course.save
        redirect_to courses_url, notice: 'cadastrado com sucesso' 
      else
        render :new 
      end
  end

  def update
      if @course.update(course_params)
        redirect_to courses_url, notice: 'atualização feita com sucesso.' 
      else
        render :edit 
      end
  end

  def destroy
    @course.destroy
      redirect_to courses_url, notice: 'Curso deletado com sucesso.' 
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :status)
    end
end
