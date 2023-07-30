USE fwwebb;

INSERT INTO orders (order_id, order_date, customer_id)
VALUES 

    (1238, DATE_ADD('2016-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 534),
    (1239, DATE_ADD('2016-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 533),
    (1240, DATE_ADD('2016-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 655),
    (1241, DATE_ADD('2016-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 567),
    (1242, DATE_ADD('2016-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 533),
    (1243, DATE_ADD('2016-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 534),
	(1244, DATE_ADD('2016-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 534),
	(1245, DATE_ADD('2016-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 534);

INSERT INTO order_detail VALUES 
    (1237,901,1,11.23,14.23),
	(1238,903,1,13.23,14.11),
	(1239,902,1,14.23,35.26),
    (1240,904,4,13.46, 19.90),
    (1240,903,2,13.23, 14.11),
	(1242,904,4,13.46, 19.90),
	(1243,904,4,13.46, 19.90),
	(1244,903,4,13.23, 14.11),
	(1245,904,4,13.46, 19.90);

INSERT INTO item_master VALUES 
    (900, 'a', 'Mixing Valve'),
    (901, 'c', 'Rohl Faucet'),
    (902, 'f', '1 inch copper tubing'),
    (903, 'f', '1/2 copper tubbing'),
    (904, 'c', '3/4 copper 45 degree elbow');
    
INSERT INTO customer VALUES
	(599,'Bob\'s Plumbing', 'plumbing');