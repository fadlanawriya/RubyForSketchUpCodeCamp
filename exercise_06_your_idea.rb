# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

for i in 0..9
  for j in 0..5 # Create inner loop with j counter

    # Set a=100.mm as a value to define the dimension of the box
    a=100.mm

    random_width=rand(0.4..1.8)
    width=a*random_width

    random_length=rand(0.4..1.8)
    length=a*random_length

    # you can either create it random like this
      # random_height=rand(0..12)
      # height=a*random_height

    # or, you can also set the volume box constant
    wl_size=(width*length)
    quad_a=(a*a*a*a)
    height=quad_a/wl_size # this line of argument will set the volume of the box constant

    # Set the j correspond with y coordinate
    origin=Geom::Point3d.new(i*width,j*length,0)

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
