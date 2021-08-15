import React, { useState, useEffect } from 'react'
import axios from 'axios'
import './App.css'
import Coin from './Coin'

function App () {
  const [coins, setCoins] = useState([])
  const [search, setSearch] = useState('')

  useEffect(() => {
    axios.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false')
      .then(res => {
        setCoins(res.data)
      })
      .catch(error => console.log('Api error', error))
  }, [])

  const handleChange = e => {
    setSearch(e.target.value)
  }

  const filterCoins = coins.filter(coin =>
    coin.name.toLowerCase().includes(search.toLocaleLowerCase())
  )

  return (

    <div className='coin-app'>
      <div className='coin-search'>
        <h1 className='coin-text'> Search Crypto </h1>
        <form>
          <input type='text' placeholder='Search' className='coin-input' onChange={handleChange} />
        </form>
      </div>
      {filterCoins.map(coin => {
        return (
          <Coin
            key={coin.id}
            name={coin.name}
            price={coin.current_price}
            image={coin.image}
            symbol={coin.symbol}
            marketCap={coin.market_cap}
            volume={coin.total_volume}
            priceChange={coin.price_change_percentage_24h}
          />
        )
      })}
    </div>
  )
}

export default App
