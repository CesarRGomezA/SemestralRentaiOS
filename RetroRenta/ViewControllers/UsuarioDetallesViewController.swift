import Foundation
import UIKit
import Alamofire
import AlamofireImage

class UsuarioDetallesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvUsuarios: UITableView!
    var usuario : Usuario?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = usuario?.nombre
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaUsuarioDetalles") as? CeldaUsuarioDetallesController
        celda?.lblNombre.text = usuario!.nombre
        celda?.lblApellido.text = usuario!.apellido
        celda?.lblGenero.text = usuario!.genero
        celda?.lblCiudad.text = usuario?.ciudad
        celda?.lblTelefono.text = usuario?.telefono
        celda?.lblDireccion.text = usuario?.direccion
        celda?.lblCumpleaños.text = usuario!.cumpleaños
        celda?.lblCodigoPostal.text = usuario!.codigoPostal
        
        Alamofire.request("https://videojuegosretro2.azurewebsites.net/" + usuario!.urlImagen).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgUsuario.image =  data
            case .failure(_) :
                print("La foto del usuario no cargó")
            }
        }
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 735
    }
}
