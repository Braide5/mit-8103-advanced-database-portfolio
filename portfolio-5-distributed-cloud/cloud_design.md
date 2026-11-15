# Portfolio 5 — Distributed and Cloud Database Exercise
## Proposed deployment
The university system can be deployed on a managed relational database service (for example, a managed PostgreSQL/MySQL cloud offering) with application servers connecting over a private network.

## Replication
A primary database accepts writes and replicates data to a read replica. Read replicas can serve reporting queries and reduce load on the primary. Replication lag must be considered: recently committed changes may not appear immediately on a replica.

## Sharding
If student/registration data grows beyond one server's capacity, records may be partitioned by a stable key such as department_id or student_id. A shard key must distribute load evenly and avoid making common queries require many shards. For this small portfolio, sharding is a design proposal rather than a live multi-node setup.

## Availability and consistency
Backups, monitoring, failover, and replicas improve availability. Strong consistency is important for course registration and duplicate prevention; eventual consistency may be acceptable for dashboards/reporting replicas. The system should use transactions and unique constraints for registration integrity.

## Security and operational controls
Use least-privilege database accounts, TLS for connections, private networking, encrypted backups, scheduled backups, audit logs, and tested recovery procedures.

## Evidence / limitation
This section is a documented cloud/distributed design. It is not a live cloud deployment. If a managed service is configured, include screenshots of the instance, replication configuration, and connectivity test.
