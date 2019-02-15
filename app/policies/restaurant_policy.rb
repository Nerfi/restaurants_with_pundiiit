class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # to let anyone see the restaurants
    end
  end

  def create?
    return true #Anyone can created a restaurant

  end

  def show?
    return true #para que todo el mundo pueda ver un @reetsuarant

  end

  def edit?
    #rule
    #if I create the restaurant => true
    #otherwise => false
    #user => current_user from devise
    # record @restaurant
    record.user == user


  end

  def update?
    #inside policy we need to remenber this two things
    # 1. user is currrent_user
    #2. record is the instance we passed when we authorize in this case record will be @restaurant
    record.user == user
    # we can update a restaurant if we create it, that's what this line is telling us

  end
end
