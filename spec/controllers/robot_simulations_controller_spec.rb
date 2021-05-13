require 'byebug'
require 'rails_helper'

RSpec.describe RobotSimulationsController, type: :controller do

  describe "GET #new" do
    it "returns success" do
      get :new
      expect(controller.view_assigns["robot_simulation"]).to be_an_instance_of(Robot)
    end
  end

  describe "GET #move" do
    it "returns success direction East" do
      params = { data_set: "90", direction: "East", token: "location_3_2" }
      get :move, params: params, xhr: true
      expect(response).to have_http_status(200)
      expect(controller.view_assigns['data_set']).to be_eql(params[:data_set])
      axis = params[:token].split("_")
      expect(controller.view_assigns['axis']).to be_eql([axis[1].to_i + 1, axis[2].to_i])
    end

    it "returns success direction North" do
      params = { data_set: "0", direction: "North", token: "location_3_2" }
      get :move, params: params, xhr: true
      expect(response).to have_http_status(200)
      expect(controller.view_assigns['data_set']).to be_eql(params[:data_set])
      axis = params[:token].split("_")
      expect(controller.view_assigns['axis']).to be_eql([axis[1].to_i, axis[2].to_i + 1])
    end

    it "returns failure direction North West" do
      params = { data_set: "300", direction: "West North", token: "location_13_2" }
      get :move, params: params, xhr: true
      expect(response).to have_http_status(200)
      expect(controller.view_assigns['axis']).to be_nil
      expect(controller.view_assigns['data_set']).to be_eql(params[:data_set])
    end
  end

  describe "GET #set_robot" do
    it "returns success robot params" do
      params = { robot: { directions: "0,4", orientation: "North" } }
      get :set_robot, params: params, xhr: true
      robot = controller.view_assigns['robot']
      expect(robot.id).to be_nil
      expect(robot.directions).to be_eql(params[:robot][:directions])
      expect(robot.orientation).to be_eql(params[:robot][:orientation])
    end
  end
end