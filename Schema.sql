/*
USER TABLE 
Contains users. Columns are userID (Unique Primary Key), userName, userPhone (email if using email), time of creation
*/
CREATE TABLE users (
    userID INT Primary Key not NULL,
    userPhone VARCHAR(10) not NULL,
    userName VARCHAR(50),
    userEmail VARCHAR(100),
    created_at timestamp
);

/*
MESSAGE TABLE
Contains messages. Columns are messageID, 
senderID(takes only permitted values from group table if person is present in group), timestamp, message status(if edited/deleted)
type of message, content of the message
*/
CREATE TABLE messages (
    msgID INT Primary Key not NULL,
    senderID INT,
    FOREIGN KEY (senderID) REFERENCES users(userID),
    sent_at timestamp,
    msgStatus ENUM('edited', 'deleted', NULL),
    msgType ENUM('text', 'image', 'video', 'audio'),
    content text
);

/*
STATUS TABLE
Contains the status of whether a user has seen the message or not
*/
CREATE TABLE rStatus (
    msgID INT
    -- dynamically number of columns as there are number of userIDs (primary key) in the users table and each can take a value from an ENUM('read', 'delivered', 'not delivered')
);