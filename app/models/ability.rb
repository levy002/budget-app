class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new
    if user.role == 'admin'
      can :manage, :all
    else
      can :manage, Category, user_id: user.id
      can :manage, Transaction, user_id: user.id
    end
  end
end
