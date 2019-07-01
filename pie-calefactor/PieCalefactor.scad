// Pieza para pie de calefactor aire

h1 = 40;    // Altura Principal de la pieza
d1 = 150;   // Diametro Principal de la pieza
h1_10perc = h1 * 0.1;   // 10% de la Altura Principal
d1_10perc = d1 * 0.1;   // 10% del Diametro Principal

h2 = 15;    // Altura Secundaria de la pieza 
d2 = 112;   // Diametro Secundario de la pieza
h2_10perc = h2 * 0.1;   // 10% de la Altura Principal

d3 = 82;    // Diametro Hueco Interior

metrica4 = 4;
metrica9 = 9;
metrica10 = 10;



// Cuerpo Principal - Cortes - Taladros
difference() {
    // cilindro principal
    cylinder(h=h1, r=d1/2, $fn=360);

    // ------

    // Corte principal
    translate([d1_10perc, -1*(d1+d1_10perc)/2, -1*(h1_10perc/2)])
        cube([d1/2, (d1+d1_10perc), (h1+h1_10perc)]);

    // Corte Inferior
    translate([-1*(d1+d1_10perc)/2 , -1*d2/2, -1*h2_10perc])
        cube([d1, d2, (h2+h2_10perc)]);

    // Corte Superior
    translate([-1*(d1-d2)/2+5, 0, h1-5]) 
        union() {
            // cilindro secundario       
            cylinder(h=h2, r=d2/2, $fn=360);

            // Alargamiento cilindro secundario
            translate([0, -1*d2/2, 0])
                cube([d2/2, d2, h2]);
        }

    // Hueco Interno
    translate([-1*(d1-d3)/2+5+14, 0, -1*(h1_10perc/2)])
        union() {
            difference() {
                // cilindro del hueco       
                cylinder(h=(h1+h1_10perc), r=d3/2, $fn=360);

                translate([0, -1*d3/2, -1*h1_10perc])
                    cube([d3/2, d3, (h1+h1_10perc)]);
            }
            // Alargamiento cilindro del hueco
            translate([-1, -1*d3/2, -1*h1_10perc])
                cube([24, d3, (h1+h1_10perc)]);
        }

    // Corte Intermedio
    translate([-1*d1/2, -1*d2/2, h2-5])
        cube([d1/2+8, d2, 20]);

    // Taladros
    union(){
        // Taladro Metrica 4
        translate([-1*d1/2+10, 0, h2])
            cylinder(h=h1, r=metrica4/2, $fn=100);

        // Taladro Metrica 10
        translate([-1*47, -1*35, 0])
            cylinder(h=h1, r=metrica10/2, $fn=100);

        // Taladro Metrica 10 (mirror)
        mirror([0,1,0])
            translate([-1*47, -1*35, 0])
                cylinder(h=h1, r=metrica10/2, $fn=100);

        // Taladro Metrica 10
        translate([-1*2, -1*d2/2+5, h2/2])
            cylinder(h=h1, r=metrica10/2, $fn=100);

        // Taladro Metrica 10 (mirror)
        mirror([0, 1, 0])
            translate([-1*2, -1*d2/2+5, h2/2])
                cylinder(h=h1, r=metrica10/2, $fn=100);
    }

}