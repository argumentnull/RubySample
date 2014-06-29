class CtrlController < ApplicationController
  def cookie
    @email = cookies[:email]
  end
  def cookie_rec
    cookies[:email] = { value: params[:email], expires: 3.months.from_now, http_only: true }
    render text: 'クッキーを保存しました。'
  end
  def para
    render text: 'idパラメータ：' + params[:id]
  end
  def para_array
    render text: 'categoryパラメータ：' + params[:category].ins
  end
  def req_head
    render text: request.headers['User-Agent']
  end
  def req_head2
    @headers = request.headers
  end
  def upload_process
    file = params[:upfile]
    name = file.original_filename
    perms = ['.jpg', '.jpeg', '.gif', '.png']
    if !perms.include?(File.extname(name).downcase)
      result = 'アップロードできるのは画像ファイルのみです。'
    elsif file.size > 1.megabyte
      result = 'ファイルサイズは1MBまでです。' 
    else
      name = name.kconv(Kconv::SJIS, Kconv::UTF8)
      File.open("public/docs/#{name}", 'wb') { |f| f.write(file.read) }
      result = "#{name.toutf8}をアップロードしました。"
    end
    render text: result
  end
end
