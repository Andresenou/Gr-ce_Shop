import 'package:flutter/material.dart';
import 'accueil.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  bool isPhoneSelected = true;
  String? inputField;
  bool showOtpField = false;
  String selectedCountryCode = '+33';
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final List<Map<String, String>> countries = [
    {'name': 'France', 'flag': '🇫🇷', 'code': '+33'},
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
  final List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    selectedCountryCode = countries[0]['code']!;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _fadeInAnimation = Tween<double>(
      begin: 3.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _scaleAnimation = Tween<double>(
      begin: 2.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _switchInputMode() {
    _animationController.reset();
    setState(() {
      isPhoneSelected = !isPhoneSelected;
      showOtpField = false;
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: FadeTransition(
            opacity: _fadeInAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: TweenAnimationBuilder(
                          duration: Duration(milliseconds: 600),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, double value, child) {
                            return Transform.scale(
                              scale: value,
                              child: child,
                            );
                          },
                          child: Column(
                            children: [
                              Icon(Icons.lock, size: 50, color: Colors.blueAccent),
                              SizedBox(height: 8),
                              Text(
                                'Connexion',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      if (!showOtpField) ...[
                        Row(
                          children: [
                            Expanded(
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (!isPhoneSelected) _switchInputMode();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: isPhoneSelected ? Colors.white : Colors.black87,
                                    backgroundColor: isPhoneSelected ? Colors.blueAccent : Colors.white,
                                  ),
                                  child: Text('Téléphone'),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (isPhoneSelected) _switchInputMode();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: !isPhoneSelected ? Colors.white : Colors.black87,
                                    backgroundColor: !isPhoneSelected ? Colors.blueAccent : Colors.white,
                                  ),
                                  child: Text('Email'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: animation.drive(
                                  Tween(begin: Offset(0.1, 0.0), end: Offset.zero)
                                      .chain(CurveTween(curve: Curves.easeOut)),
                                ),
                                child: child,
                              ),
                            );
                          },
                          child: isPhoneSelected
                              ? _buildPhoneInput()
                              : _buildEmailInput(),
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: TweenAnimationBuilder(
                            duration: Duration(milliseconds: 300),
                            tween: Tween<double>(begin: 0.8, end: 1.0),
                            builder: (context, double value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                            child: ElevatedButton(
                              onPressed: () {
                                if (inputField != null && inputField!.isNotEmpty) {
                                  setState(() {
                                    showOtpField = true;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                              ),
                              child: Text('Suivant'),
                            ),
                          ),
                        ),
                      ],
                      if (showOtpField)
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 400),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                          child: OtpWidget(
                            key: ValueKey<bool>(showOtpField),
                            controllers: otpControllers,
                            focusNodes: otpFocusNodes,
                  onOtpEntered: (otp) {
                              print("OTP entré: $otp");
                            },
                            context: context,
                          ),
                        ),
                      SizedBox(height: 16),
                      Center(
                        child: TweenAnimationBuilder(
                          duration: Duration(milliseconds: 400),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, double value, child) {
                            return Opacity(
                              opacity: value,
                              child: child,
                            );
                          },
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    var begin = Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.easeInOut;
                                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Créer un compte',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Row(
      key: ValueKey('phone'),
      children: [
        Container(
          width: 100,
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
            items: countries.map<DropdownMenuItem<String>>((country) {
              return DropdownMenuItem<String>(
                value: country['code'],
                child: Text(
                  '${country['flag']} ${country['name']} (${country['code']})',
                  style: TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
            selectedItemBuilder: (BuildContext context) {
              return countries.map<Widget>((country) {
                return Row(
                  children: [
                    Text(country['flag']!),
                    SizedBox(width: 4),
                    Text(country['code']!),
                  ],
                );
              }).toList();
            },
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Numéro de téléphone',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefix: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  '$selectedCountryCode ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            onChanged: (value) {
              inputField = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmailInput() {
    return TextField(
      key: ValueKey('email'),
      decoration: InputDecoration(
        labelText: 'Adresse email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        inputField = value;
      },
    );
  }
}

class OtpWidget extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final Function(String) onOtpEntered;
  final BuildContext context;

  OtpWidget({
    Key? key,
    required this.controllers,
    required this.focusNodes,
    required this.onOtpEntered,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Entrez le code OTP",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            6,
                (index) => TweenAnimationBuilder(
              duration: Duration(milliseconds: 2000 + (index * 100)),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Transform.scale(
                  scale: value,
                  child: Opacity(
                    opacity: value,
                    child: child,
                  ),
                );
              },
              child: _buildOTPField(controllers[index], focusNodes[index], index),
            ),
          ),
        ),
        SizedBox(height: 40),
        TweenAnimationBuilder(
          duration: Duration(milliseconds: 800),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white ,
              backgroundColor:  Colors.blueAccent ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Valider",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              String otp = controllers.map((controller) => controller.text).join();
              onOtpEntered(otp);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingPage(),));
            },
          ),
        ),
      ],
    );
  }
  Widget _buildOTPField(TextEditingController controller, FocusNode focusNode, int index) {
    return Container(
      width: 40,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          maxLength: 1,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 2.0,
              ),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              if (index < focusNodes.length - 1) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              }
            } else if (value.isEmpty && index > 0) {
              FocusScope.of(context).requestFocus(focusNodes[index - 1]);
            }
          },
        ),
      ),
    );
  }
}