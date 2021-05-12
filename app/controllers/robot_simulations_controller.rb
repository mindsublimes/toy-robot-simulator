class RobotSimulationsController < ApplicationController

  def new
    @robot_simulation = Robot.new
  end

  def move
    @data_set = params[:data_set]
    axis      = params[:token].split("_")
    x, y      = [axis[1].to_i, axis[2].to_i]
    values    = move_position(x, y)
    valid_position(values[0], values[1]) if values.present?
  end

  def set_robot
    @robot      = Robot.new(robot_params)
    @directions = @robot.directions.split(/,/)
    @axis       = valid_position(@directions[0].to_i, @directions[1].to_i)
  end

  private

  def valid_position(x, y)
    if (x < 0 || x > (params[:rows] || 5)) || (y < 0 || y > (params[:colunms] || 5))
      @axis = nil
    else
      true
    end
  end

  def move_position(x, y)
    case params[:direction]
      when 'East'
        @axis = [x + 1, y]
      when 'West'
        @axis = [x - 1, y ]
      when 'South'
        @axis = [x , y - 1]
      when 'North'
        @axis = [x, y + 1]
    end
  end

  def robot_params
    params.require(:robot).permit(:orientation, :directions)
  end
end
