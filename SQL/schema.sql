DROP TABLE IF EXISTS yards_marked_cut CASCADE;

DROP TABLE IF EXISTS cutting_schedule CASCADE;

DROP TABLE IF EXISTS payments CASCADE;

DROP TABLE IF EXISTS accounts CASCADE;

DROP TABLE IF EXISTS clients CASCADE;

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(75) NOT NULL,
    phone_number VARCHAR(50) NOT NULL, -- Changed from BIGINT to VARCHAR
    email_address VARCHAR(75) UNIQUE NOT NULL,
    organization_id VARCHAR(75) NOT NULL,
    price_per_cut FLOAT NOT NULL DEFAULT 51.5,
    address VARCHAR(200) NOT NULL
);

CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    current_balance FLOAT NOT NULL DEFAULT 0.0,
    FOREIGN KEY (client_id) REFERENCES clients (id)
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    account_id INT NOT NULL,
    amount FLOAT NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts (id)
);

CREATE TABLE cutting_schedule (
    id SERIAL PRIMARY KEY,
    cutting_week INT NOT NULL,
    cutting_day VARCHAR(10) NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients (id),
    UNIQUE (client_id, cutting_week)
);

CREATE TABLE yards_marked_cut (
    id SERIAL PRIMARY KEY,
    -- cutting_week INT NOT NULL,
    -- cutting_day VARCHAR(10) NOT NULL,
    cutting_date DATE NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients (id),
    UNIQUE (client_id, cutting_date)
);
-- SELECT * FROM yards_marked_cut;
-- SELECT * FROM cutting_schedule;
-- SELECT * FROM clients;
-- WHERE
--     organization_id = 'user_30G0wquvxAjdXFitpjBDklG0qzF';
-- -- SELECT * from price_per_cut ;

INSERT INTO
    clients (
        full_name,
        email_address,
        organization_id,
        address,
        phone_number,
        price_per_cut
    )
VALUES (
        'Emily Lee',
        'emily.lee@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '1534 26th Ave SW, Calgary, AB T2S 0Z5',
        '+1-403-123-4567',
        1.00
    ),
    (
        'Sarah Taylor',
        'sarah.taylor@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '4567 Crowchild Trail NW, Calgary, AB T3B 0T4',
        '+1-403-765-4321',
        1.00
    ),
    (
        'Michael Johnson',
        'michael.johnson@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '7890 Macleod Trail SE, Calgary, AB T2G 0B1',
        '+1-403-901-2345',
        1.00
    ),
    (
        'Jessica Brown',
        'jessica.brown@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '9012 Banff Trail NW, Calgary, AB T3K 0B3',
        '+1-403-111-2222',
        1.00
    ),
    (
        'William Wilson',
        'william.wilson@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '3456 14th St NW, Calgary, AB T2N 1M5',
        '+1-403-333-4444',
        1.00
    ),
    (
        'Olivia Davis',
        'olivia.davis@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '2345 17th Ave SW, Calgary, AB T2T 0E4',
        '+1-403-555-6666',
        1.00
    ),
    (
        'James Martin',
        'james.martin@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '6789 Deerfoot Trail SE, Calgary, AB T2J 6V4',
        '+1-403-777-8888',
        1.00
    ),
    (
        'Ava Thompson',
        'ava.thompson@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '1234 4th St NE, Calgary, AB T2E 3P5',
        '+1-403-999-0000',
        1.00
    ),
    (
        'Benjamin White',
        'benjamin.white@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '5678 11th Ave SW, Calgary, AB T3C 0M5',
        '+1-403-222-3333',
        1.00
    ),
    (
        'Isabella Garcia',
        'isabella.garcia@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '8901 24th St SW, Calgary, AB T3E 1P5',
        '+1-403-444-5555',
        1.00
    ),
    (
        'Alexander Miller',
        'alexander.miller@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '3456 8th Ave NE, Calgary, AB T2A 0P4',
        '+1-403-666-7777',
        1.00
    ),
    (
        'Mia Harris',
        'mia.harris@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '9012 16th Ave NW, Calgary, AB T2M 0L4',
        '+1-403-888-9999',
        1.00
    ),
    (
        'Ethan Walker',
        'ethan.walker@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '4567 5th St SE, Calgary, AB T2G 4P4',
        '+1-403-111-1111',
        1.00
    ),
    (
        'Charlotte Lewis',
        'charlotte.lewis@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '2345 19th Ave SW, Calgary, AB T2T 1Z4',
        '+1-403-222-2222',
        1.00
    ),
    (
        'Liam Robinson',
        'liam.robinson@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '6789 10th St NW, Calgary, AB T2N 1S4',
        '+1-403-333-3333',
        1.00
    ),
    (
        'Amelia Scott',
        'amelia.scott@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '1234 7th Ave SW, Calgary, AB T2P 2T4',
        '+1-403-444-4444',
        1.00
    ),
    (
        'Noah Young',
        'noah.young@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '5678 15th Ave SW, Calgary, AB T3C 1E5',
        '+1-403-555-5555',
        1.00
    ),
    (
        'Harper Allen',
        'harper.allen@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '8901 20th StW, Calgary, AB T3K 2P5',
        '+1-403-666-6666',
        1.00
    ),
    (
        'Elijah King',
        'elijah.king@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '3456 9th Ave SE, Calgary, AB T2G 2T4',
        '+1-403-777-7777',
        1.00
    ),
    (
        'Evelyn Wright',
        'evelyn.wright@example.com',
        'user_30G0wquvxAjdXFitpjBDklG0qzF',
        '9012 6th St SW, Calgary, AB T2P 1K4',
        '+1-403-888-8888',
        1.00
    );

INSERT INTO
    accounts (client_id, current_balance)
SELECT id, 1.0
FROM clients;