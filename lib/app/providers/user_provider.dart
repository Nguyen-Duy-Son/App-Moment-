import 'package:flutter/cupertino.dart';
import '../models/friend.model.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  late List<User> users;
  late Friend friend;
  late List<User> friendsUsers, friendRequests, friendProposals;

  Future<void> getUser() async {
    // Simulate a network request
    users = userTest;
    notifyListeners();
  }
  Future<void> getFriendOfUser() async {
    // Simulate a network request
    friend = friendTest;
    notifyListeners();
  }
  Future<void> getMyFriendsUsers() async {
    // Simulate a network request
    friendsUsers = users.where((user) => friend.friendsList!.contains(user.id)).toList();
    notifyListeners();
  }
  Future<void> getFriendRequests() async {
    // Simulate a network request
    friendRequests = users.where((user) => friend.friendRequests!.contains(user.id)).toList();
    notifyListeners();
  }
  Future<void> getFriendProposals() async {
    // Simulate a network request
    friendProposals = users.where((user) => friend.friendSuggestions!.contains(user.id)).toList();
    notifyListeners();
  }
}
final List<User> userTest = [
  User(
    id: '2',
    fullName: 'Nguyễn Văn Nam',
    avatar:
    'https://cdn.thoitiet247.edu.vn/wp-content/uploads/2024/04/nhung-hinh-anh-girl-xinh-de-thuong.webp',
  ),
  User(
    id: '3',
    fullName: 'Trần Thị Ngọc',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-27.webp',
  ),
  User(
    id: '4',
    fullName: 'Phạm Văn Tú',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-7.webp',
  ),
  User(
    id: '5',
    fullName: 'Lê Thị Hồng',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-6.webp',
  ),
  User(
    id: '6',
    fullName: 'Nguyễn Văn E',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-30.webp',
  ),
  User(
    id: '7',
    fullName: 'Trần Thị F',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-34.webp',
  ),
  User(
    id: '8',
    fullName: 'Nguyễn Thị F',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-34.webp',
  ),
  User(
    id: '9',
    fullName: 'Trần Nguyễn',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-34.webp',
  ),
  User(
    id: '10',
    fullName: 'Nguyễn Thị H',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-34.webp',
  ),
  User(
    id: '11',
    fullName: 'Trần Thị H',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-34.webp',
  ),
  User(
    id: '12',
    fullName: 'Nguyễn Văn H',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-34.webp',
  ),
  User(
    id: '13',
    fullName: 'Trần Văn H',
    avatar:
    'https://cebcu.com/wp-content/uploads/2024/01/anh-gai-xinh-cute-de-thuong-het-ca-nuoc-cham-34.webp',
  ),
];
final Friend friendTest = Friend(
  userId: '1',
  friendsList: ['2', '3', '6', '7'],
  friendRequests: ['4', '5', '8', '9'],
  friendSuggestions: ['10', '11', '12', '13'],
);