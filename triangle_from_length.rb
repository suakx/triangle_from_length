item = UI.menu("Draw").add_item("Triangle from Length") {triangle}
def triangle
  prompts = ["length1", "length2", "length3"]
  defaults = ["0", "0", "0"]
  input = UI.inputbox prompts, defaults, "3 Length in mm"
  x = input.max.to_i
  input.delete(input.max)
  xx = ((input[0].to_i*input[0].to_i - input[1].to_i*input[1].to_i + x*x) / (2*x)).abs
  yy = Math.sqrt(input[0].to_i*input[0].to_i - xx*xx)
  model = Sketchup.active_model
  entities = model.active_entities
  point = Geom::Point3d.new 0,0,0
  point1 = Geom::Point3d.new x.mm,0,0
  point2 = Geom::Point3d.new xx.mm,yy.mm,0
  line = entities.add_line point,point1
  line1 = entities.add_line point1,point2
  line2 = entities.add_line point2,point
  face = entities.add_face point,point1,point2
  group = entities.add_group line,line1,line2,face
end