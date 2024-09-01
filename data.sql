SELECT * FROM Users
WHERE DateOfBirth BETWEEN '2000-01-01' AND '2004-12-31';

SELECT * FROM Posts
WHERE PostedBy = 4;

SELECT GroupName FROM Groups;

SELECT * FROM GroupMembership
WHERE UserID = 2;

SELECT * FROM Friends
WHERE UserID1 = 2 OR UserID2 = 2;

SELECT * FROM FriendRequests
WHERE RequesterID = 1;

SELECT Posts.* 
FROM Posts 
JOIN GroupPosts ON Posts.PostID = GroupPosts.PostID
WHERE GroupPosts.GroupID = 2 AND Posts.IsVisible = TRUE;

SELECT * FROM GroupMembership
WHERE GroupID = 2 AND IsAccepted = FALSE;
