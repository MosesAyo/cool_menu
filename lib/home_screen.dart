import 'package:flutter/material.dart';
import './category_item.dart';
import 'data.dart';

class HomeScreen extends StatefulWidget {
  final AnimationController? controller;
  final Duration? duration;

  const HomeScreen({Key? key, this.controller, this.duration})
      : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool menuOpen = false;
  Animation<double>? _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    if (_scaleAnimation == null) {
      _scaleAnimation =
          Tween<double>(begin: 1, end: 0.6).animate(widget.controller!);
    }
    var size = MediaQuery.of(context).size;

    return AnimatedPositioned(
      duration: widget.duration!,
      top: 0,
      bottom: 0,
      left: menuOpen ? 0.6 * size.width : 0,
      right: menuOpen ? -0.4 * size.width : 0,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  !menuOpen
                      ? IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              widget.controller!.forward();
                              menuOpen = true;
                            });
                          },
                          color: Colors.blueAccent,
                        )
                      : IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              widget.controller!.reverse();
                              menuOpen = false;
                            });
                          },
                          color: Colors.blueAccent,
                        ),
                  const IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: null,
                    color: Colors.blueAccent,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1659334882289-7f4ef9234976?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Kelly Doe',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'Lagos, Nigeria',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1659334883349-5fba3e58ba4d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'))),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
