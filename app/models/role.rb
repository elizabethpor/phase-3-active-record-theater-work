class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map { |a| a.actor }
    end

    def locations
        self.auditions.map { |a| a.location }
    end

    def lead
        lead = self.auditions.find_by("hired == ?", true)
        lead ? lead : "no actor has been hired for this role"
    end

    def understudy
        understudy = self.auditions.where("hired == ?", true)[1]
        understudy ? understudy : "no actor has been hired for understudy for this role"
    end
  end