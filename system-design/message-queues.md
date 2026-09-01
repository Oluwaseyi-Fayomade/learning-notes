# What a message queue is and why it matters — use the Paydirect example

A message queue handles tasks asynchronously separating what must happen immediately from what can happen in the background.
when a payment completes, the user gets a response immediately. The SMS, dashboard update, and audit log happen in the background via the queue and the user doesn't wait for them.

## Producer, Consumer, Queue — one sentence each

Producer - The service that sends messages into the queue.
Queue - It holds messages until they are consumed.
Consumer - It reads messages from the queue and acts on them.

## Two benefits — decoupling and load levelling

i. decoupling - If the SMS service crashes, payments still work — messages pile up in the queue and get processed when SMS recovers.

ii. load levelling - if 100,000 payments arrive simultaneously, the queue absobs the spike.

## One real-world tool and what it's best for

Kafka - High throughput event streaming and millions of messages per second.
