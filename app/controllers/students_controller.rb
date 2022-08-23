class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  def index
    @students = Student.all
  end
  def show #students/3 czyli id params z url

  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Succesfull signed up"
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit

  end

  def update

    if @student.update(student_params)
      flash[:notice] = "Zaktualizowano poprawnie"
      redirect_to student_path(@student)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end
  def student_params
    params.require(:student).permit(:name, :email)
  end
end