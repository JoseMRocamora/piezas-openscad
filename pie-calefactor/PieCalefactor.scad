// Pieza para pie de calefactor aire

alturaPieza = 40;
alturaSecundaria = 15;
diametroPrincipal = 150;
diametroSecundario = 100;
excesoCorte = 20;
metrica4 = 4;
metrica9 = 9;
metrica10 = 10;

// Cuerpo Principal - Cortes - Taladros
difference() {
    // cilindro principal
    cylinder(h=alturaPieza, r=diametroPrincipal/2, $fn=360);

    // ------

    // Corte principal
    #translate([excesoCorte, -1*(diametroPrincipal+excesoCorte)/2, -1*(excesoCorte/2)])
        cube([diametroPrincipal/2, (diametroPrincipal+excesoCorte), (alturaPieza+excesoCorte)]);

    // Corte Inferior
    #translate([-1*(diametroPrincipal+excesoCorte)/2 , -1*diametroSecundario/2, -1*excesoCorte])
        cube([diametroPrincipal, diametroSecundario, (alturaSecundaria+excesoCorte)]);

    // Hueco Interno
    #translate([-1*45, -1*(diametroSecundario-excesoCorte)/2, -1*(excesoCorte/2)])
        cube([60, (diametroSecundario-excesoCorte), (alturaPieza+excesoCorte)]);
            

    // Corte Superior
    #translate([-1*excesoCorte, 0, (alturaPieza-alturaSecundaria/3)])
        union() {
            // cilindro secundario       
            cylinder(h=alturaSecundaria, r=diametroSecundario/2, $fn=360);

            // Alargamiento cilindro secundario
            translate([0, -1*diametroSecundario/2, 0])
                cube([diametroSecundario/2, diametroSecundario, alturaSecundaria]);
        }

    // Corte Intermedio
    #translate([-1*diametroPrincipal/2, -1*diametroSecundario/2, alturaSecundaria-5])
        cube([diametroSecundario/4, diametroSecundario, excesoCorte]);

    // Taladros
    union(){
        // Taladro Metrica 4
        translate([-1*diametroPrincipal/2+10, 0, alturaSecundaria])
            cylinder(h=alturaPieza, r=metrica4/2, $fn=100);

        // Taladro Metrica 9
        translate([-1*5, -1*(diametroSecundario-excesoCorte)/2-5, alturaSecundaria/2])
            cylinder(h=alturaPieza, r=metrica9/2, $fn=100);

        // Taladro Metrica 9 (mirror)
        mirror([0, 1, 0])
            translate([-1*5, -1*(diametroSecundario-excesoCorte)/2-5, alturaSecundaria/2])
                cylinder(h=alturaPieza, r=metrica9/2, $fn=100);

        // Taladro Metrica 10
        translate([-1*55, -1*29, 0])
            cylinder(h=alturaPieza, r=metrica10/2, $fn=100);

        // Taladro Metrica 10 (mirror)
        mirror([0,1,0])
            translate([-1*55, -1*29, 0])
                cylinder(h=alturaPieza, r=metrica10/2, $fn=100);
    }
}