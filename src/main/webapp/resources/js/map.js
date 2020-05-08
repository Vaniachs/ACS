ymaps.ready(init);

function init() {
    let address;
    let pointCounter = 0;
    var sourcePlacemark;
    var destPlacemark;
    var myMap = new ymaps.Map("map", {
        center: [53.90, 27.56],
        zoom: 12
    }, {
        searchControlProvider: 'yandex#search'
    });

    // Создание метки.
    function createPlacemark(coords) {
        return new ymaps.Placemark(coords, {
            iconCaption: 'поиск...'
        }, {
            preset: 'islands#violetDotIconWithCaption',
            draggable: true
        });
    }

    // Определяем адрес по координатам (обратное геокодирование).
    function getAddress(coords, myPlacemark) {
        console.log(myPlacemark)
        console.log(ymaps)
        myPlacemark.properties.set('iconCaption', 'поиск...');
        var myGeocoder = ymaps.geocode(
            // Строка с адресом, который нужно геокодировать
            coords, {
                /* Опции поиска:
                   - область поиска */
                boundedBy: myMap.getBounds(),
                // - искать только в этой области
                strictBounds: true,
                // - требуемое количество результатов
                results: 1
            });
        /* После того, как поиск вернул результат, вызывается callback-функция*/
        myGeocoder.then(
            function(res) {
                /* Размещение полученной коллекции геообъектов на карте */
                console.log(res);
                var firstGeoObject = res.geoObjects.get(0);
                myPlacemark.properties
                    .set({
                        // Формируем строку с данными об объекте.
                        iconCaption: [
                            // Название населенного пункта или вышестоящее административно-территориальное образование.
                            firstGeoObject.getLocalities().length ? firstGeoObject.getLocalities() : firstGeoObject.getAdministrativeAreas(),
                            // Получаем путь до топонима, если метод вернул null, запрашиваем наименование здания.
                            firstGeoObject.getThoroughfare() || firstGeoObject.getPremise()
                        ].filter(Boolean).join(', '),
                        // В качестве контента балуна задаем строку с адресом объекта.
                        balloonContent: firstGeoObject.getAddressLine()
                    });


                address = firstGeoObject.getAddressLine();
                console.log(address);

            }
        );
    };

    function setAddressField(fieldName) {
        const addressField = document.getElementById(fieldName);
        if (addressField) addressField.value = address;
    }

    function setHiddenCoordsField(coords, fieldName) {
        const cordsField = document.getElementById(fieldName);
        if (cordsField) cordsField.value = coords;
    }


    function identifyCoords(e) {

        if (pointCounter == 0 || pointCounter == 1) {
            var coords = e.get('coords');
            console.log(coords)

            // Если метка уже создана – просто передвигаем ее.
            if (sourcePlacemark) {
                sourcePlacemark.geometry.setCoordinates(coords);
            }
            // Если нет – создаем.
            else {
                sourcePlacemark = createPlacemark(coords);
                myMap.geoObjects.add(sourcePlacemark);
                // Слушаем событие окончания перетаскивания на метке.
                sourcePlacemark.events.add('dragend', function() {
                    getAddress(sourcePlacemark.geometry.getCoordinates(), sourcePlacemark);
                      if (address)
                    setAddressField("source_address");
                     if (coords)
                setHiddenCoordsField(coords, "source_coords_for_lazy_man");
                });
            }
            getAddress(coords, sourcePlacemark);


            if (address)
                setAddressField("source_address");
            if (coords)
                setHiddenCoordsField(coords, "source_coords_for_lazy_man");

            pointCounter++;
        } else {
            var coords = e.get('coords');
            console.log(coords)


            if (destPlacemark) {
                destPlacemark.geometry.setCoordinates(coords);
            }
            // Если нет – создаем.
            else {
                destPlacemark = createPlacemark(coords);
                myMap.geoObjects.add(destPlacemark);
                // Слушаем событие окончания перетаскивания на метке.
                destPlacemark.events.add('dragend', function() {
                    getAddress(destPlacemark.geometry.getCoordinates(), destPlacemark);

                 if (address)
                setAddressField("address");
                 if (coords)
                setHiddenCoordsField(coords, "destinations_coords_for_lazy_man");
                });
            }
            getAddress(coords, destPlacemark);

            if (address)
                setAddressField("address");
            if (coords)
                setHiddenCoordsField(coords, "destinations_coords_for_lazy_man");

        }
    }

    // Слушаем клик на карте.
    myMap.events.add('click', (e) => {
        identifyCoords(e)
    });




}