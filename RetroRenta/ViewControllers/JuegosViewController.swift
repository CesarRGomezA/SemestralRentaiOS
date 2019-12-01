import Foundation
import UIKit
import Alamofire
import AlamofireImage

class JuegosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvJuegos: UITableView!
    var juego : [Juego] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://videojuegosretro2.azurewebsites.net/wp-json/acf/v3/juegos/?per_page=12").responseJSON {
            response in switch(response.result){
            case .success(let datos) :
                if let arregloJuegos = datos as? NSArray{
                    for juegos in arregloJuegos {
                        if let diccionarioJuegos = juegos as? NSDictionary{
                            let nuevoJuego = Juego(diccionario: diccionarioJuegos)
                            self.juego.append(nuevoJuego)
                        }
                    }
                    self.tvJuegos.reloadData()
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
        return juego.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaJuegos") as? CeldaVideojuegosController
        celda?.lblNombre.text = juego[indexPath.row].nombre
        celda?.lblDesarrollador.text = juego[indexPath.row].desarrollador
        celda?.lblAño.text = juego[indexPath.row].año
        
        Alamofire.request("https://videojuegosretro2.azurewebsites.net/" + juego[indexPath.row].urlJuego).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgJuego.image =  data
            case .failure(_) :
                print("La foto del juego no sirve")
            }
        }
        
        Alamofire.request("https://videojuegosretro2.azurewebsites.net/" + juego[indexPath.row].urlImagen).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgImagen.image =  data
            case .failure(_) :
                print("La foto del juego no sirve")
            }
        }
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToJuegoDetalles"{
            let destino = segue.destination as? JuegosDetalleViewController
            destino?.juego = juego[tvJuegos.indexPathForSelectedRow!.row]
        }
    }
}
