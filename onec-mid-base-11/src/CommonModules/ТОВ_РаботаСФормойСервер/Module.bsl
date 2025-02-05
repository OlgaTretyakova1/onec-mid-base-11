Процедура ПриСозданииНаСервере(Форма) Экспорт
	
	//{{Третьякова: добавление поля КонтактноеЛицо на форму документов
	Если Форма.ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента"
		Или Форма.ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда 
		ПолеКонтактноеЛицо = Форма.Элементы.Добавить("ТОВ_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
		ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
		ПолеКонтактноеЛицо.ПутьКДанным = "Объект.ТОВ_КонтактноеЛицо";
	КонецЕсли;
	
	Если Форма.ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда 
		ПолеКонтактноеЛицо = Форма.Элементы.Вставить("ТОВ_КонтактноеЛицо", Тип("ПолеФормы"),, Форма.Элементы.Основание);
		ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
		ПолеКонтактноеЛицо.ПутьКДанным = "Объект.ТОВ_КонтактноеЛицо";
	КонецЕсли;
	
	Если Форма.ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда 
		ПолеКонтактноеЛицо = Форма.Элементы.Вставить("ТОВ_КонтактноеЛицо", Тип("ПолеФормы"),, Форма.Элементы.СуммаДокумента);
		ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
		ПолеКонтактноеЛицо.ПутьКДанным = "Объект.ТОВ_КонтактноеЛицо";
	КонецЕсли;
	
	Если Форма.ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ПолеКонтактноеЛицо = Форма.Элементы.Добавить("ТОВ_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
		ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
		ПолеКонтактноеЛицо.ПутьКДанным = "Объект.ТОВ_КонтактноеЛицо";
		
		Группа = Форма.Элементы.Добавить("ТОВ_ГруппаСкидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
		Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
		Группа.Отображение = ОтображениеОбычнойГруппы.Нет;
		Группа.ОтображатьЗаголовок = ЛОЖЬ;
		Группа.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;
		
		ПолеСогласованннаяСкидка = Форма.Элементы.Добавить("ТОВ_СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ТОВ_ГруппаСкидка);
		ПолеСогласованннаяСкидка.Вид = ВидПоляФормы.ПолеВвода;
		ПолеСогласованннаяСкидка.ПутьКДанным = "Объект.ТОВ_СогласованнаяСкидка";
		Форма.Элементы.ТОВ_СогласованнаяСкидка.УстановитьДействие("ПриИзменении", "ТОВ_СогласованнаяСкидкаПриИзменении"); 
		
		Команда =  Форма.Команды.Добавить("ТОВ_ПересчитатьТаблицу");
		Команда.Заголовок = "Пересчитать таблицу";
		Команда.Действие = "Команда_ТОВ_ПересчитатьТаблицу";
		
		КнопкаФормы = Форма.Элементы.Добавить("Команда_ТОВ_ПересчитатьТаблицу", Тип("КнопкаФормы"), Форма.Элементы.ТОВ_ГруппаСкидка);
		КнопкаФормы.ИмяКоманды = "ТОВ_ПересчитатьТаблицу";
		КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
		КнопкаФормы.Отображение = ОтображениеКнопки.КартинкаИТекст;
		Команда.Картинка = БиблиотекаКартинок.Обновить;
	КонецЕсли;
	//}}
	
КонецПроцедуры