# What is a cache and why it matters?

A cache stores data in fast memory (RAM), so that the subsequent request can access it faster.

It matters because it helps retrieve data faster for frequent use. examples is 500 users hitting the database simultaneously, cache prevent it from sudden outage.

## The 3 caching strategies (Cache-Aside, Write-Through, Write-Behind)

i. Cache Aside: This divided into 2:

cache hit: this is when data is found in cache and return immediately.

cache miss: when the request could not find data on the cache, it goes to the database to fetch data stored and it takes time.

ii. Write Through: this allows data to be stored on both the cache and database immediately once the request hits it.

iii. Write Behind: this allows data to sync background after the request hits the cache. If cache crashes before database is updated, data will be lost permanently

## The 3 eviction policies (LRU, LFU, TTL)

LRU - Least Recently Used - removes item that have not be accessed over a long period of time.

LFU - Least Frequent Used - removes item that are accessed least overall.

TTL - Time To Live - removes item after the set time of expiration.

## Cache stampede and one prevention method

Cache stampede is when multiple request hits the database at once, this leads to delay and it is majorly caused by cache expiry.

Mutex/Lock — only one request rebuilds the cache, others wait for it to finish.

Staggered TTLs - add a small random offset to expiry times so entries don't all expire simultaneously.
