# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

for k in 0..8
  for j in 0..5
    for i in 0..6
      a=25.mm
      width=a*rand(1..4)
      length=a*rand(1..4)
      height=a*rand(1..4)

      x=a*rand(0..4)+j*1000.mm # add 1000.mm grid
      y=a*rand(0..4)+k*1000.mm # add 1000.mm grid
      z=a*rand(0..4)

      origin=Geom::Point3d.new(x,y,z)

      pt1=Geom::Point3d.new(origin.x,origin.y,origin.z) # create points for each points
      pt2=Geom::Point3d.new(origin.x+width,origin.y,origin.z)
      pt3=Geom::Point3d.new(origin.x+width,origin.y+length,origin.z)
      pt4=Geom::Point3d.new(origin.x,origin.y+length,origin.z)

      group=ent.add_group # create sketchup group in "ent"
      group_ent=group.entities # accessing "entities" in "group"

      face=group_ent.add_face(pt1,pt2,pt3,pt4)

      if face.normal.z<0
       face.reverse!
      end

      face.pushpull(height) # load the rb file in Sketchup Ruby Console
    end
  end
end
