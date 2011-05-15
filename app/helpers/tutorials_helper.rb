module TutorialsHelper
  def video_type_from_filename(file_name)
    x_types = ['m4a', 'm4v']
    video_file_type = File.extname(file_name).sub('.', '')
    video_file_type = "x-#{video_file_type}" if x_types.include?(video_file_type)
    "video/#{video_file_type}"
  end
end
