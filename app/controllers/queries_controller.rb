class QueriesController < ApplicationController
  before_action :authenticate_user!
  layout "homepage"

  def index; end

  def list; end

  def listpost
    @theme = params[:theme]
    @source = [params[:dcard], params[:ptt]].delete_if { |x| x == nil }
    @start = params[:user][:start].to_date
    @start_time = params[:user][:start].to_date.midnight.to_s
    @end = params[:user][:end].to_date
    @end_time = params[:user][:end].to_date.end_of_day.to_s
    @type = [params[:post], params[:comment]].delete_if { |x| x == nil }
    
    if params[:dcard] && params[:ptt] #同時搜尋Dcard & PTT
      if params[:post] && params[:comment] #同時找Post & Comment
        @posts = Post.ransack(title_or_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time ).result.sort_by{|x| x[:created_at]}
        @post_comment = Comment.ransack(post_title_or_post_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time).result
        @comments = Comment.ransack(content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time ).result
        @comment_total = @post_comment + @comments
        @comment_total = @comment_total.uniq.sort_by{|x| x[:created_at]}
        @count = @posts.count + @comment_total.count
      elsif params[:post] && !params[:comment]  #只找Post
        @posts = Post.ransack(title_or_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time ).result.sort_by{|x| x[:created_at]}
        @count = @posts.count
      else #只找Comment
        @post_comment = Comment.ransack(post_title_or_post_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time).result
        @comments = Comment.ransack(content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time ).result
        @comment_total = @post_comment + @comments
        @comment_total = @comment_total.uniq.sort_by{|x| x[:created_at]}
        @count = @comment_total.count
      end
    elsif params[:dcard] && !params[:ptt] #只找Dcard
      @source_id = 1
      if params[:post] && params[:comment] #同時找Post & Comment
        @posts = Post.ransack(title_or_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time ,board_source_id_eq: @source_id ).result.sort_by{|x| x[:created_at]}
        @post_comment = Comment.ransack(post_title_or_post_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time,post_board_source_id_eq: @source_id).result
        @comments = Comment.ransack(content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time,post_board_source_id_eq: @source_id).result
        @comment_total = @post_comment + @comments
        @comment_total = @comment_total.uniq.sort_by{|x| x[:created_at]}
        @count = @posts.count + @comment_total.count
      elsif params[:post] && !params[:comment]  #只找Post
        @posts = Post.ransack(title_or_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time ,board_source_id_eq: @source_id ).result.sort_by{|x| x[:created_at]}
        @count = @posts.count
      else  #只找Comment
        @post_comment = Comment.ransack(post_title_or_post_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time,post_board_source_id_eq: @source_id).result
        @comments = Comment.ransack(content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time,post_board_source_id_eq: @source_id).result
        @comment_total = @post_comment + @comments
        @comment_total = @comment_total.uniq.sort_by{|x| x[:created_at]}
        @count = @comment_total.count
      end
    else #只找PTT
      @source_id = 2
      if params[:post] && params[:comment] #同時找Post & Comment
        @posts = Post.ransack(title_or_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time ,board_source_id_eq: @source_id ).result.sort_by{|x| x[:created_at]}
        @post_comment = Comment.ransack(post_title_or_post_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time,post_board_source_id_eq: @source_id).result
        @comments = Comment.ransack(content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time,post_board_source_id_eq: @source_id).result
        @comment_total = @post_comment + @comments
        @comment_total = @comment_total.uniq.sort_by{|x| x[:created_at]}
        @count = @posts.count + @comment_total.count
      elsif params[:post] && !params[:comment]  #只找Post
        @posts = Post.ransack(title_or_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time ,board_source_id_eq: @source_id ).result.sort_by{|x| x[:created_at]}
        @count = @posts.count
      else  #只找Comment
        @post_comment = Comment.ransack(post_title_or_post_content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time,post_board_source_id_eq: @source_id).result
        @comments = Comment.ransack(content_cont_any: @theme, created_at_gteq_any: @start_time, created_at_lteq_any: @end_time,post_board_source_id_eq: @source_id).result
        @comment_total = @post_comment + @comments
        @comment_total = @comment_total.uniq.sort_by{|x| x[:created_at]}
        @count = @comment_total.count
      end
    end
  end

  def sentiment; end

  def sentpost
    # pass value down to api action
    @theme = params[:theme]
    @source = [params[:dcard], params[:ptt]].delete_if { |x| x == nil }
    @start = params[:user][:start].to_date
    @end = params[:user][:end].to_date
    @type = [params[:post], params[:comment]].delete_if { |x| x == nil }

    #theme1
    @post_result = Post.where("created_at >= ? and created_at <= ?", @start.midnight, @end.end_of_day).where("content like ? or title like ?", "%#{@theme}%", "%#{@theme}%")
    @comment_result = Comment.where("created_at >= ? and created_at <=?", @start.midnight, @end.end_of_day).where(:pid => Post.where("content like ? or title like ?", "%#{@theme}%", "%#{@theme}%").pluck(:pid)).or(Comment.where("created_at >= ? and created_at <=?", @start.midnight, @end.end_of_day).where("content like ?", "%#{@theme}%"))

    # 計算符合搜尋條件的資料筆數
    post_count = @post_result.count
    comment_count = @comment_result.count
    gon.start = @start
    gon.end = @end

    if params[:post] && params[:comment]
      @count = post_count + comment_count
      gon.result = @post_result + @comment_result
    elsif params[:post] && !params[:comment]
      @count = post_count
      gon.result = @post_result
    else
      @count = comment_count
      gon.result = @comment_result
    end
  end

  def volume; end

  def volumepost
    # pass value down to api action
    @theme = [params[:theme1], params[:theme2], params[:theme3]].delete_if { |x| x == nil }
    @source = [params[:dcard], params[:ptt]].delete_if { |x| x == nil }
    @start = params[:user][:start].to_date
    @end = params[:user][:end].to_date
    @type = [params[:post], params[:comment]].delete_if { |x| x == nil }

    #theme1
    @post_result = Post.where("created_at >= ? and created_at <= ?", @start.midnight, @end.end_of_day).where("content like ? or title like ?", "%#{@theme[0]}%", "%#{@theme[0]}%")
    @comment_result = Comment.where("created_at >= ? and created_at <= ?", @start.midnight, @end.end_of_day).where(:pid => Post.where("content like ? or title like ?", "%#{@theme[0]}%", "%#{@theme[0]}%").pluck(:pid)).or(Comment.where("content like ?", "%#{@theme[0]}%"))

    #theme2
    @post1_result = Post.where("created_at >= ? and created_at <=?", @start.midnight, @end.end_of_day).where("content like ? or title like ?", "%#{@theme[1]}%", "%#{@theme[1]}%")
    @comment1_result = Comment.where("created_at >= ? and created_at <=?", @start.midnight, @end.end_of_day).where(:pid => Post.where("content like ? or title like ?", "%#{@theme[1]}%", "%#{@theme[1]}%").pluck(:pid)).or(Comment.where("created_at >= ? and created_at <=?", @start.midnight, @end.end_of_day).where("content like ?", "%#{@theme[1]}%"))

    # 計算符合搜尋條件的資料筆數
    gon.start = @start
    gon.end = @end
    gon.theme = @theme[0]
    gon.theme1 = @theme[1]
    post_count = @post_result.count
    comment_count = @comment_result.count
    post1_count = @post1_result.count
    comment1_count = @comment1_result.count

    if params[:post] && params[:comment]
      @count = post_count + comment_count
      gon.result = @post_result + @comment_result
    elsif params[:post] && !params[:comment]
      @count = post_count
      gon.result = @post_result
    else
      @count = comment_count
      gon.result = @comment_result
    end
    gon.count = @count
    #待改進
    if params[:post] && params[:comment]
      @count1 = post1_count + comment1_count
      gon.result1 = @post1_result + @comment1_result
    elsif params[:post] && !params[:comment]
      @count1 = post1_count
      gon.result1 = @post1_result
    else
      @count1 = comment1_count
      gon.result1 = @comment1_result
    end
    gon.count1 = @count1
  end

  def topic; end

  def topicpost
    # pass value down to api action
    @theme = params[:theme]
    @source = [params[:dcard], params[:ptt]].delete_if { |x| x == nil }
    @start = params[:user][:start].to_date
    @end = params[:user][:end].to_date
    @type = [params[:post], params[:comment]].delete_if { |x| x == nil }

    #theme1
    post_result = Post.where("created_at >= ? and created_at <= ?", @start.midnight, @end.end_of_day).where("content like ? or title like ?", "%#{@theme}%", "%#{@theme}%")
    comment_result = Comment.where("created_at >= ? and created_at <=?", @start.midnight, @end.end_of_day).where(:pid => Post.where("content like ? or title like ?", "%#{@theme}%", "%#{@theme}%").pluck(:pid)).or(Comment.where("created_at >= ? and created_at <=?", @start.midnight, @end.end_of_day).where("content like ?", "%#{@theme}%"))

    post_count = post_result.count
    comment_count = comment_result.count

    if params[:post] && params[:comment]
      @count = post_count + comment_count
      result = post_result.select(:token, :id) | comment_result.select(:token, :id)
    elsif params[:post] && !params[:comment]
      @count = post_count
      result = post_result.select(:token, :id)
    else
      @count = comment_count
      result = comment_result.select(:token, :id)
    end

    CSV.open("data/topic_text.csv", "wb") do |csv|
      result.find_all do |res|
        csv << res.attributes.values
      end
    end
    @topic = `python3 lib/tasks/Topic/main.py params`
  end

  def wordcloud; end

  def cloudpost
    # pass value down to api action
    @theme = params[:theme]
    @source = [params[:dcard], params[:ptt]].delete_if { |x| x == nil }
    @start = params[:user][:start].to_date
    @end = params[:user][:end].to_date
    @type = [params[:post], params[:comment]].delete_if { |x| x == nil }

    post_result = Post.where("created_at >= ? and created_at <= ?", @start.midnight, @end.end_of_day).where("content like ? or title like ?", "%#{@theme}%", "%#{@theme}%")
    comment_result = Comment.where("created_at >= ? and created_at <=?", @start.midnight, @end.end_of_day).where(:pid => Post.where("content like ? or title like ?", "%#{@theme}%", "%#{@theme}%").pluck(:pid)).or(Comment.where("created_at >= ? and created_at <=?", @start.midnight, @end.end_of_day).where("content like ?", "%#{@theme}%"))

    post_count = post_result.count
    comment_count = comment_result.count

    if params[:post] && params[:comment]
      @count = post_count + comment_count
      result = post_result.select(:no_stop, :id) | comment_result.select(:no_stop, :id)
    elsif params[:post] && !params[:comment]
      @count = post_count
      result = post_result.select(:no_stop, :id)
    else
      @count = comment_count
      result = comment_result.select(:no_stop, :id)
    end

    CSV.open("data/cloud_text.csv", "wb") do |csv|
      result.find_all do |res|
        csv << res.attributes.values
      end
      @cloud = `python3 lib/tasks/Wordcloud/main.py params`
    end
  end

  def diffusion; end

end
