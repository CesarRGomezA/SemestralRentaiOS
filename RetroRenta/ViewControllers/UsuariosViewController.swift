import Foundation
import AlamofireImage
import Alamofire
import UIKit

class UsuariosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvUsuarios: UITableView!
    var usuario : [Usuario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://videojuegosretro2.azurewebsites.net/wp-json/acf/v3/usuarios/?per_page=12").responseJSON {
            response in switch(response.result){
            case .success(let datos) :
                if let arregloUsuarios = datos as? NSArray{
                    for usuario in arregloUsuarios {
                        if let diccionarioUsuarios = usuario as? NSDictionary{
                            let nuevosUsuarios = Usuario(diccionario: diccionarioUsuarios)
                            self.usuario.append(nuevosUsuarios)
                        }
                    }
                    self.tvUsuarios.reloadData()
                }
            case .failure(_) :
                print("Error.")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuario.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaUsuarios") as? CeldaUsuariosController
        celda?.lblUsuario.text = usuario[indexPath.row].nombre + " " + usuario[indexPath.row].apellido
        celda?.lblEdad.text = usuario[indexPath.row].cumpleaños
        celda?.lblDireccion.text = usuario[indexPath.row].direccion
        
        Alamofire.request("https://videojuegosretro2.azurewebsites.net/" + usuario[indexPath.row].urlImagen).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgUsuario.image =  data
            case .failure(_) :
                print("La foto del usuario no se encontró")
            }
        }
        
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToUsuarioDetalles"{
            let destino = segue.destination as? UsuarioDetallesViewController
                destino?.usuario = usuario[tvUsuarios.indexPathForSelectedRow!.row]
        }
    }
}
