import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button + title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz),
                ],
              ),

              const SizedBox(height: 8),
              const Text(
                "Sokha Angkor Resort",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "This is the place that you should not miss with hot pool if you stay in our resort",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Price: \$265\nRating: 4.5",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Book Now"),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // Gallery
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/resort1.jpg"),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: Image.asset("assets/images/resort2.jpg", height: 120, fit: BoxFit.cover)),
                  const SizedBox(width: 8),
                  Expanded(child: Image.asset("assets/images/resort3.jpg", height: 120, fit: BoxFit.cover)),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Reviews",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),
              _buildReview(
                avatar: "assets/images/user1.jpg",
                name: "Jianh Nas",
                rating: 5,
                timeAgo: "1 days ago",
                comment:
                    "This caption captures the essence of a fun and cozy pizza night. It’s concise and evokes a warm, inviting atmosphere, emphasizing freshness and satisfaction.",
              ),
              const SizedBox(height: 12),
              _buildReview(
                avatar: "assets/images/user2.jpg",
                name: "Jidi Dodo",
                rating: 5,
                timeAgo: "5 days ago",
                badge: "bunpheng",
                comment:
                    "This caption captures the essence of a fun and cozy pizza night. Add a playful element or detail like fresh basil, zesty tomatoes, and gooey cheese.",
              ),
              const SizedBox(height: 12),
              _buildReview(
                avatar: "assets/images/user3.jpg",
                name: "Moso sas",
                rating: 5,
                timeAgo: "4 days ago",
                comment:
                    "This caption captures the essence of a fun and cozy pizza night. It’s concise and emphasizes a warm, happy vibe all around!",
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildReview({
    required String avatar,
    required String name,
    required int rating,
    required String timeAgo,
    required String comment,
    String? badge,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(backgroundImage: AssetImage(avatar), radius: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  if (badge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badge,
                        style: const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )
                ],
              ),
              Row(
                children: List.generate(5, (index) {
                  return Icon(Icons.star, size: 16, color: index < rating ? Colors.amber : Colors.grey[300]);
                }),
              ),
              const SizedBox(height: 4),
              Text(
                timeAgo,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                comment,
                style: const TextStyle(fontSize: 13),
              )
            ],
          ),
        )
      ],
    );
  }
}
