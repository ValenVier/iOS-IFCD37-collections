//
//  ViewController.swift
//  collections
//
//  Created by Javier Rodríguez Valentín on 27/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var city = ["Tokyo","Estocolmo","Berlín","Rio"]
    
    //variables para calcular tamaño de pantalla
    var widthScreen = UIScreen.main.bounds.width
    var heightScreen = UIScreen.main.bounds.height
    
    //MARK:viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.backgroundColor = .lightGray
        collection.dataSource = self //coger datos
        collection.delegate = self //acciones con los datos
        collection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "item")
        
        //print("El ancho de pantalla es: \(widthScreen), y el alto es: \(heightScreen)")/*para saber el tamaño de nuestra pantalla*/
        
    }
    
}

//MARK: Extensión dataSource
extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collection.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? CollectionViewCell
        item?.label.text = city[indexPath.row]
        item?.layer.cornerRadius = 15
        return item!
    }
    
    
    
}

//MARK: Extensión delegate
extension ViewController: UICollectionViewDelegate {
    
    //accion cuando seleccionamos un elemento de la tabla
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Has seleccionado: \(city[indexPath.row])")
    }
    
    
}

//MARK: extensión layaot
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (widthScreen-30)/2, height: widthScreen/2)
    }//si no queremos que haya espacios entre las celdas debemos ir al mainstoryboard en el collection y en collection view quitar el min spacing, y el stimate size ponerlo en none. Otra forma es con código, las siguientes funciones son para dar espacio o márgenes entre celdas
    
    //márgenes verticales entre celdas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //márgenes horizontales entre celdas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //frame o padding interior de la coleccion
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
