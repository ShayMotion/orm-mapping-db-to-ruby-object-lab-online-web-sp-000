require_relative '../config/environment'

class Student
  attr_accessor :id, :name, :grade
  @@all = []

def initialize(id, name, grade)
  @id = id
  @name = name
  @grade = grade
end

  def self.new_from_db(row)
    student.id = row[0]
    student.name = row[1]
    student.grade = row[2]
    student
  end	  end

  def self.all
sql = <<-SQL
    SELECT * FROM students 
    SQL
      DB[:conn].execute(sql).collect do |row|
      self.new_from_db(row)
  end

  def self.find_by_name(name)
    sql = <<-SQL
    SELECT *
    FROM students
    WHERE name = ?
    LIMIT 1
    SQ
    DB[:conn].execute(sql, name).map { |row| new_from_db(row) }.first
  end
  
  def save
    sql = <<-SQL
      INSERT INTO students (name, grade) 
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.grade)
  end
  
  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
    )
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
    "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end
end

def self.count_all_students_in_grade_9
  sql = <<-SQL
  SELECT *
  FROM students
  WHERE students.grade = 9
  SQL
  DB[:conn].execute(sql).collect do |row|
    self.new_from_db(row)
  end
end

def self.students_below_12th_grade
  sql = <<-SQL
  SELECT *
  FROM students
  WHERE students.grade < 12
  SQL
  DB[:conn].execute(sql).collect do |row|
      self.new_from_db(row)
    end
  end
  
  def self.first_student_in_grade_10
    sql = <<-SQL
    SELECT * 
    FROM students
    WHERE students.grade = 10
    LIMIT 1
    SQL
    DB[:conn].execute(sql).collect do |row|
      self.new_from_db(row).first
    end
  end

  def self.first_x_student_in_grade_10
        sql = <<-SQL
  SELECT *
  FROM students
  WHERE students.grade = 10
  SQL
  DB[:conn].execute(sql).collect do |row|
      self.new_from_db(row)
  end
end

def self.all_students_in_grade_X(x)
    sql = <<-SQL
    "SELECT * FROM students WHERE grade = ?"
    DB[:conn].execute(sql, x)
  end
end

def save
sql = <<-SQL
INSERT INTO students (name, grade)
VALUES (?,?)
SQL
DB[:conn].execute(sql, self.name, self.grade)
end

  
  

