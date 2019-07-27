
union() {
    linear_extrude(height=5)
        import(file="monete-tecleando.dxf", layer="Circulo");
        
    linear_extrude(height=7)    
        import(file="monete-tecleando.dxf", layer="Monete");
        
    linear_extrude(height=7)    
        import(file="monete-tecleando.dxf", layer="Letras");
        
    translate([37.5, 73, 2.5])
        difference() {
            cube([14, 14, 5], center=true);

            cube([10, 10, 10], center=true);
        } 
} 