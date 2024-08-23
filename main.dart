import 'dart:math';

class Song {
  String title;
  String artist;
  int duration;
  Song(this.title, this.artist, this.duration);

  void displaySong() {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    print(
        '$title by $artist (${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')})');
  }
}

class Playlist {
  String name;
  List<Song> songs = [];

  Playlist(this.name);

  void addSong(Song song) {
    songs.add(song);
  }

  void displayPlaylist() {
    print('Playlist: $name');
    for (var song in songs) {
      song.displaySong();
    }
  }

  Song getRandomSong() {
    Random rand = Random();
    return songs[rand.nextInt(songs.length)];
  }

  int getTotalDuration() {
    int totalDuration = 0;
    for (var song in songs) {
      totalDuration += song.duration;
    }
    return totalDuration;
  }
}

class MusicFestival {
  String festivalName;
  List<Playlist> playlists = [];

  MusicFestival(this.festivalName);

  void addPlaylist(Playlist playlist) {
    playlists.add(playlist);
  }

  void displayFestival() {
    int totalDuration = 0;
    print('Total Festival Duration: ${getTotalFestivalDuration()} seconds\n');

    print('Random Songs:');
    for (var playlist in playlists) {
      Song randomSong = playlist.getRandomSong();
      print(
          '${playlist.name}: ${randomSong.title} by ${randomSong.artist} (${randomSong.duration ~/ 60}:${randomSong.duration % 60})');
    }
    print('');

    // Sort the main stage playlist by artist name and display
    Playlist? mainStage = playlists.firstWhere(
        (playlist) => playlist.name == 'Main Stage',
        orElse: () => Playlist(''));
    if (mainStage != null) {
      mainStage.songs.sort((a, b) => a.artist.compareTo(b.artist));
      print('Main Stage playlist sorted by artist:');
      mainStage.displayPlaylist();
    }
  }

  int getTotalFestivalDuration() {
    int totalDuration = 0;
    for (var playlist in playlists) {
      totalDuration += playlist.getTotalDuration();
    }
    return totalDuration;
  }
}

void main() {
  Song song1 = Song('King For a Day', 'Pierce The Veil', 300);
  Song song2 = Song('Golden Hours', 'JVKE', 210);
  Song song3 = Song('Na Na Na Na', 'My Chemical Romance', 200);
  Song song4 = Song('Bury The Light', 'Casey Edwards', 378);
  Song song5 = Song('Watch The World Burn', 'Falling in Reverse', 240);
  Song song6 = Song('Sabihin ', 'Zelle', 274);
  Song song7 = Song('Linger', 'The Cranberries', 274);

  Playlist mainStage = Playlist('Main Stage');
  Playlist indieStage = Playlist('Indie Stage');
  Playlist electronicStage = Playlist('Electronic Stage');

  mainStage.addSong(song1);
  mainStage.addSong(song2);
  mainStage.addSong(song3);
  mainStage.addSong(song4);
  mainStage.addSong(song5);

  indieStage.addSong(song6);
  indieStage.addSong(song4); 
  indieStage.addSong(song3);

  electronicStage.addSong(song7);
  electronicStage.addSong(song5); 
  electronicStage.addSong(song1); 

  MusicFestival festival = MusicFestival('Sample Music Festival');
  festival.addPlaylist(mainStage);
  festival.addPlaylist(indieStage);
  festival.addPlaylist(electronicStage);

  festival.displayFestival();
}
