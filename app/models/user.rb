class User < ActiveRecord::Base
  has_many :projectmembers
  has_many :projects, through: :projectmembers
  has_many :votes
  has_many :comments
  has_many :resources

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :age
  validates_presence_of :state

  validates :first_name, format: { with: /\A[a-z]+\z/i }
  validates :last_name, format: { with: /\A[a-z]+\z/i }
  validates_numericality_of :age, greater_than: 0
  validates :state, format: { with: /\A[a-z]{2}\z/i }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end