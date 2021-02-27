// Dimensiones del movil en mm (si lleva funda, incluida la funda)
ancho = 74;     // Eje X
fondo = 9.65;   // Eje Y
alto  = 145;    // Eje Z

grosor_paredes = 1.5;

// Definicion de Constantes
M3 = 3;

// EJES 
X = 0;
Y = 1;
Z = 2;

// Objetos y relaciones entre sus medidas

// Restricciones
altura_soporte   = alto  * 0.40;    // 40% de la altura del movil
anchura_refuerzo = ancho * 0.10;    // 10% de la anchura del movil
anchura_solapas  = 5;

// Medidas interiores del Soporte => Hueco con las medidas del movil
HUECO    = [ ancho, fondo, altura_soporte ];

// Medidas exteriores del Soporte => Medidas interiores + grosor de las paredes
SOPORTE  = [ HUECO[X] + 2 * grosor_paredes, HUECO[Y] + 2 * grosor_paredes, HUECO[Z] + 2 * grosor_paredes ];

// Hueco con solapas para cortar la parte delantera del soporte
HUECO1   = [ HUECO[X] - 2 * anchura_solapas, HUECO[Y], HUECO[Z] - 2 * anchura_solapas ];

// Hueco para el conector USB
HUECO2   = [ 10.5, 6.5, HUECO[Z] ];

// Refuerzo trasero
REFUERZO = [ anchura_refuerzo, grosor_paredes, SOPORTE[Z] ];

// Pletina de enganche con el posavasos del SEAT Leon
PLETINA  = [ 60, 13, 2.25 ]; 


difference() {
    union() {
        // Soporte    
        cube(SOPORTE,  center = true);

        // Refuerzo trasero
        translate( [0, SOPORTE[Y] / 2 + REFUERZO[Y] / 2, 0 ] )
            cube( REFUERZO, center = true );

    }
    
    // Hueco interior
    translate([0, 0, (SOPORTE[Z] - HUECO[Z]) ])
        union() {
            cube(HUECO,  center = true);
            
            // Hueco delantero
            translate( [ 0, - HUECO1[Y] / 2, (HUECO[Z] - HUECO1[Z]) / 2 ] )
                cube(HUECO1, center = true );
        }
        
    // Hueco conector USB   
    translate([0, 0, - HUECO[Z]/2 ])
        cube( HUECO2, center = true );
}

// Pletina inferior de enganche al posavasos
translate( [ SOPORTE[X]/2 - PLETINA[X]/2 + 4, -4.5, - SOPORTE[Z] / 2 + PLETINA[Z] / 2 ] ) 
    rotate( [ 0, 0, 42 ] )
        difference() {
            cube(PLETINA, center = true);
            
            translate( [ PLETINA[X] / 2 - 6.3 - M3 / 2, 0, 0 ] )
                cylinder( d = M3, h = 2 * PLETINA[Z], center = true, $fn = 100 );

            mirror( [1, 0, 0 ] )
                translate( [ PLETINA[X] / 2 - 6.3 - M3 / 2, 0, 0 ] )
                    cylinder( d=3, h=2 * PLETINA[Z], center = true, $fn = 100 );
        }

