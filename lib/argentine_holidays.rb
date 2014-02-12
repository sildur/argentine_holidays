require 'nokogiri'
require 'open-uri'
class ArgentineHolidays
  MONTHS = [
            'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 
            'Julio', 'Agosto', 'Setiembre', 'Octubre', 'Noviembre', 'Diciembre'
           ]
  def self.between(from, to)
    (from..to).collect {|i| i.year }.uniq.each do |year|
      fetch(year)
    end
    return @@dates.select {|d| (from..to).include? d }
  end
  def self.fetch(year)
    unless defined? @@dates
      @@dates = [] 
    end

    unless @@dates.any? {|i| i.year == year.to_i }
      begin
        doc = Nokogiri::HTML(open("http://www.mininterior.gov.ar/asuntos_politicos_y_alectorales/dinap/feriados/feriados#{year}.php"))
      rescue OpenURI::HTTPError
        return []
      end
        tables = doc.css('div#info table')
    

      # Non-movable
      tables[0].css('tr')[1..-1].each {|i| 
        @@dates += parse_date(i.children[0].text, year)
      }

      # Movable
      tables[1].css('tr')[1..-1].each {|i| 
        @@dates += parse_date(i.children[2].text, year)
      }
      @@dates.sort!
    end
      
    return @@dates.select {|i| i.year == year }
  end
private
  def self.parse_date(date, year)

    month = MONTHS.index {|i| /#{i}/ === date }
    if month
      month += 1
      days = date.scan(/[0-9]{1,2}/)
      return days.collect {|day| Date.new(year, month, day.to_i)}
    else
      return []
    end
  end
end
