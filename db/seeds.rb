# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

locaMgr = User.create({name: 'locationMgr', email: 'location.manager@steritech.com', password: 'password'})
progMgr = User.create({name: 'programMgr', email: 'program.manager@steritech.com', password: 'password'})
progMgrRole = Role.create({role_name: 'Program Manager'})
locMgrRole = Role.create({role_name: 'Location Manager'})
adminRole = Role.create({role_name: 'Administrator'})
locaMgrUserRole = UserRole.create({user: locaMgr, role: locMgrRole})
progMgrUserRole = UserRole.create({user: progMgr, role: progMgrRole})
progMgrUserRole = UserRole.create({user: progMgr, role: adminRole})

