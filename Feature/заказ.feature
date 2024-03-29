﻿#language: ru



Функционал: расчета суммы документа Заказ

Как Владелец бизнеса я хочу
Расчет суммы при изменения значений был верный 
чтобы терять прибыль

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: расчета суммы документа Заказ
//создание 
* Открытие формы создание документа
    И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказ'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Торт '
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '355,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '33'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка табличной части	
	И таблица "Товары"  содержит строки:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'     |
		| 'Торт ' | '355,00' | '33'         | '11 715,00' |
    И я нажимаю на кнопку "Записать"
* Номер
	и я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа		
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
* Проверка создания документа
И таблица  "Список" содержит строки:
	| 'Номер' |
	| '$Номер$'   |
Сценарий: проверка наличия в справочнике номенклатуры Торт
И В командном интерфейсе я выбираю 'Продажи' 'Товары'
Тогда открылось окно 'Товары'
И в таблице "Список" я перехожу к строке:
	| 'Артикул' | 'Вид'   | 'Код'       | 'Наименование' | 'Поставщик'   |
	| 'Т78'     | 'Товар' | '000000032' | 'Торт '        | 'Мосхлеб ОАО' |
И в таблице "Список" я выбираю текущую строку
