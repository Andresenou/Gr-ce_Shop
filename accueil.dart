import 'package:alibaba/panier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import 'detail.dart'; // Import nécessaire pour Timer

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final List<Map<String, String>> products = [
    {
      "image": "assets/e.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Chaussures haut de gamme pour hommes, conçues pour allier style et durabilité, parfaites pour toutes les occasions formelles ou décontractées.",
      "seller": "St André"
    },
    {
      "image": "assets/f.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Un sac en cuir élégant et fonctionnel, idéal pour répondre aux besoins professionnels et de voyage, avec un espace intérieur spacieux.",
      "seller": "St SENOU"
    },
    {
      "image": "assets/g.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre classique au design intemporel, adaptée à toutes les tenues et occasions, avec une précision exceptionnelle.",
      "seller": "St José"
    },
    {
      "image": "assets/h.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise élégante et robuste, conçue pour une utilisation quotidienne, offrant un équilibre parfait entre confort et esthétique.",
      "seller": "St Amour"
    },
    {
      "image": "assets/i.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Des chaussures décontractées et confortables, idéales pour une utilisation quotidienne et adaptées à un style de vie actif.",
      "seller": "St Marius"
    },
    {
      "image": "assets/j.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Un sac en cuir moderne et durable, avec de nombreux compartiments pour un rangement organisé et un style contemporain.",
      "seller": "St Urbain"
    },
    {
      "image": "assets/k.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre élégante avec un mécanisme de chronométrage précis, conçue pour offrir une apparence haut de gamme.",
      "seller": "St Intemporel"
    },
    {
      "image": "assets/l.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise luxueuse avec un coussin moelleux et un cadre solide, parfaite pour se détendre après une longue journée.",
      "seller": "St Confort"
    },
    {
      "image": "assets/m.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Parfaites pour des sorties décontractées, ces chaussures offrent un confort inégalé et un style moderne.",
      "seller": "St Chic"
    },
    {
      "image": "assets/n.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Un sac en cuir indispensable pour ceux qui apprécient la qualité et le style, adapté aux environnements professionnels.",
      "seller": "St Distinction"
    },
    {
      "image": "assets/o.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Une combinaison de sophistication et de fonctionnalité dans une seule montre, avec une finition premium.",
      "seller": "St Parfaite"
    },
    {
      "image": "assets/p.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise confortable conçue pour de longues heures de travail ou de détente, avec un design ergonomique.",
      "seller": "Relax & Co"
    },
    {
      "image": "assets/q.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Chaussures sportives conçues pour offrir une grande polyvalence et un confort optimal, adaptées à un mode de vie actif.",
      "seller": "Active Step"
    },
    {
      "image": "assets/r.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Sac élégant qui complète parfaitement toute tenue professionnelle, avec une finition raffinée et une durabilité accrue.",
      "seller": "St Cuir"
    },
    {
      "image": "assets/s.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre résistante à l'eau avec un design épuré et une construction haut de gamme, idéale pour une utilisation quotidienne.",
      "seller": "St Master"
    },
    {
      "image": "assets/u.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise durable avec une finition élégante et un attrait moderne, parfaite pour les espaces de travail ou de détente.",
      "seller": "St Contemporaine"
    },
    {
      "image": "assets/a.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Chaussures confortables et élégantes pour hommes, idéales pour toutes les occasions, qu'elles soient décontractées ou formelles.",
      "seller": "St Marche"
    },
    {
      "image": "assets/b.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Sac en cuir de qualité supérieure, doté d'un intérieur spacieux et d'une conception robuste pour une utilisation quotidienne.",
      "seller": "St Précieux"
    },
    {
      "image": "assets/c.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre élégante avec un design épuré et des performances fiables, parfaite pour ceux qui recherchent un style intemporel.",
      "seller": "St Élégance"
    },
    {
      "image": "assets/d.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise ergonomique avec des lignes modernes et un confort optimal, idéale pour des séances prolongées.",
      "seller": "St Excellence"
    },
    {
      "image": "assets/e.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Chaussures haut de gamme pour hommes, conçues pour allier style et durabilité, parfaites pour toutes les occasions formelles ou décontractées.",
      "seller": "St André"
    },
    {
      "image": "assets/f.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Un sac en cuir élégant et fonctionnel, idéal pour répondre aux besoins professionnels et de voyage, avec un espace intérieur spacieux.",
      "seller": "St SENOU"
    },
    {
      "image": "assets/g.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre classique au design intemporel, adaptée à toutes les tenues et occasions, avec une précision exceptionnelle.",
      "seller": "St José"
    },
    {
      "image": "assets/h.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise élégante et robuste, conçue pour une utilisation quotidienne, offrant un équilibre parfait entre confort et esthétique.",
      "seller": "St Amour"
    },
    {
      "image": "assets/i.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Des chaussures décontractées et confortables, idéales pour une utilisation quotidienne et adaptées à un style de vie actif.",
      "seller": "St Marius"
    },
    {
      "image": "assets/j.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Un sac en cuir moderne et durable, avec de nombreux compartiments pour un rangement organisé et un style contemporain.",
      "seller": "St Urbain"
    },
    {
      "image": "assets/k.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre élégante avec un mécanisme de chronométrage précis, conçue pour offrir une apparence haut de gamme.",
      "seller": "St Intemporel"
    },
    {
      "image": "assets/l.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise luxueuse avec un coussin moelleux et un cadre solide, parfaite pour se détendre après une longue journée.",
      "seller": "St Confort"
    },
    {
      "image": "assets/m.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Parfaites pour des sorties décontractées, ces chaussures offrent un confort inégalé et un style moderne.",
      "seller": "St Chic"
    },
    {
      "image": "assets/n.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Un sac en cuir indispensable pour ceux qui apprécient la qualité et le style, adapté aux environnements professionnels.",
      "seller": "St Distinction"
    },
    {
      "image": "assets/o.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Une combinaison de sophistication et de fonctionnalité dans une seule montre, avec une finition premium.",
      "seller": "St Parfaite"
    },
    {
      "image": "assets/p.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise confortable conçue pour de longues heures de travail ou de détente, avec un design ergonomique.",
      "seller": "Relax & Co"
    },
    {
      "image": "assets/q.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Chaussures sportives conçues pour offrir une grande polyvalence et un confort optimal, adaptées à un mode de vie actif.",
      "seller": "Active Step"
    },
    {
      "image": "assets/r.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Sac élégant qui complète parfaitement toute tenue professionnelle, avec une finition raffinée et une durabilité accrue.",
      "seller": "St Cuir"
    },
    {
      "image": "assets/s.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre résistante à l'eau avec un design épuré et une construction haut de gamme, idéale pour une utilisation quotidienne.",
      "seller": "St Master"
    },
    {
      "image": "assets/u.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise durable avec une finition élégante et un attrait moderne, parfaite pour les espaces de travail ou de détente.",
      "seller": "St Contemporaine"
    },
    {
      "image": "assets/a.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Chaussures confortables et élégantes pour hommes, idéales pour toutes les occasions, qu'elles soient décontractées ou formelles.",
      "seller": "St Marche"
    },
    {
      "image": "assets/b.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Sac en cuir de qualité supérieure, doté d'un intérieur spacieux et d'une conception robuste pour une utilisation quotidienne.",
      "seller": "St Précieux"
    },
    {
      "image": "assets/c.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre élégante avec un design épuré et des performances fiables, parfaite pour ceux qui recherchent un style intemporel.",
      "seller": "St Élégance"
    },
    {
      "image": "assets/d.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise ergonomique avec des lignes modernes et un confort optimal, idéale pour des séances prolongées.",
      "seller": "St Excellence"
    }
    // Ajoutez d'autres produits ici
  ];

  final List<Map<String, String>> promoProducts = [
    {
      "image": "assets/za.jpg",
      "title": "Promo 1",
      "price": "\$100",
      "description": "Special offer on stylish sneakers."
    },
    {
      "image": "assets/zb.jpg",
      "title": "Promo 2",
      "price": "\$150",
      "description": "Exclusive offer on premium leather bags."
    },
    {
      "image": "assets/zc.jpg",
      "title": "Promo 3",
      "price": "\$200",
      "description": "Limited-time offer on elegant watches."
    },
    {
      "image": "assets/e.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Chaussures haut de gamme pour hommes, conçues pour allier style et durabilité, parfaites pour toutes les occasions formelles ou décontractées.",
      "seller": "St André"
    },
    {
      "image": "assets/f.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Un sac en cuir élégant et fonctionnel, idéal pour répondre aux besoins professionnels et de voyage, avec un espace intérieur spacieux.",
      "seller": "St SENOU"
    },
    {
      "image": "assets/g.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre classique au design intemporel, adaptée à toutes les tenues et occasions, avec une précision exceptionnelle.",
      "seller": "St José"
    },
    {
      "image": "assets/h.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise élégante et robuste, conçue pour une utilisation quotidienne, offrant un équilibre parfait entre confort et esthétique.",
      "seller": "St Amour"
    },
    {
      "image": "assets/i.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Des chaussures décontractées et confortables, idéales pour une utilisation quotidienne et adaptées à un style de vie actif.",
      "seller": "St Marius"
    },
    {
      "image": "assets/j.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Un sac en cuir moderne et durable, avec de nombreux compartiments pour un rangement organisé et un style contemporain.",
      "seller": "St Urbain"
    },
    {
      "image": "assets/k.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre élégante avec un mécanisme de chronométrage précis, conçue pour offrir une apparence haut de gamme.",
      "seller": "St Intemporel"
    },
    {
      "image": "assets/l.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise luxueuse avec un coussin moelleux et un cadre solide, parfaite pour se détendre après une longue journée.",
      "seller": "St Confort"
    },
    {
      "image": "assets/m.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Parfaites pour des sorties décontractées, ces chaussures offrent un confort inégalé et un style moderne.",
      "seller": "St Chic"
    },
    {
      "image": "assets/n.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Un sac en cuir indispensable pour ceux qui apprécient la qualité et le style, adapté aux environnements professionnels.",
      "seller": "St Distinction"
    },
    {
      "image": "assets/o.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Une combinaison de sophistication et de fonctionnalité dans une seule montre, avec une finition premium.",
      "seller": "St Parfaite"
    },
    {
      "image": "assets/p.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise confortable conçue pour de longues heures de travail ou de détente, avec un design ergonomique.",
      "seller": "Relax & Co"
    },
    {
      "image": "assets/q.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Chaussures sportives conçues pour offrir une grande polyvalence et un confort optimal, adaptées à un mode de vie actif.",
      "seller": "Active Step"
    },
    {
      "image": "assets/r.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Sac élégant qui complète parfaitement toute tenue professionnelle, avec une finition raffinée et une durabilité accrue.",
      "seller": "St Cuir"
    },
    {
      "image": "assets/s.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre résistante à l'eau avec un design épuré et une construction haut de gamme, idéale pour une utilisation quotidienne.",
      "seller": "St Master"
    },
    {
      "image": "assets/u.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise durable avec une finition élégante et un attrait moderne, parfaite pour les espaces de travail ou de détente.",
      "seller": "St Contemporaine"
    },
    {
      "image": "assets/a.jpg",
      "title": "Chaussures pour hommes",
      "price": "684 FCFA",
      "description":
          "Chaussures confortables et élégantes pour hommes, idéales pour toutes les occasions, qu'elles soient décontractées ou formelles.",
      "seller": "St Marche"
    },
    {
      "image": "assets/b.jpg",
      "title": "Sac en cuir",
      "price": "1162 FCFA",
      "description":
          "Sac en cuir de qualité supérieure, doté d'un intérieur spacieux et d'une conception robuste pour une utilisation quotidienne.",
      "seller": "St Précieux"
    },
    {
      "image": "assets/c.jpg",
      "title": "Montre",
      "price": "1425 FCFA",
      "description":
          "Montre élégante avec un design épuré et des performances fiables, parfaite pour ceux qui recherchent un style intemporel.",
      "seller": "St Élégance"
    },
    {
      "image": "assets/d.jpg",
      "title": "Chaise",
      "price": "2565 FCFA",
      "description":
          "Chaise ergonomique avec des lignes modernes et un confort optimal, idéale pour des séances prolongées.",
      "seller": "St Excellence"
    }
  ];

  int _currentPromoIndex = 0;
  bool _isVisible = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _startPromoImages();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isVisible) {
        setState(() {
          print("Hiding navigation bar");
          _isVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isVisible) {
        setState(() {
          print("Showing navigation bar");
          _isVisible = true;
        });
      }
    }
  }

  void _startPromoImages() {
    Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        _currentPromoIndex = (_currentPromoIndex + 1) % promoProducts.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: FloatingActionButton(
          onPressed: () {
            // Action pour le bouton central
          },
          elevation: 10,
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            Icons.history,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        hintText: "Rechercher des produits...",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[700],
                          size: 24,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StyledShoppingCartPage(),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: GestureDetector(
                onTap: () {
                  _navigateToProductDetails(
                    context,
                    promoProducts[_currentPromoIndex]["image"]!,
                    promoProducts[_currentPromoIndex]["title"]!,
                    promoProducts[_currentPromoIndex]["price"]!,
                    promoProducts[_currentPromoIndex]["description"]!,
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.asset(
                          promoProducts[_currentPromoIndex]["image"]!,
                          fit: BoxFit.cover,
                          height: 150.0,
                          width: double.infinity,
                          colorBlendMode: BlendMode.darken,
                          color: Colors.black26,
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              promoProducts[_currentPromoIndex]["title"]! +
                                  " - " +
                                  promoProducts[_currentPromoIndex]["price"]!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = products[index];
                  return _buildProductCard(
                    product: product,
                    context: context,
                  );
                },
                childCount: products.length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: BottomAppBar(
          elevation: 10,
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: Colors.white,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = constraints.maxWidth;
                final iconSize = screenWidth * 0.09;
                final fontSize = screenWidth * 0.05;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildNavItem(Icons.home, 'Accueil', () {
                      // Action pour "Home"
                    }, Colors.deepPurple, iconSize, fontSize),
                    _buildNavItem(Icons.notifications, 'Notif', () {
                      // Action pour "Alert"
                    }, Colors.orange, iconSize, fontSize),
                    SizedBox(width: 20),
                    _buildNavItem(Icons.favorite, 'Favoris', () {
                      // Action pour "Favorites"
                    }, Colors.pink, iconSize, fontSize),
                    _buildNavItem(Icons.person, 'Compte', () {
                      // Action pour "Account"
                    }, Colors.teal, iconSize, fontSize),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, VoidCallback onPressed,
      Color color, double iconSize, double fontSize) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              icon,
              color: color,
              size: iconSize,
            ),
            onPressed: onPressed,
            splashRadius: iconSize * 0.7,
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required Map<String, String> product,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        _navigateToProductDetails(context, product["image"]!, product["title"]!,
            product["price"]!, product["description"]!);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Image.asset(
                    product["image"]!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product["title"]!,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      product["price"]!,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        product["seller"]!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue,
                        ),
                        overflow: TextOverflow.ellipsis,
                        // Tronque le texte s'il est trop long
                        maxLines: 1, // Limite le texte à une seule ligne
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void _navigateToProductDetails(
    BuildContext context,
    String imageAsset,
    String title,
    String price,
    String description,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(
          imageAsset: imageAsset,
          title: title,
          price: price,
          description: description,
        ),
      ),
    );
  }
}
