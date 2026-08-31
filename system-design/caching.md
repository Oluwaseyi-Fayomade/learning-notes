# Caching

## What is a cache and why does it matter?

A cache is a temporary storage layer usually in RAM that sits between your application and your database. Instead of hitting the database on every request, you store the result of a query in the cache so the next request gets it instantly.

## Why does this matter?

Imagine 500 bank users opening the same report on an application at 9am. Without a cache, that's 500 database queries running simultaneously one slow stored procedure and the whole thing falls over. With a cache, only the first request hits the database. The other 499 get served from memory in milliseconds.

## The 3 Caching Strategies

### Cache-Aside (most common)

The application manages the cache manually. When a request comes in, it checks the cache first. If the data is there, cache hit and it returns immediately without touching the database. If it's not there, cache miss and it goes to the database, fetches the data, stores it in the cache for next time, then returns it.

This is the right strategy for Paydirect reports. Read-heavy, and the application can handle a cache miss gracefully.

### Write-Through

Every time data is written, it goes to both the cache and the database at the same time. The cache is always in sync no stale data. The downside is that every write is slower because it has to update two places. Good for systems where consistency is critical.

### Write-Behind (Write-Back)

Data is written to the cache immediately and the database is updated later in the background. This makes writes very fast  but it's dangerous. If the cache crashes before the database is updated, that data is permanently lost. Never use this for financial systems. In a payment platform, losing a transaction record is catastrophic.

## Eviction Policies - What Gets Removed When Cache is Full?

**LRU - Least Recently Used:** Removes the item that hasn't been accessed for the longest time. The most common policy. Good general-purpose choice.

**LFU - Least Frequently Used:** Removes the item that has been accessed least often overall. Better when some items are consistently popular and should never be evicted.

**TTL - Time To Live:** Removes items after a set time expires, regardless of how often they've been accessed. Good for time-sensitive data like reports that need to stay fresh.

## Cache Stampede

Cache stampede happens when a cached item expires and a large number of requests all get a cache miss at the same moment — flooding the database with simultaneous queries. This is the exact problem you were trying to avoid by adding a cache in the first place.

**Two ways to prevent it:**

**Mutex/Lock:** Only one request is allowed to rebuild the cache. All other requests wait for it to finish, then read from the freshly populated cache.

**Staggered TTLs:** Instead of all cache entries expiring at the same time, add a small random offset to each entry's expiry. This spreads out the misses so the database never gets hit all at once.
