# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
				id: 1,
				email: '190fe701@st.nufs.ac.jp',
				admin_name: "マスター", admin_name_kana:"マスター",
				password: "koya1234",
				password_confirmation: "koya1234",
				)