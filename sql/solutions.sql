-- Задача 1: Спортивные мотоциклы с мощностью > 150 л.с. и ценой < $20,000
SELECT Vehicle.maker, Motorcycle.model
FROM Vehicle
JOIN Motorcycle ON Vehicle.model = Motorcycle.model
WHERE Motorcycle.horsepower > 150
  AND Motorcycle.price < 20000
  AND Motorcycle.type = 'Sport'
ORDER BY Motorcycle.horsepower DESC;

-- Задача 2: Сводный анализ транспортных средств
(SELECT Vehicle.maker, Car.model, Car.horsepower, Car.engine_capacity, 'Car' AS vehicle_type
FROM Vehicle
JOIN Car ON Vehicle.model = Car.model
WHERE Car.horsepower > 150 
  AND Car.engine_capacity < 3 
  AND Car.price < 35000)
UNION ALL
(SELECT Vehicle.maker, Motorcycle.model, Motorcycle.horsepower, Motorcycle.engine_capacity, 'Motorcycle' AS vehicle_type
FROM Vehicle
JOIN Motorcycle ON Vehicle.model = Motorcycle.model
WHERE Motorcycle.horsepower > 150 
  AND Motorcycle.engine_capacity < 1.5 
  AND Motorcycle.price < 20000)
UNION ALL
(SELECT Vehicle.maker, Bicycle.model, NULL AS horsepower, NULL AS engine_capacity, 'Bicycle' AS vehicle_type
FROM Vehicle
JOIN Bicycle ON Vehicle.model = Bicycle.model
WHERE Bicycle.gear_count > 18 
  AND Bicycle.price < 4000)
ORDER BY horsepower DESC;
