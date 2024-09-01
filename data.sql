-- 1.	Select all users who are born between January 1, 2000 and December 31, 2004
SELECT * FROM Users
WHERE DateOfBirth BETWEEN '2000-01-01' AND '2004-12-31';

--2.	Select all the posts written by the user with a user_id of 4. 
SELECT * FROM Posts
WHERE PostedBy = 4;

--3.	Select all the group names existing in the database. 
SELECT GroupName FROM Groups;

--4.	Select all the group membership requests made by the user with a user_id of 2.
SELECT * FROM GroupMembership
WHERE UserID = 2;

--5.	Select all the friends of the user with a user_id of 2.
SELECT * FROM Friends
WHERE UserID1 = 2 OR UserID2 = 2;

--6.  Select all the friend requests that a user with a user_id of 1 has sent. The Friend request can either be accepted or not yet accepted.
SELECT * FROM FriendRequests
WHERE RequesterID = 1;

--7.	Select all the posts visible only for the group with a group_id of 2. 
SELECT Posts.* 
FROM Posts 
JOIN GroupPosts ON Posts.PostID = GroupPosts.PostID
WHERE GroupPosts.GroupID = 2 AND Posts.IsVisible = TRUE;

--8.	Select all the group membership requests from the group with a group_id of 2 that are not yet accepted. 
SELECT * FROM GroupMembership
WHERE GroupID = 2 AND IsAccepted = FALSE;
