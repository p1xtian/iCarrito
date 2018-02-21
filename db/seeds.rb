# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#CMERCADO
Product.create(sku:'APPLE0001', name: 'iPhone 4 16GB', price: 1000.00, stock:10, active: 1)
Product.create(sku:'APPLE0002', name: 'iPhone 5 16GB', price: 1500.00, stock:0, active: 0)
Product.create(sku:'APPLE0003', name: 'iPhone 6 16GB', price: 2399.00, stock:0, active: 0)
Product.create(sku:'APPLE0004', name: 'iPhone 7 32GB', price: 3000.00, stock:10, active: 1)
Product.create(sku:'SAM0001', name: 'Galaxy S4 16GB', price: 1000.00, stock:10, active: 1)
Product.create(sku:'SAM0002', name: 'Galaxy S5 16GB', price: 1500.00, stock:10, active: 0)
Product.create(sku:'SAM0003', name: 'Galaxy S6 16GB', price: 2399.00, stock:10, active: 0)
Product.create(sku:'SAM0004', name: 'Galaxy S7 32GB', price: 3000.00, stock:0, active: 0)
Client.create(uid:'20537072891',name:'GRUPO IPSEC SAC',address:'SAN MIGUEL',telephone:'2889995',active: 0)
Client.create(uid:'20298674611',name:'FRANQUICIAS ALIMENTARIAS SA',address:'MIRAFLORES',telephone:'6106900',active: 1)
Client.create(uid:'10431936858',name:'CHRISTIAN ENRIQUE MERCADO JUSTO',address:'SAN MIGUEL',telephone:'992126211',active: 1)