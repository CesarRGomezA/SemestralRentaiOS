import Foundation
import UIKit
import Alamofire
import AlamofireImage

class JuegosDetalleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvJuegos: UITableView!
    var juego : Juego?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = juego?.nombre
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaJuegoDetalle") as? CeldaVideojuegosDetalleController
        celda?.lblNombre.text = juego!.nombre
        celda?.lblGenero.text = juego!.genero
        celda?.lblClasificacion.text = juego!.clasificacion
        celda?.lblAño.text = juego!.año
        celda?.lblDesarrollador.text = juego!.desarrollador
        celda?.lblSinopsis.text = juego!.sinopsis
        celda?.lblFormato.text = juego!.formato
        celda?.lblDisponibilidad.text = juego!.disponibilidad
        
        Alamofire.request("https://videojuegosretro2.azurewebsites.net/" + juego!.urlJuego).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgJuego.image =  data
            case .failure(_) :
                print("La foto del juego no se encontró")
            }
        }
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
}
