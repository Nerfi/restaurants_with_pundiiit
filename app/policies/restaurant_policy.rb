class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true #Anyone can created a restaurant

  end

  def show?
    return true

  end
end
