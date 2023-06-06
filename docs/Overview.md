```mermaid

flowchart TD
a[Mobile App] --> b[Auth Server]
a --> c[Game Service]
a --> d[Character Service]


b-->e[Couchbase Auth]
c-->f[Couchbase Games]
d-->g[Couchbase Characters]

a-->h[AI Service]
