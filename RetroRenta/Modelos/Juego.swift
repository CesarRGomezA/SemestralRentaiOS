import Foundation

class Juego {
    var nombre : String
    var genero : String
    var clasificacion : String
    var año : String
    var urlImagen : String
    var urlJuego : String
    var desarrollador : String
    var sinopsis : String
    var formato : String
    var disponibilidad : String
    
    init(nombre : String,genero : String, clasificacion : String, año : String, urlImagen : String, urlJuego : String, desarrollador : String, sinopsis : String, formato : String, disponibilidad : String) {
        self.nombre = nombre
        self.genero = genero
        self.clasificacion = clasificacion
        self.año = año
        self.urlImagen = urlImagen
        self.urlJuego = urlJuego
        self.desarrollador = desarrollador
        self.sinopsis = sinopsis
        self.formato = formato
        self.disponibilidad = disponibilidad
    }
    
    init(diccionario : NSDictionary){
        self.nombre = ""
        self.genero = ""
        self.clasificacion = ""
        self.año = ""
        self.urlImagen = ""
        self.urlJuego = ""
        self.desarrollador = ""
        self.sinopsis =  ""
        self.formato =  ""
        self.disponibilidad = ""
        
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary{
            if let nombre = acf.value(forKey: "nombre") as? String{
                self.nombre = nombre
            }
            
            if let genero = acf.value(forKey: "genero") as? String{
                self.genero = genero
            }
            
            if let clasificacion = acf.value(forKey: "clasificacion") as? String{
                self.clasificacion = clasificacion
            }
            
            if let año = acf.value(forKey: "ano") as? String{
                self.año = año
            }
            
            if let urlJuego = acf.value(forKey: "imagen") as? String{
                self.urlJuego = urlJuego
            }
            
            if let urlImagen = acf.value(forKey: "estudio") as? String{
                self.urlImagen = urlImagen
            }
            
            if let desarrollador = acf.value(forKey: "desarrollador") as? String{
                self.desarrollador = desarrollador
            }
            
            if let sinopsis = acf.value(forKey: "sinopsis") as? String{
                self.sinopsis = sinopsis
            }
            
            if let formato = acf.value(forKey: "formato") as? String{
                self.formato = formato
            }
            
            if let disponibilidad = acf.value(forKey: "disponibilidad") as? String{
                self.disponibilidad = disponibilidad
            }
        }
    }
}
