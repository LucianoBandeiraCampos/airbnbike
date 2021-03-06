class BikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def my_bikes?
    true
  end

  private

  def owner?
    record.user == user
  end
end
