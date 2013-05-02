Spree::Product.class_eval do
  attr_accessible :subscribable

  has_and_belongs_to_many :subscription_intervals, :foreign_key => "product_id", :join_table => 'spree_subscription_intervals_products'
  alias :intervals :subscription_intervals
  has_many :subscriptions, :foreign_key => "product_id" # DD: dependent destroy? how to handle non-expired subscriptions if product is deleted?

  #delegate_belongs_to :master, :issues_number

  scope :subscribable, where(:subscribable => true)
  scope :unsubscribable, where(:subscribable => false)
end