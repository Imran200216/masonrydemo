import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// staggered images
    List<String> images = [
      "https://i.pinimg.com/736x/33/5f/14/335f14c8ab65728212c583fb2e238635.jpg",
      "https://i.pinimg.com/736x/da/90/10/da9010370ee7b0bbb0413f26bab01ed4.jpg",
      "https://images.unsplash.com/photo-1732521722114-5e86ad43ecb8?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://i.pinimg.com/736x/b1/ad/0a/b1ad0a647d9216ae24479542f3fbf407.jpg",
      "https://images.unsplash.com/photo-1732286521445-38bf3ae156cd?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://i.pinimg.com/736x/4d/a8/b2/4da8b20b92697238dbdada4a32ea2ef7.jpg",
      "https://images.unsplash.com/photo-1732286539698-7f57ab779a85?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://i.pinimg.com/736x/72/d2/97/72d2972b663254fe0cd6de41ae8476cd.jpg",
      "https://images.unsplash.com/photo-1732054085782-a6514029ef12?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://i.pinimg.com/736x/58/1c/a8/581ca8779ad8a929b6b3d8165c9c52d4.jpg",
      "https://images.unsplash.com/photo-1700064990923-b1af57cf58db?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://i.pinimg.com/736x/2e/4c/11/2e4c11012e3d2ab69430e0054624a230.jpg",
      "https://images.unsplash.com/photo-1732188026835-3ac4b1f2c938?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://i.pinimg.com/736x/65/96/81/659681421535363702441958dcae2012.jpg",
      "https://images.unsplash.com/photo-1732296885178-6ee6aa71c01c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://i.pinimg.com/736x/8a/01/6f/8a016fb754afcf08927be3fb65ec1e36.jpg",
    ];

    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black45,
        title: const Text("Modeling Feeds"),
        titleTextStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: RepaintBoundary(
          child: MasonryGridView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: images[index],
                    cacheKey: images[index],
                    placeholder: (context, url) => Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/jpg/image-model-placeholder.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ),
      ),
    );
  }
}
