class Item < ActiveRecord::Base
	# Дозволяємо записувати в консолі "реілс" атрибути у вигляді хешу.
	# Hаприклад так => Items.create(name: "name 1", price: 100)
	attr_accessible :price, :name, :real, :weight, :description

	# Робимо "валідацію" - правило для правильної форми заповненняю.
	# На разі це буде форма для валідаціі ціни, яка говорить що ціна має бути > 0,
	# або ж пустою ( для перегляду товару наприклад).
	validates :price,  numericality: { greater_than: 0, allow_nil: nil } 

	# Цим валідейтом оголошуємо що поля "name" та "description" не мають бути пустими.
	validates :name, :description, presence: true

  belongs_to :category

	 #Запишемо колбеки: це фуекції які викликаються після закінчення певної дії над моделью.
	#after_initialize   { } # Після створення файла.
	#after_save         { } # Після збереження та апдейту файла.
	#after_destroy	   { category.inc(:items_count, -1) } # Після знищення файла.
	#after_update	   { } # Після апдейту файла.
	#after_create	   { category.inc(:items_count, 1) } # Після створення файла.

	
end
