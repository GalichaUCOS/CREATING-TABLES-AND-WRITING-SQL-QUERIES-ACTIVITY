
-- Create Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Password VARCHAR(255),
    DateRegistered TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Posts Table
CREATE TABLE Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    PostDescription VARCHAR(255),
    PostedBy INT,
    IsVisible BOOLEAN,
    DatePosted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostedBy) REFERENCES Users(UserID)
);

-- Create Comments Table
CREATE TABLE Comments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,
    CommentDescription VARCHAR(255),
    AddedBy INT,
    PostID INT,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AddedBy) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

-- Create Groups Table
CREATE TABLE Groups (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(100),
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create GroupMembership Table
CREATE TABLE GroupMembership (
    MembershipID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    UserID INT,
    IsAccepted BOOLEAN DEFAULT FALSE,
    RequestDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Friends Table
CREATE TABLE Friends (
    FriendshipID INT AUTO_INCREMENT PRIMARY KEY,
    UserID1 INT,
    UserID2 INT,
    DateFriended TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID1) REFERENCES Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES Users(UserID)
);

-- Create FriendRequests Table
CREATE TABLE FriendRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RequesterID INT,
    RequesteeID INT,
    IsAccepted BOOLEAN DEFAULT FALSE,
    RequestDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RequesterID) REFERENCES Users(UserID),
    FOREIGN KEY (RequesteeID) REFERENCES Users(UserID)
);

-- Create GroupPosts Table
CREATE TABLE GroupPosts (
    GroupPostID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    PostID INT,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

-- Insert updated records into Users Table
INSERT INTO Users (UserID, Username, FirstName, LastName, DateOfBirth, Password) VALUES
(1, 'TotoyBibo', 'Barikuberi', 'Gituiru', '2004-06-15', 'barikuberi_pass'),
(2, 'ZilongUser900', 'Dhidijafar', 'Njirani', '2000-08-24', 'dhidijafar_pass'),
(3, 'wgkngbas2s', 'Mwanatma', 'Kamweru', '2000-11-02', 'mwanatma_pass'),
(4, 'idolsidarrelespanto', 'Mwanishafa', 'Murimemo', '2001-12-05', 'mwanishafa_pass'),
(5, 'Andrie Pabello', 'Andrie', 'Pabello', '2002-03-18', 'andrie_pass');

-- Insert updated records into Posts Table
INSERT INTO Posts (PostID, PostDescription, PostedBy, IsVisible) VALUES
(1, 'idol', 1, TRUE),
(2, 'wag kasi', 2, TRUE),
(3, 'never gonna give you up', 3, TRUE),
(4, 'super idol', 4, FALSE),
(5, 'Super Idol de xiao rong dou mei ni de tian', 5, TRUE),
(6, 'how to make 2lb lasagna', 1, FALSE),
(7, 'okie', 2, TRUE),
(8, 'next time', 3, TRUE),
(9, 'like a stone - audioslave', 4, TRUE),
(10, 'gobyerno', 5, FALSE);

-- Insert updated records into Comments Table
INSERT INTO Comments (CommentID, CommentDescription, AddedBy, PostID) VALUES
(1, 'The Fitness Grand Pacer Test', 2, 1),
(2, 'Aint nothin but a mistake.', 3, 2),
(3, ' I never wanna hear you say', 4, 3),
(4, 'I want it that way.', 1, 4),
(5, 'Tell me why.', 5, 5),
(6, 'I dont want a lot for Christmas', 3, 6),
(7, 'There is just one thing I need', 4, 7),
(8, 'I dont care about the presents underneath the Christmas tree', 1, 8),
(9, 'I just want you for my own.', 2, 9),
(10, 'More than you could ever know', 4, 10);

-- Insert updated records into Groups Table
INSERT INTO Groups (GroupID, GroupName) VALUES
(1, 'Liligtas kita sa mga Caviteno'),
(2, 'Josh Mojica KangKong Chips');

-- Insert updated records into GroupMembership Table
INSERT INTO GroupMembership (GroupID, UserID, IsAccepted) VALUES
(1, 1, TRUE),
(1, 3, FALSE),
(2, 2, TRUE),
(2, 4, FALSE),
(2, 5, TRUE);

-- Insert updated records into Friends Table
INSERT INTO Friends (UserID1, UserID2) VALUES
(1, 2),
(3, 5),
(4, 2);

-- Insert updated records into FriendRequests Table
INSERT INTO FriendRequests (RequesterID, RequesteeID, IsAccepted) VALUES
(1, 3, FALSE),
(2, 4, TRUE),
(5, 1, TRUE);

-- Insert updated records into GroupPosts Table
INSERT INTO GroupPosts (GroupID, PostID) VALUES
(1, 2),
(2, 4);
