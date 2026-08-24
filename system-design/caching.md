# What is a cache and why it matters?

A cache stores data in fast memroy (RAM), so that the subsequent request can access it faster.
It matters becauuse it helps retrieve data faster for frequent use.

## The 3 caching strategies (Cache-Aside, Write-Through, Write-Behind)

i. Cache Aside: This divideded into 2:
cache hit and cache miss
cache hit: this is when request hit 
cacge miss: when the request could not find data on the cache, it goes to the database to fetch data store and it takes time.
ii. Write Through: this allows data to be stored on both the cache and database immediately once the request hits it.
iii. Write Behind: this allows data to sync background after the request hits the cache

## The 3 eviction policies (LRU, LFU, TTL)
LRU - Least Recently Used
LFU - Least Frequent Used
TTL - Time To Live

## Cache stampede and one prevention method

Cache stampede is when multiple request hits the database at once, this leads to delay and it is majorly caused by long queries running.

