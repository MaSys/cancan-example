<pre><code>rails g cancan:ability</code></pre>
<pre><code>rails g scaffold user username:string</code></pre>
<pre><code>rails g scaffold role name:string</code></pre>
<pre><code>rails g model roles_users role:references user:references</code></pre>
<pre><code>rails g scaffold permission action subject_class name</code></pre>
<pre><code>rails g model roles_permission role:references permission:references</code></pre>
ability.rb
<pre><code>def initialize(user)
  if user.admin?
    can :manage, :all
  else
    user.roles.each do |role|
      role.permissions.each do |permission|
        can permission.action.to_sym, permission.subject_class.constantize
      end
    end
    # user ||= User.new # guest user (not logged in)
    # if user.admin?
    #   can :manage, :all
    # else
    #   can :read, :all
    # end
  end
end</code></pre>
user.rb
<pre><code>def admin?
  self.roles.each do |role|
    return true if role.name == 'Admin'
  end
  false
end</code></pre>
application_controller.rb
<pre><code>rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, alert: exception.message
end

helper_method :current_user

private

def current_ability
  @current_ability ||= Ability.new(current_user)
end

def current_user
  @current_user ||= User.find(2)
end</code></pre>
all controllers most have:
<pre><code>load_and_authorize_resource</code></pre>