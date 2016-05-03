//
//  Bookstore.swift
//  books-ios-app
//
//  Created by stagiaire on 03/05/2016.
//  Copyright © 2016 Nayed. All rights reserved.
//

import Foundation

class Bookstore {
    
    var bookstore: [Book] = []
    
    init() {
        let newBook = Book()
        
        newBook.title = "One Piece"
        newBook.author = "Eiichiro Oda"
        newBook.description = "Luffy et ses amis vont-ils affronter les membres du CP9 pour éviter que Robin ne quitte l'équipage à jamais ?! Ces derniers se rendent chez Franky pour s'emparer des plans de l'arme antique Pluton , mais c'est alors qu'une terrible vérité éclate au grand jour !!"
        bookstore.append(newBook)
        
        let newBook2 = Book()
        newBook2.title = "Bleach"
        newBook2.author = "Tite Kubo"
        newBook2.description = "Adolescent de quinze ans, Ichigo Kurosaki possède un don particulier : celui de voir les esprits. Un jour il croise la route d'une belle shinigami (un être spirituel) en train de pourchasser une 'âme perdue', un esprit maléfique qui hante notre monde et n'arrive pas à trouver le repos. Mise en difficulté par son ennemi, la jeune fille décide alors de prêter une partie de ses pouvoirs à Ichigo, mais ce dernier hérite finalement de toute la puissance de la shinigami. Contraint d'assumer son nouveau statut, Ichigo va devoir gérer ses deux vies : celle de lycéen ordinaire, et celle de chasseur de démons... Bleach est un manga d'action au rythme trépidant, au graphisme soigné et à l'intrigue palpitante."
        bookstore.append(newBook2)
    }
}