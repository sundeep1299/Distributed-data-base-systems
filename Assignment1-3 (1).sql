
/*
Creating the table and loading the dataset
*/
DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (userid INT, temp1 VARCHAR(10),  movieid INT , temp3 VARCHAR(10),  rating REAL, temp5 VARCHAR(10), timestamp INT);
COPY ratings FROM 'test_data1.txt' DELIMITER ':';
ALTER TABLE ratings DROP COLUMN temp1, DROP COLUMN temp3, DROP COLUMN temp5, DROP COLUMN timestamp;

-- Do not change the above code except the path to the dataset.
-- make sure to change the path back to default provided path before you submit it.

-- Part A

/* Write the queries for Part A*/

SELECT * FROM RATINGS WHERE RATING > 3;
SELECT * FROM RATINGS WHERE RATING < 3;
SELECT * FROM RATINGS WHERE RATING = 3;
SELECT * FROM RATINGS WHERE RATING >= 3;
SELECT * FROM RATINGS WHERE RATING BETWEEN 3 AND 5;


-- Part B

/* Create the fragmentations for Part B1 */
/* F1 */
SELECT * INTO f1 FROM RATINGS WHERE RATING > 3;
/* F2 */
SELECT * INTO f2 FROM RATINGS WHERE RATING <= 3;
/* F3 */
SELECT * INTO f3 FROM RATINGS WHERE MOVIEID = 316;


/* Write reconstruction query/queries for Part B1 */

SELECT * FROM RATINGS WHERE RATING > 3 UNION SELECT * FROM RATINGS WHERE RATING <= 3 UNION SELECT * FROM RATINGS WHERE MOVIEID = 316;

DROP TABLE f1;
DROP TABLE f2;
DROP TABLE f3;

/* Write your explanation as a comment */

/*  satisfies reconstruction and completeness but not disjointness */
/*
->Based on the Query used for reconstruction, The UNION operator for Fragments F1 and F2 will reconstruct the table back to orginal table thought the UNION of the resultant with F3 will give the same table even the same coulumn exists again.
->What ever the data present in the Orginal table, the same data is present in some of the fragments without loosing the information.Hence it satisfies the Completeness propertie.
->If we conside the Fragment F2 and F3, their exist a same data in the both the fragments i.e. a column whose RATING id is 3.Hence it doesnt satisfies the Disjointness propertie.
Hence based on the above the points fragments satisfies reconstruction and completeness but not disjointness properties.
*/


/* Create the fragmentations for Part B2 */

/* F1 */
SELECT USERID INTO f1 FROM RATINGS WHERE USERID = 1;
/* F2 */
SELECT MOVIEID, RATING INTO f2 FROM RATINGS WHERE USERID = 1;
/* F3 */
SELECT * INTO f3 FROM RATINGS WHERE USERID > 1;

DROP TABLE f1;
DROP TABLE f2;
DROP TABLE f3; 

/* Write your explanation as a comment */

/* satisfies completeness and disjointness but not reconstruction*/
/*
-> Based on the Fragments used for B2, all the data present in the RATINGS table exist in either of the Fragments.Hence it satisfies the completeness propertie.
-> There is no duplication of data in either of the Fragments, the data present in the each Fragments are Unique and same present in the RATINGS table.Hence it satisfies the disjointness propertie.
-> Use the Fragments F1,F2,F3 we cant reconstruct it back to the orginal table as the no of columns in the each Fragment are different, cant merge to reconstruct the RATINGS table.Hence doesnt satifies the reconstruction propertie.
*/

/* Create the fragmentations for Part B3 */
/* F1 */
SELECT * INTO f1 FROM RATINGS WHERE RATING > 3;

/* F2 */
SELECT * INTO f2 FROM RATINGS WHERE RATING < 3;

/* F3 */
SELECT * INTO f3 FROM RATINGS WHERE RATING = 3;


/* Write reconstruction query/queries for Part B3 */

SELECT * FROM RATINGS WHERE RATING > 3 UNION SELECT * FROM RATINGS WHERE RATING < 3 UNION SELECT * FROM RATINGS WHERE RATING = 3;

DROP TABLE f1;
DROP TABLE f2;
DROP TABLE f3;


/* Write your explanation as a comment */
/*
-> Based on the Fragments used for B3, all the data present in the RATINGS table exist in either of the Fragments.Hence it satisfies the completeness properties.
-> There is no duplication of data in either of the Fragments, the data present in the each Fragments are Unique and same present in the RATINGS table.Hence it satisfies the disjointness properties.
-> Using the Fragments F1,F2,F3, We can reconstruct RATINGS table using the UNION operator between the Fragments.Hence it satisfies the Reconstruction properties.

Using the above points,The fragmentation satisfies all completeness, reconstruction and disjointness properties
*/
-- Part C
/* Write the queries for Part C */

CREATE TABLE f1 AS (SELECT * FROM RATINGS WHERE RATING > 3);
CREATE TABLE f2 AS (SELECT * FROM RATINGS WHERE RATING < 3);
CREATE TABLE f3 AS (SELECT * FROM RATINGS WHERE RATING = 3);

SELECT * FROM f1 WHERE RATING > 3;
SELECT * FROM f1 WHERE RATING < 3;
SELECT * FROM f1 WHERE RATING = 3;
SELECT * FROM f1 WHERE RATING >= 3;
SELECT * FROM f1 WHERE RATING BETWEEN 3 AND 5;

SELECT * FROM f2 WHERE RATING > 3;
SELECT * FROM f2 WHERE RATING < 3;
SELECT * FROM f2 WHERE RATING = 3;
SELECT * FROM f2 WHERE RATING >= 3;
SELECT * FROM f2 WHERE RATING BETWEEN 3 AND 5;

SELECT * FROM f3 WHERE RATING > 3;
SELECT * FROM f3 WHERE RATING < 3;
SELECT * FROM f3 WHERE RATING = 3;
SELECT * FROM f3 WHERE RATING >= 3;
SELECT * FROM f3 WHERE RATING BETWEEN 3 AND 5;



