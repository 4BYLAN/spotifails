import 'dart:async';
import 'package:flutter/material.dart';

class LyricLine {
  final String text;
  final Duration timestamp;

  LyricLine(this.text, this.timestamp);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  int _currentLyricIndex = 0;
  Duration _currentPlaybackPosition = Duration.zero;
  bool _isPlaying = true;

  final List<LyricLine> _lyrics = [
    LyricLine("Your faint voice brushes past me", const Duration(seconds: 0)),
    LyricLine(
      "Please call my name just one more time",
      const Duration(seconds: 3),
    ),
    LyricLine(
      "Though I'm standing still beneath the frozen sunset",
      const Duration(seconds: 6),
    ),
    LyricLine(
      "I'll take one step at a time toward you",
      const Duration(seconds: 9),
    ),
    LyricLine("Still with you", const Duration(seconds: 12)),

    LyricLine("A dark room with no light", const Duration(seconds: 15)),
    LyricLine("I shouldn't get used to it", const Duration(seconds: 18)),
    LyricLine("But I'm used to it again", const Duration(seconds: 21)),
    LyricLine(
      "The low-pitched sound of the air conditioner",
      const Duration(seconds: 24),
    ),
    LyricLine(
      "If I don't have this, I might just fall apart",
      const Duration(seconds: 27),
    ),

    LyricLine(
      "We laugh together, we cry together",
      const Duration(seconds: 30),
    ),
    LyricLine(
      "These simple feelings were everything I had",
      const Duration(seconds: 33),
    ),
    LyricLine("When will it be?", const Duration(seconds: 36)),
    LyricLine("If I see you again", const Duration(seconds: 39)),
    LyricLine("I will look into your eyes", const Duration(seconds: 42)),
    LyricLine('And say, "I missed you"', const Duration(seconds: 45)),

    LyricLine("In a rapturous memory", const Duration(seconds: 48)),
    LyricLine(
      "The rain pours even when I dance alone",
      const Duration(seconds: 51),
    ),
    LyricLine("By the time this mist clears", const Duration(seconds: 54)),
    LyricLine("I'll run with my feet wet", const Duration(seconds: 57)),
    LyricLine("So hug me then", const Duration(seconds: 60)),

    LyricLine("The moon looks lonely", const Duration(seconds: 63)),
    LyricLine(
      "Like it's crying in the bright night sky",
      const Duration(seconds: 66),
    ),
    LyricLine(
      "Even though I always know the morning will come",
      const Duration(seconds: 69),
    ),
    LyricLine(
      "I want to stay in your sky like a star",
      const Duration(seconds: 72),
    ),

    LyricLine("Every day, every moment", const Duration(seconds: 75)),
    LyricLine("If I knew this was gonna happen", const Duration(seconds: 78)),
    LyricLine(
      "I would've cherished those moments more",
      const Duration(seconds: 81),
    ),
    LyricLine("When will it be?", const Duration(seconds: 84)),
    LyricLine("If I see you again", const Duration(seconds: 87)),
    LyricLine("I will look into your eyes", const Duration(seconds: 90)),
    LyricLine('And say, "I missed you"', const Duration(seconds: 93)),

    LyricLine("In a rapturous memory", const Duration(seconds: 96)),
    LyricLine(
      "The rain pours even when I dance alone",
      const Duration(seconds: 99),
    ),
    LyricLine("By the time this mist clears", const Duration(seconds: 102)),
    LyricLine("I'll run with my feet wet", const Duration(seconds: 105)),
    LyricLine("So hug me then", const Duration(seconds: 108)),

    LyricLine(
      "Behind the faint smile that looked at me",
      const Duration(seconds: 111),
    ),
    LyricLine(
      "I will draw a beautiful purple shade",
      const Duration(seconds: 114),
    ),
    LyricLine(
      "Though our footsteps may be out of step",
      const Duration(seconds: 117),
    ),
    LyricLine(
      "I want to walk this path with you",
      const Duration(seconds: 120),
    ),
    LyricLine("Still with you", const Duration(seconds: 123)),
  ];

  @override
  void initState() {
    super.initState();
    _startLyricTimer();
  }

  void _startLyricTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _currentPlaybackPosition =
            _currentPlaybackPosition + const Duration(milliseconds: 500);

        int newIndex = _currentLyricIndex;
        for (int i = 0; i < _lyrics.length; i++) {
          if (_currentPlaybackPosition >= _lyrics[i].timestamp) {
            newIndex = i;
          } else {
            break;
          }
        }

        if (newIndex != _currentLyricIndex) {
          _currentLyricIndex = newIndex;
          _scrollToCurrentLyric();
        }

        if (_currentLyricIndex >= _lyrics.length - 1 &&
            _currentPlaybackPosition >
                _lyrics.last.timestamp + const Duration(seconds: 3)) {
          _timer?.cancel();
        }
      });
    });
  }

  void _scrollToCurrentLyric() {
    double offset = _currentLyricIndex * 40.0;

    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 199, 174),
        elevation: 0,
        title: Column(
          children: const [
            Text(
              'Still With You',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              'Jung Kook',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 227, 213, 196),
              Color.fromARGB(255, 175, 143, 118),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.only(
                  top: kToolbarHeight + 50,
                  left: 20.0,
                  right: 20.0,
                  bottom: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(_lyrics.length, (index) {
                    final bool isActive = index == _currentLyricIndex;
                    final TextStyle baseStyle = TextStyle(
                      color: isActive ? Colors.white : Colors.white54,
                      fontSize: isActive ? 30 : 20,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                      height: 1.5,
                    );
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: baseStyle,
                        curve: Curves.easeOut,
                        child: Text(
                          _lyrics[index].text.isEmpty
                              ? '...'
                              : _lyrics[index].text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 175, 143, 118),
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Slider(
                    value: _currentPlaybackPosition.inSeconds.toDouble(),
                    min: 0,
                    max: _lyrics.last.timestamp.inSeconds.toDouble() + 5,
                    activeColor: const Color.fromARGB(255, 255, 255, 255),
                    inactiveColor: Colors.white30,
                    onChanged: (value) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.shuffle,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPlaybackPosition = Duration.zero;
                            _currentLyricIndex = 0;
                            _scrollToCurrentLyric();
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_fill,
                          color: Colors.white,
                          size: 60,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_isPlaying) {
                              _timer?.cancel();
                            } else {
                              _startLyricTimer();
                            }
                            _isPlaying = !_isPlaying;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPlaybackPosition = Duration.zero;
                            _currentLyricIndex = 0;
                            _scrollToCurrentLyric();
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.repeat,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
