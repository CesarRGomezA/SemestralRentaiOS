import Foundation

class Usuario{
    var nombre : String
    var apellido : String
    var genero : String
    var cumpleaños : String
    var direccion : String
    var ciudad : String
    var codigoPostal : String
    var telefono : String
    var urlImagen : String
    var urlComprobante : String
        
    init(nombre : String,apellido : String, genero : String, cumpleaños : String, direccion : String, ciudad : String, codigoPostal : String, telefono : String, urlImagen : String, urlArmamentos : String, urlComprobante : String) {
        self.nombre = nombre
        self.apellido = apellido
        self.genero = genero
        self.cumpleaños = cumpleaños
        self.direccion = direccion
        self.ciudad = ciudad
        self.codigoPostal = codigoPostal
        self.telefono = telefono
        self.urlImagen = urlImagen
        self.urlComprobante = urlComprobante
    }
        
    init(diccionario : NSDictionary){
        self.nombre = ""
        self.apellido = ""
        self.genero = ""
        self.cumpleaños = ""
        self.direccion = ""
        self.ciudad = ""
        self.codigoPostal = ""
        self.telefono =  ""
        self.urlImagen = ""
        self.urlComprobante = ""
        
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary{
            if let nombre = acf.value(forKey: "nombre") as? String{
                self.nombre = nombre
            }
            
            if let apellido = acf.value(forKey: "apellido") as? String{
                self.apellido = apellido
            }
            
            if let genero = acf.value(forKey: "genero") as? String{
                self.genero = genero
            }
            
            if let cumpleaños = acf.value(forKey: "cumpleanos") as? String{
                self.cumpleaños = cumpleaños
            }
            
            if let direccion = acf.value(forKey: "direccion") as? String{
                self.direccion = direccion
            }
            
            if let ciudad = acf.value(forKey: "ciudad") as? String{
                self.ciudad = ciudad
            }
            
            if let codigoPostal = acf.value(forKey: "codigo_postal") as? String{
                self.codigoPostal = codigoPostal
            }
            
            if let telefono = acf.value(forKey: "telefono") as? String{
                self.telefono = telefono
            }
            
            if let urlImagen = acf.value(forKey: "imagen") as?String{
                self.urlImagen = urlImagen
            }
            
            if let urlComprobante = acf.value(forKey: "comprobante") as?String{
                self.urlComprobante = urlComprobante
            }
        }
    }
}
