
module pata(radio_pata, height, grueso) {
   Ra = radio_pata + 1.25;
   Rb = radio_pata;
   f = 0.90;
   difference () {
      union() {
         cylinder(r1 = Ra, r2 = f*Ra, h = height);
         translate([-1.5*Ra, -Ra, 0]) cube([Ra*1.5, Ra*2, grueso]);
      }
      translate([0, 0, -.5]) cylinder(r1 = Rb, r2 = f * Rb, h = height + 1);
      for (i = [0, 1, 2, 3, 4, 5, 6]) {
         rotate([0, 0, 60*i]) translate([0, -0.5, height / 3]) cube([Ra*1.2, 1, 12]);
      }
   }
}

module cuerpo(diametro, grueso) {
   union() {
      translate([0, 0, grueso/2]) cube([5, diametro - 10, grueso], center = true);
      difference() {
         cylinder(r = diametro/2, h = grueso);
         translate ([0, 0, -.5]) cylinder(r = diametro/2 - 5, h = grueso + 1);
      }
   }
}

module drawbot(diametro_bot, diametro_pata, grueso) {
   for (i = [0, 1, 2]) {
      rotate([0, 0, 120*i])
         translate([diametro_bot/2 + diametro_pata/1.8, 0, 0])
            pata(diametro_pata / 2, 12, grueso);
   }
   cuerpo(diametro_bot, grueso);
}

drawbot(65, 10, 2.5);