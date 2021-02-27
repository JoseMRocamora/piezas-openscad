
// Medidas en mm
ancho_tubo    = 41;
alto_tubo     = 40;
alto_enganche = 10;

// Pieza
grosor_pieza = 4;
extrusion = 95;

union() {
    linear_extrude(height = extrusion)
        polygon(points=[
            [0                        , 0                       ],
            [0                        , alto_tubo               ],
            [ancho_tubo               , alto_tubo               ],
            [ancho_tubo               , 0                       ],     
            [ancho_tubo + grosor_pieza, 0                       ],
            [ancho_tubo + grosor_pieza, alto_tubo + grosor_pieza],
            [-grosor_pieza            , alto_tubo + grosor_pieza],
            [-grosor_pieza            , 0                       ]
        ]); 
         
    linear_extrude(height = extrusion)     
        translate([ancho_tubo + grosor_pieza, alto_tubo - alto_enganche + grosor_pieza])
                polygon(points=[
                    [0                           , 0 ],
                    [grosor_pieza                , 0 ], 
                    [grosor_pieza                , alto_enganche], 
                    [alto_enganche               , alto_enganche], 
                    [alto_enganche               , 0 ], 
                    [alto_enganche + grosor_pieza, 0 ], 
                    [alto_enganche + grosor_pieza, -grosor_pieza], 
                    [0                           , -grosor_pieza]
                ]);
} 
 