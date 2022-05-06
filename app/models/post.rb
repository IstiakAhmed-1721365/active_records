class Post < ApplicationRecord

    belongs_to :user
    has_many :comments

    scope :has_comments, -> { where (posts.comments.count > 0) }

    scope :good_posts, -> { where (posts.like_count > 10) }

    def user_has_commented  
    end

    scope :search_user_name, -> { where("users.name LIKE ?","%" + params[:q] +"%") }   

    scope :search_post_title, -> { where("posts.title LIKE ?","%" + params[:q] +"%") }   


    def total_like_count
    end

    def like_count
    end

        # Follows a user.
    def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
    end

    # Unfollows a user.
    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

    # Returns true if the current user is following the other user.
    def following?(other_user)
        following.include?(other_user)
    end

end
