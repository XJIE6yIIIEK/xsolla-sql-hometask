-- Создание таблицы games
CREATE TABLE games (
	name text,
	description text,
	PRIMARY KEY(name)
);

-- Создание таблицы пользователей
CREATE TABLE users (
	user_id text,
	user_name text NOT NULL,
	PRIMARY KEY(user_id)
);

-- Таблица текущих цен на игры
CREATE TABLE current_prices (
	game text,
	current_nominal_currency varchar(3) NOT NULL,
	current_nominal_amount numeric NOT NULL,
	PRIMARY KEY(game, current_nominal_currency),
	FOREIGN KEY(game) REFERENCES games(name) ON DELETE CASCADE
);

-- Таблица истории цен на игры
CREATE TABLE pricing_history (
	game text,
	d_date date NOT NULL,
	purchase_nominal_currency varchar(3) NOT NULL,
	purchase_nominal_amount numeric NOT NULL,
	PRIMARY KEY(game, d_date),
	FOREIGN KEY(game) REFERENCES games(name) ON DELETE CASCADE
);

-- Таблица покупок
CREATE TABLE purchases (
	user_id text,
	payment_system_user_account_token text,
	payment_num integer,
	PRIMARY KEY(user_id, payment_system_user_account_token, payment_num),
	FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Таблица платежей
CREATE TABLE payments (
	payment_num integer,
	user_id text,
	payment_system_user_account_token text,
	game text,
	payment_canceled boolean NOT NULL,
	payment_date date NOT NULL,
	purchase_item_quantity integer NOT NULL,
	payment_currency varchar(3) NOT NULL,
	payment_amount numeric NOT NULL,
	vat numeric NOT NULL,
	payment_system_type text NOT NULL,
	PRIMARY KEY (payment_num, game, user_id, payment_system_user_account_token),
	FOREIGN KEY (game) REFERENCES games(name) ON DELETE CASCADE,
	FOREIGN KEY (user_id, payment_system_user_account_token, payment_num) REFERENCES purchases(user_id, payment_system_user_account_token, payment_num) ON DELETE CASCADE
);