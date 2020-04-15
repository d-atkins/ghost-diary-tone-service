class Tone

  def initialize(tone_data)
    @tones = tone_data[:document_tone][:tones]
  end

  def filter
    if @tones.empty?
      return 'Default'
    else
      unless emotion_tones.empty?
        emotion_tones.max_by { |tone| tone[:score] }[:tone_name]
      else
        @tones.max_by { |tone| tone[:score] }[:tone_name]
      end
    end
  end

  private

    def emotion_tones
      @tones.find_all { |tone| emotions.include?(tone[:tone_name]) }
    end

    def emotions
      ['Anger', 'Fear', 'Joy', 'Sadness']
    end
end
