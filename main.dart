import 'package:alibaba/sign.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool otp = false;
  bool isSeller = false;
  bool isBuyer = true;
  bool showUserDetails = false;
  bool showContactOption = false;
  bool isPhoneSelected = true;
  bool isAccepted = false;
  String selectedCountryCode = '+33';
  final List<TextEditingController> otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());
  final List<Map<String, String>> countries = [
    {'name': 'Afghanistan', 'flag': '🇦🇫', 'code': '+93'},
    {'name': 'Afrique du Sud', 'flag': '🇿🇦', 'code': '+27'},
    {'name': 'Albanie', 'flag': '🇦🇱', 'code': '+355'},
    {'name': 'Algérie', 'flag': '🇩🇿', 'code': '+213'},
    {'name': 'Allemagne', 'flag': '🇩🇪', 'code': '+49'},
    {'name': 'Andorre', 'flag': '🇦🇩', 'code': '+376'},
    {'name': 'Angola', 'flag': '🇦🇴', 'code': '+244'},
    {'name': 'Antigua-et-Barbuda', 'flag': '🇦🇬', 'code': '+1-268'},
    {'name': 'Arabie saoudite', 'flag': '🇸🇦', 'code': '+966'},
    {'name': 'Argentine', 'flag': '🇦🇷', 'code': '+54'},
    {'name': 'Arménie', 'flag': '🇦🇲', 'code': '+374'},
    {'name': 'Australie', 'flag': '🇦🇺', 'code': '+61'},
    {'name': 'Autriche', 'flag': '🇦🇹', 'code': '+43'},
    {'name': 'Azerbaïdjan', 'flag': '🇦🇿', 'code': '+994'},
    {'name': 'Bahamas', 'flag': '🇧🇸', 'code': '+1-242'},
    {'name': 'Bahreïn', 'flag': '🇧🇭', 'code': '+973'},
    {'name': 'Bangladesh', 'flag': '🇧🇩', 'code': '+880'},
    {'name': 'Barbade', 'flag': '🇧🇧', 'code': '+1-246'},
    {'name': 'Belgique', 'flag': '🇧🇪', 'code': '+32'},
    {'name': 'Belize', 'flag': '🇧🇿', 'code': '+501'},
    {'name': 'Bénin', 'flag': '🇧🇯', 'code': '+229'},
    {'name': 'Bhoutan', 'flag': '🇧🇹', 'code': '+975'},
    {'name': 'Biélorussie', 'flag': '🇧🇾', 'code': '+375'},
    {'name': 'Bolivie', 'flag': '🇧🇴', 'code': '+591'},
    {'name': 'Bosnie-Herzégovine', 'flag': '🇧🇦', 'code': '+387'},
    {'name': 'Botswana', 'flag': '🇧🇼', 'code': '+267'},
    {'name': 'Brésil', 'flag': '🇧🇷', 'code': '+55'},
    {'name': 'Brunei', 'flag': '🇧🇳', 'code': '+673'},
    {'name': 'Bulgarie', 'flag': '🇧🇬', 'code': '+359'},
    {'name': 'Burkina Faso', 'flag': '🇧🇫', 'code': '+226'},
    {'name': 'Burundi', 'flag': '🇧🇮', 'code': '+257'},
    {'name': 'Cabo Verde', 'flag': '🇨🇻', 'code': '+238'},
    {'name': 'Cambodge', 'flag': '🇰🇭', 'code': '+855'},
    {'name': 'Cameroun', 'flag': '🇨🇲', 'code': '+237'},
    {'name': 'Canada', 'flag': '🇨🇦', 'code': '+1'},
    {'name': 'Chili', 'flag': '🇨🇱', 'code': '+56'},
    {'name': 'Chine', 'flag': '🇨🇳', 'code': '+86'},
    {'name': 'Chypre', 'flag': '🇨🇾', 'code': '+357'},
    {'name': 'Colombie', 'flag': '🇨🇴', 'code': '+57'},
    {'name': 'Comores', 'flag': '🇰🇲', 'code': '+269'},
    {'name': 'Corée du Nord', 'flag': '🇰🇵', 'code': '+850'},
    {'name': 'Corée du Sud', 'flag': '🇰🇷', 'code': '+82'},
    {'name': 'Costa Rica', 'flag': '🇨🇷', 'code': '+506'},
    {'name': 'Côte d\'Ivoire', 'flag': '🇨🇮', 'code': '+225'},
    {'name': 'Croatie', 'flag': '🇭🇷', 'code': '+385'},
    {'name': 'Cuba', 'flag': '🇨🇺', 'code': '+53'},
    {'name': 'Danemark', 'flag': '🇩🇰', 'code': '+45'},
    {'name': 'Djibouti', 'flag': '🇩🇯', 'code': '+253'},
    {'name': 'Dominique', 'flag': '🇩🇲', 'code': '+1-767'},
    {'name': 'Égypte', 'flag': '🇪🇬', 'code': '+20'},
    {'name': 'Émirats arabes unis', 'flag': '🇦🇪', 'code': '+971'},
    {'name': 'Équateur', 'flag': '🇪🇨', 'code': '+593'},
    {'name': 'Érythrée', 'flag': '🇪🇷', 'code': '+291'},
    {'name': 'Espagne', 'flag': '🇪🇸', 'code': '+34'},
    {'name': 'Estonie', 'flag': '🇪🇪', 'code': '+372'},
    {'name': 'Eswatini', 'flag': '🇸🇿', 'code': '+268'},
    {'name': 'États-Unis d\'Amérique', 'flag': '🇺🇸', 'code': '+1'},
    {'name': 'Éthiopie', 'flag': '🇪🇹', 'code': '+251'},
    {'name': 'Fidji', 'flag': '🇫🇯', 'code': '+679'},
    {'name': 'Finlande', 'flag': '🇫🇮', 'code': '+358'},
    {'name': 'France', 'flag': '🇫🇷', 'code': '+33'},
    {'name': 'Gabon', 'flag': '🇬🇦', 'code': '+241'},
    {'name': 'Gambie', 'flag': '🇬🇲', 'code': '+220'},
    {'name': 'Géorgie', 'flag': '🇬🇪', 'code': '+995'},
    {'name': 'Ghana', 'flag': '🇬🇭', 'code': '+233'},
    {'name': 'Grèce', 'flag': '🇬🇷', 'code': '+30'},
    {'name': 'Grenade', 'flag': '🇬🇩', 'code': '+1-473'},
    {'name': 'Guatemala', 'flag': '🇬🇹', 'code': '+502'},
    {'name': 'Guinée', 'flag': '🇬🇳', 'code': '+224'},
    {'name': 'Guinée-Bissau', 'flag': '🇬🇼', 'code': '+245'},
    {'name': 'Guinée équatoriale', 'flag': '🇬🇶', 'code': '+240'},
    {'name': 'Guyana', 'flag': '🇬🇾', 'code': '+592'},
    {'name': 'Haïti', 'flag': '🇭🇹', 'code': '+509'},
    {'name': 'Honduras', 'flag': '🇭🇳', 'code': '+504'},
    {'name': 'Hongrie', 'flag': '🇭🇺', 'code': '+36'},
    {'name': 'Inde', 'flag': '🇮🇳', 'code': '+91'},
    {'name': 'Indonésie', 'flag': '🇮🇩', 'code': '+62'},
    {'name': 'Irak', 'flag': '🇮🇶', 'code': '+964'},
    {'name': 'Iran', 'flag': '🇮🇷', 'code': '+98'},
    {'name': 'Irlande', 'flag': '🇮🇪', 'code': '+353'},
    {'name': 'Islande', 'flag': '🇮🇸', 'code': '+354'},
    {'name': 'Israël', 'flag': '🇮🇱', 'code': '+972'},
    {'name': 'Italie', 'flag': '🇮🇹', 'code': '+39'},
    {'name': 'Jamaïque', 'flag': '🇯🇲', 'code': '+1-876'},
    {'name': 'Japon', 'flag': '🇯🇵', 'code': '+81'},
    {'name': 'Jordanie', 'flag': '🇯🇴', 'code': '+962'},
    {'name': 'Kazakhstan', 'flag': '🇰🇿', 'code': '+7'},
    {'name': 'Kenya', 'flag': '🇰🇪', 'code': '+254'},
    {'name': 'Kirghizistan', 'flag': '🇰🇬', 'code': '+996'},
    {'name': 'Kiribati', 'flag': '🇰🇮', 'code': '+686'},
    {'name': 'Kosovo', 'flag': '🇽🇰', 'code': '+383'},
    {'name': 'Koweït', 'flag': '🇰🇼', 'code': '+965'},
    {'name': 'Laos', 'flag': '🇱🇦', 'code': '+856'},
    {'name': 'Lesotho', 'flag': '🇱🇸', 'code': '+266'},
    {'name': 'Lettonie', 'flag': '🇱🇻', 'code': '+371'},
    {'name': 'Liban', 'flag': '🇱🇧', 'code': '+961'},
    {'name': 'Libéria', 'flag': '🇱🇷', 'code': '+231'},
    {'name': 'Libye', 'flag': '🇱🇾', 'code': '+218'},
    {'name': 'Liechtenstein', 'flag': '🇱🇮', 'code': '+423'},
    {'name': 'Lituanie', 'flag': '🇱🇹', 'code': '+370'},
    {'name': 'Luxembourg', 'flag': '🇱🇺', 'code': '+352'},
    {'name': 'Madagascar', 'flag': '🇲🇬', 'code': '+261'},
    {'name': 'Malaisie', 'flag': '🇲🇾', 'code': '+60'},
    {'name': 'Malawi', 'flag': '🇲🇼', 'code': '+265'},
    {'name': 'Maldives', 'flag': '🇲🇻', 'code': '+960'},
    {'name': 'Mali', 'flag': '🇲🇱', 'code': '+223'},
    {'name': 'Malte', 'flag': '🇲🇹', 'code': '+356'},
    {'name': 'Maroc', 'flag': '🇲🇦', 'code': '+212'},
    {'name': 'Maurice', 'flag': '🇲🇺', 'code': '+230'},
    {'name': 'Mauritanie', 'flag': '🇲🇷', 'code': '+222'},
    {'name': 'Mexique', 'flag': '🇲🇽', 'code': '+52'},
    {'name': 'Moldavie', 'flag': '🇲🇩', 'code': '+373'},
    {'name': 'Monaco', 'flag': '🇲🇨', 'code': '+377'},
    {'name': 'Mongolie', 'flag': '🇲🇳', 'code': '+976'},
    {'name': 'Monténégro', 'flag': '🇲🇪', 'code': '+382'},
    {'name': 'Mozambique', 'flag': '🇲🇿', 'code': '+258'},
    {'name': 'Myanmar', 'flag': '🇲🇲', 'code': '+95'},
    {'name': 'Namibie', 'flag': '🇳🇦', 'code': '+264'},
    {'name': 'Népal', 'flag': '🇳🇵', 'code': '+977'},
    {'name': 'Nicaragua', 'flag': '🇳🇮', 'code': '+505'},
    {'name': 'Niger', 'flag': '🇳🇪', 'code': '+227'},
    {'name': 'Nigeria', 'flag': '🇳🇬', 'code': '+234'},
    {'name': 'Norvège', 'flag': '🇳🇴', 'code': '+47'},
    {'name': 'Nouvelle-Zélande', 'flag': '🇳🇿', 'code': '+64'},
    {'name': 'Oman', 'flag': '🇴🇲', 'code': '+968'},
    {'name': 'Ouganda', 'flag': '🇺🇬', 'code': '+256'},
    {'name': 'Ouzbékistan', 'flag': '🇺🇿', 'code': '+998'},
    {'name': 'Pakistan', 'flag': '🇵🇰', 'code': '+92'},
    {'name': 'Palaos', 'flag': '🇵🇼', 'code': '+680'},
    {'name': 'Panama', 'flag': '🇵🇦', 'code': '+507'},
    {'name': 'Papouasie-Nouvelle-Guinée', 'flag': '🇵🇬', 'code': '+675'},
    {'name': 'Paraguay', 'flag': '🇵🇾', 'code': '+595'},
    {'name': 'Pays-Bas', 'flag': '🇳🇱', 'code': '+31'},
    {'name': 'Pérou', 'flag': '🇵🇪', 'code': '+51'},
    {'name': 'Philippines', 'flag': '🇵🇭', 'code': '+63'},
    {'name': 'Pologne', 'flag': '🇵🇱', 'code': '+48'},
    {'name': 'Portugal', 'flag': '🇵🇹', 'code': '+351'},
    {'name': 'Qatar', 'flag': '🇶🇦', 'code': '+974'},
    {'name': 'République centrafricaine', 'flag': '🇨🇫', 'code': '+236'},
    {
      'name': 'République démocratique du Congo',
      'flag': '🇨🇩',
      'code': '+243'
    },
    {'name': 'République dominicaine', 'flag': '🇩🇴', 'code': '+1-809'},
    {'name': 'République tchèque', 'flag': '🇨🇿', 'code': '+420'},
    {'name': 'Roumanie', 'flag': '🇷🇴', 'code': '+40'},
    {'name': 'Royaume-Uni', 'flag': '🇬🇧', 'code': '+44'},
    {'name': 'Russie', 'flag': '🇷🇺', 'code': '+7'},
    {'name': 'Rwanda', 'flag': '🇷🇼', 'code': '+250'},
    {'name': 'Saint-Christophe-et-Niévès', 'flag': '🇰🇳', 'code': '+1-869'},
    {'name': 'Sainte-Lucie', 'flag': '🇱🇨', 'code': '+1-758'},
    {'name': 'Saint-Marin', 'flag': '🇸🇲', 'code': '+378'},
    {
      'name': 'Saint-Vincent-et-les-Grenadines',
      'flag': '🇻🇨',
      'code': '+1-784'
    },
    {'name': 'Salomon', 'flag': '🇸🇧', 'code': '+677'},
    {'name': 'Salvador', 'flag': '🇸🇻', 'code': '+503'},
    {'name': 'Samoa', 'flag': '🇼🇸', 'code': '+685'},
    {'name': 'São Tomé-et-Príncipe', 'flag': '🇸🇹', 'code': '+239'},
    {'name': 'Sénégal', 'flag': '🇸🇳', 'code': '+221'},
    {'name': 'Serbie', 'flag': '🇷🇸', 'code': '+381'},
    {'name': 'Seychelles', 'flag': '🇸🇨', 'code': '+248'},
    {'name': 'Sierra Leone', 'flag': '🇸🇱', 'code': '+232'},
    {'name': 'Singapour', 'flag': '🇸🇬', 'code': '+65'},
    {'name': 'Slovaquie', 'flag': '🇸🇰', 'code': '+421'},
    {'name': 'Slovénie', 'flag': '🇸🇮', 'code': '+386'},
    {'name': 'Somalie', 'flag': '🇸🇴', 'code': '+252'},
    {'name': 'Soudan', 'flag': '🇸🇩', 'code': '+249'},
    {'name': 'Soudan du Sud', 'flag': '🇸🇸', 'code': '+211'},
    {'name': 'Sri Lanka', 'flag': '🇱🇰', 'code': '+94'},
    {'name': 'Suède', 'flag': '🇸🇪', 'code': '+46'},
    {'name': 'Suisse', 'flag': '🇨🇭', 'code': '+41'},
    {'name': 'Suriname', 'flag': '🇸🇷', 'code': '+597'},
    {'name': 'Syrie', 'flag': '🇸🇾', 'code': '+963'},
    {'name': 'Tadjikistan', 'flag': '🇹🇯', 'code': '+992'},
    {'name': 'Tanzanie', 'flag': '🇹🇿', 'code': '+255'},
    {'name': 'Tchad', 'flag': '🇹🇩', 'code': '+235'},
    {'name': 'Thaïlande', 'flag': '🇹🇭', 'code': '+66'},
    {'name': 'Timor oriental', 'flag': '🇹🇱', 'code': '+670'},
    {'name': 'Togo', 'flag': '🇹🇬', 'code': '+228'},
    {'name': 'Tonga', 'flag': '🇹🇴', 'code': '+676'},
    {'name': 'Trinité-et-Tobago', 'flag': '🇹🇹', 'code': '+1-868'},
    {'name': 'Tunisie', 'flag': '🇹🇳', 'code': '+216'},
    {'name': 'Turkménistan', 'flag': '🇹🇲', 'code': '+993'},
    {'name': 'Turquie', 'flag': '🇹🇷', 'code': '+90'},
    {'name': 'Tuvalu', 'flag': '🇹🇻', 'code': '+688'},
    {'name': 'Ukraine', 'flag': '🇺🇦', 'code': '+380'},
    {'name': 'Uruguay', 'flag': '🇺🇾', 'code': '+598'},
    {'name': 'Vanuatu', 'flag': '🇻🇺', 'code': '+678'},
    {'name': 'Vatican', 'flag': '🇻🇦', 'code': '+39'},
    {'name': 'Venezuela', 'flag': '🇻🇪', 'code': '+58'},
    {'name': 'Vietnam', 'flag': '🇻🇳', 'code': '+84'},
    {'name': 'Yémen', 'flag': '🇾🇪', 'code': '+967'},
    {'name': 'Zambie', 'flag': '🇿🇲', 'code': '+260'},
    {'name': 'Zimbabwe', 'flag': '🇿🇼', 'code': '+263'},

// Ajoutez le reste ici...
  ];
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Icon(Icons.shop, size: 60, color: Colors.blueAccent),
                      SizedBox(height: 10),
                      Text(
                        'Grâce Shop',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // Étape 1 : Choisir entre vendeur et acheteur
                if (!showUserDetails && !showContactOption && !otp) ...[
                  Center(
                    child: Text(
                      "Vous êtes: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign
                          .center, // Assure l'alignement du texte dans son conteneur
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildRoleOption('Acheteur', isBuyer, () {
                        setState(() {
                          isBuyer = true;
                          isSeller = false;
                        });
                      }),
                      SizedBox(
                        width: 10,
                      ),
                      _buildRoleOption('Vendeur', isSeller, () {
                        setState(() {
                          isSeller = true;
                          isBuyer = false;
                        });
                      }),
                    ],
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: (isSeller || isBuyer)
                          ? () {
                              setState(() {
                                showUserDetails = true;
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text("Suivant"),
                    ),
                  )
                ],

                // Étape 2 : Détails utilisateur pour vendeur ou acheteur
                if (showUserDetails && !showContactOption && !otp) ...[
                  SizedBox(height: 30),
                  Text(
                    'Inscription',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 30),
                  if (isSeller) ...[
                    _buildTextField('Nom d\'utilisateur', Icons.person_outline),
                    SizedBox(
                      height: 10,
                    ),
                    _buildTextField(
                        'Nom de la boutique', Icons.store_mall_directory),
                    SizedBox(
                      height: 10,
                    ),
                    _buildTextField(
                        'Adresse de la boutique', Icons.location_on),
                  ] else if (isBuyer) ...[
                    _buildTextField('Nom d\'utilisateur', Icons.person_outline),
                  ],
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavButton('Retour', Colors.grey, () {
                        setState(() {
                          showUserDetails = false;
                        });
                      }),
                      _buildNavButton('Suivant', Colors.blueAccent, () {
                        setState(() {
                          showContactOption = true;
                        });
                      }),
                    ],
                  ),
                ],

                // Étape 3 : Choix de la méthode de contact
                if (showContactOption) ...[
                  SizedBox(height: 30),
                  Text(
                    'Choisissez une méthode de contact',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      _buildContactOption('Téléphone', isPhoneSelected, () {
                        setState(() {
                          isPhoneSelected = true;
                        });
                      }),
                      SizedBox(width: 10),
                      _buildContactOption('Email', !isPhoneSelected, () {
                        setState(() {
                          isPhoneSelected = false;
                        });
                      }),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Champ numéro de téléphone ou e-mail
                  if (isPhoneSelected)
                    _buildPhoneField()
                  else
                    _buildEmailField(),

                  SizedBox(height: 20),
                  _buildAcceptCheckBox(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavButton('Retour', Colors.grey, () {
                        setState(() {
                          showContactOption = false;
                        });
                      }),
                      _buildSubmitButton()
                    ],
                  ),
                ],

                // Étape 4 : Choix de la méthode de contact
                if (otp) ...[
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: OtpWidget(
                      key: ValueKey<bool>(otp),
                      controllers: otpControllers,
                      focusNodes: otpFocusNodes,
                      onOtpEntered: (otp) {
                        print("OTP entré: $otp");
                      },
                      context: context,
                    ),
                  ),
                ],
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Déjà un compte? ',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      // Style pour le texte non cliquable
                      children: [
                        TextSpan(
                          text: 'connexion',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleOption(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          backgroundColor: isSelected ? Colors.blueAccent : Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: isSelected ? Colors.blueAccent.withOpacity(0.3) : null,
          elevation: isSelected ? 6 : 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }

  Widget _buildNavButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(label),
    );
  }

  Widget _buildContactOption(
      String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          backgroundColor: isSelected ? Colors.blueAccent : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Row(
      children: [
        // Limiter la largeur du conteneur pour le DropdownButton
        Flexible(
          flex: 2, // Définir une proportion relative
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              value: selectedCountryCode,
              isExpanded: true,
              underline: SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountryCode = newValue!;
                });
              },
              items: countries
                  .map<DropdownMenuItem<String>>((Map<String, String> country) {
                return DropdownMenuItem<String>(
                  value: country['code']!,
                  child: Row(
                    children: [
                      Text(country['flag']!),
                      SizedBox(width: 5),
                      Expanded(
                          child: Text(country['name']!,
                              overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(width: 10),
        // Étendre le TextField pour occuper l'espace restant
        Expanded(
          flex: 3,
          child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Numéro de téléphone',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'E-mail',
        suffixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }

  Widget _buildAcceptCheckBox() {
    return Row(
      children: [
        Checkbox(
          value: isAccepted,
          onChanged: (bool? newValue) {
            setState(() {
              isAccepted = newValue!;
            });
          },
        ),
        Text(
          'J\'accepte les conditions d\'utilisation',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: isAccepted
          ? () {
              setState(() {
                otp = true;
                showContactOption = false;
              });
            }
          : null,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text('S\'inscrire'),
    );
  }
}
