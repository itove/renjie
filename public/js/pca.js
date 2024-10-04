fetch('https://pca.itove.com/pc.json')
.then((resp) => resp.json())
.then((json) => {
  const option = document.createElement('option');
  console.log(json);

  const changeCities = () => {
    console.log('prov changed');;
    const cities = document.querySelector('#cities');
    cities.innerHTML = '';
    const prov = document.querySelector('#provinces');
    console.log(prov.value);
    for (const i of json[prov.value]) {
      console.log(i);
      const o = document.importNode(option);
      o.innerHTML = i;
      o.value = i;
      cities.appendChild(o);
    }
  }

  const prov = document.querySelector('#provinces');
  prov.addEventListener('change', changeCities);
  for (const i in json) {
    const o = document.importNode(option);
    o.innerHTML = i;
    o.value = i;
    prov.appendChild(o);
  }

});

