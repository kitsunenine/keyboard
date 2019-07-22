module keyboard_button(width=18,height=18,back_tall=9,front_tall=9,front_slope=20,cap_width=13.4,cap_height=14.9,curvature=1,top_dimple=0.6,space_bar=false) {
  front_pushback=(front_tall*tan(front_slope));

   dimple_radius=(pow(top_dimple,2)+pow(cap_width/2,2))/2*top_dimple;

difference() {
hull() {
for (y=[1,-1]) { for (x=[1,-1]) { 
  translate([height/2*x,width/2*y,0])sphere(r=curvature);
}
  translate([height/2-front_pushback,cap_width/2*y,front_tall])sphere(r=curvature);
  translate([height/2-front_pushback-cap_height,cap_width/2*y,back_tall])sphere(r=curvature);
if (space_bar) {
  for (x=[1:$fa/3-1]) {
   rat=x/$fa*3;
   ang=sin(rat*180);
translate([height/2-front_pushback-cap_height*rat,cap_width/2*y,front_tall*(1-rat)+back_tall*rat+top_dimple*ang])sphere(r=curvature);
}
}
}
}
translate([0,0,-curvature])cube([height*2,width*2,curvature*2],center=true);
if (!space_bar) {
translate([height/2-front_pushback,0,dimple_radius+front_tall-curvature]) rotate([0,-90-asin((front_tall-back_tall)/cap_height),0]) translate([0,0,-cap_height])cylinder(r=dimple_radius,h=cap_height*4);
}
}
}

module cherry_cap(row=1,width=1,height=1,letter="T",space_bar=false) {
//Based on an actual keyboard measurement!
fbs=[[],[11.4,10.8],[9.3,9],[9.3,8],[10.1,7.9]];
fb=fbs[row];
cap_height=14.9;

difference() {
keyboard_button(width=18*width,cap_width=18*width-4.4,front_tall=fb[0],back_tall=fb[1],height=18*height,cap_height=cap_height*height,space_bar=space_bar);
     translate([-cap_height*0.2,-13.4*height*0.125,0]) scale(0.75) rotate([0,-asin((fb[0]-fb[1])/cap_height),0]) translate([0,0,fb[1]+2]) rotate(90)
       linear_extrude(2)
         text(letter,
         font="Liberation Sans",
         halign="center",
         valign="center");
}
}

t=20;
translate([t*0,t*0,0])cherry_cap(1,letter="");

translate([t*0,t*2,0])cherry_cap(1,letter="");
translate([t*0,t*3,0])cherry_cap(1,letter="");
translate([t*0,t*4,0])cherry_cap(1,letter="");
translate([t*0,t*5,0])cherry_cap(1,letter="");

translate([t*0,t*6.5,0])cherry_cap(1,letter="");
translate([t*0,t*7.5,0])cherry_cap(1,letter="");
translate([t*0,t*8.5,0])cherry_cap(1,letter="");
translate([t*0,t*9.5,0])cherry_cap(1,letter="");

translate([t*0,t*11,0])cherry_cap(1,letter="");
translate([t*0,t*12,0])cherry_cap(1,letter="");
translate([t*0,t*13,0])cherry_cap(1,letter="");
translate([t*0,t*14,0])cherry_cap(1,letter="");

translate([t*1.5,t*0,0])cherry_cap(1,letter="~");
translate([t*1.5,t*1,0])cherry_cap(1,letter="1");
translate([t*1.5,t*2,0])cherry_cap(1,letter="2");
translate([t*1.5,t*3,0])cherry_cap(1,letter="3");
translate([t*1.5,t*4,0])cherry_cap(1,letter="4");
translate([t*1.5,t*5,0])cherry_cap(1,letter="5");
translate([t*1.5,t*6,0])cherry_cap(1,letter="6");
translate([t*1.5,t*7,0])cherry_cap(1,letter="7");
translate([t*1.5,t*8,0])cherry_cap(1,letter="8");
translate([t*1.5,t*9,0])cherry_cap(1,letter="9");
translate([t*1.5,t*10,0])cherry_cap(1,letter="0");
translate([t*1.5,t*11,0])cherry_cap(1,letter="-");
translate([t*1.5,t*12,0])cherry_cap(1,letter="+");
translate([t*1.5,t*13.5,0])cherry_cap(1,width=2,letter="");

translate([t*2.5,t*0.25,0])cherry_cap(2,width=1.5,letter="");
translate([t*2.5,t*1.5,0])cherry_cap(2,letter="Q");
translate([t*2.5,t*2.5,0])cherry_cap(2,letter="W");
translate([t*2.5,t*3.5,0])cherry_cap(2,letter="E");
translate([t*2.5,t*4.5,0])cherry_cap(2,letter="R");
translate([t*2.5,t*5.5,0])cherry_cap(2,letter="T");
translate([t*2.5,t*6.5,0])cherry_cap(2,letter="Y");
translate([t*2.5,t*7.5,0])cherry_cap(2,letter="U");
translate([t*2.5,t*8.5,0])cherry_cap(2,letter="I");
translate([t*2.5,t*9.5,0])cherry_cap(2,letter="O");
translate([t*2.5,t*10.5,0])cherry_cap(2,letter="P");
translate([t*2.5,t*11.5,0])cherry_cap(2,letter="{");
translate([t*2.5,t*12.5,0])cherry_cap(2,letter="}");
translate([t*2.5,t*13.75,0])cherry_cap(2,width=1.5,letter="");

translate([t*3.5,t*0.375,0])cherry_cap(3,width=1.75,letter="");
translate([t*3.5,t*1.75,0])cherry_cap(3,letter="A");
translate([t*3.5,t*2.75,0])cherry_cap(3,letter="S");
translate([t*3.5,t*3.75,0])cherry_cap(3,letter="D");
translate([t*3.5,t*4.75,0])cherry_cap(3,letter="F");
translate([t*3.5,t*5.75,0])cherry_cap(3,letter="G");
translate([t*3.5,t*6.75,0])cherry_cap(3,letter="H");
translate([t*3.5,t*7.75,0])cherry_cap(3,letter="J");
translate([t*3.5,t*8.75,0])cherry_cap(3,letter="K");
translate([t*3.5,t*9.75,0])cherry_cap(3,letter="L");
translate([t*3.5,t*10.75,0])cherry_cap(3,letter=":");
translate([t*3.5,t*11.75,0])cherry_cap(3,letter="\"");
translate([t*3.5,t*13.375,0])cherry_cap(3,width=2.25,letter="");

translate([t*4.5,t*0.625,0])cherry_cap(4,width=2.25,letter="");
translate([t*4.5,t*2.25,0])cherry_cap(4,letter="Z");
translate([t*4.5,t*3.25,0])cherry_cap(4,letter="X");
translate([t*4.5,t*4.25,0])cherry_cap(4,letter="C");
translate([t*4.5,t*5.25,0])cherry_cap(4,letter="V");
translate([t*4.5,t*6.25,0])cherry_cap(4,letter="B");
translate([t*4.5,t*7.25,0])cherry_cap(4,letter="N");
translate([t*4.5,t*8.25,0])cherry_cap(4,letter="M");
translate([t*4.5,t*9.25,0])cherry_cap(4,letter="<");
translate([t*4.5,t*10.25,0])cherry_cap(4,letter=">");
translate([t*4.5,t*11.25,0])cherry_cap(4,letter="?");
translate([t*4.5,t*13.125,0])cherry_cap(4,width=2.75,letter="");

translate([t*5.5,t*0.25,0])cherry_cap(4,width=1.5,letter="");
translate([t*5.5,t*1.5,0])cherry_cap(4,width=1,letter="");
translate([t*5.5,t*2.625,0])cherry_cap(4,width=1.25,letter="");
translate([t*5.5,t*6.5,0])cherry_cap(4,width=7,letter="",space_bar=true);
translate([t*5.5,t*10.375,0])cherry_cap(4,width=1.25,letter="");
translate([t*5.5,t*11.5,0])cherry_cap(4,width=1,letter="");
translate([t*5.5,t*12.5,0])cherry_cap(4,width=1,letter="");
translate([t*5.5,t*13.75,0])cherry_cap(4,width=1.5,letter="");

translate([t*0,t*15.5,0])cherry_cap(1,letter="");
translate([t*0,t*16.5,0])cherry_cap(1,letter="");
translate([t*0,t*17.5,0])cherry_cap(1,letter="");

translate([t*1.5,t*15.5,0])cherry_cap(1,letter="");
translate([t*1.5,t*16.5,0])cherry_cap(1,letter="");
translate([t*1.5,t*17.5,0])cherry_cap(1,letter="");
translate([t*2.5,t*15.5,0])cherry_cap(2,letter="");
translate([t*2.5,t*16.5,0])cherry_cap(2,letter="");
translate([t*2.5,t*17.5,0])cherry_cap(2,letter="");

translate([t*4.5,t*16.5,0])cherry_cap(4,letter="");
translate([t*5.5,t*15.5,0])cherry_cap(4,letter="");
translate([t*5.5,t*16.5,0])cherry_cap(4,letter="");
translate([t*5.5,t*17.5,0])cherry_cap(4,letter="");

translate([t*1.5,t*19,0])cherry_cap(1,letter="");
translate([t*1.5,t*20,0])cherry_cap(1,letter="/");
translate([t*1.5,t*21,0])cherry_cap(1,letter="*");
translate([t*1.5,t*22,0])cherry_cap(1,letter="-");

translate([t*2.5,t*19,0])cherry_cap(2,letter="7");
translate([t*2.5,t*20,0])cherry_cap(2,letter="8");
translate([t*2.5,t*21,0])cherry_cap(2,letter="9");

translate([t*3.5,t*19,0])cherry_cap(3,letter="4");
translate([t*3.5,t*20,0])cherry_cap(3,letter="5");
translate([t*3.5,t*21,0])cherry_cap(3,letter="6");

translate([t*4.5,t*19,0])cherry_cap(4,letter="1");
translate([t*4.5,t*20,0])cherry_cap(4,letter="2");
translate([t*4.5,t*21,0])cherry_cap(4,letter="3");

translate([t*5.5,t*19.5,0])cherry_cap(4,width=2,letter="0");
translate([t*5.5,t*21,0])cherry_cap(4,letter=".");
translate([t*3,t*22,0])cherry_cap(2,height=2,letter="+");
translate([t*5,t*22,0])cherry_cap(4,height=2,letter="");
