From: nicola76@inwind.it (Nicola)
Date: 07 Feb 2003 18:20:00 +0100
Subject: CFI/MTD weird problem
Message-ID: <1044638400.10751.40.camel@localhost.localdomain>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I forgot to attach the console output that could be useful to understand
the problem:

Uncompressing Linux............................................ done,
booting the kernel.
Linux version 2.4.19-rmk4-ds2 (local at localhost.localdomain) (gcc version
2.95.3 20010315 (release)) #261 ven feb 7 14:32:33 CET 2003
CPU: %s revision -1073616200
Machine: %
Ignoring unrecognised tag 0x00000000
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: %
Calibrating delay loop... 398.%2lu BogoMIPS
Memory: 64MB = 64MB total
Memory: 63344KB available (1187K code, 205K data, 52K init)
XScale Cache/TLB Locking Copyright(c) 2001 MontaVista Software, Inc.
Dentry cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
init!
Unable to handle kernel %at virtual address c0127b5c
pgd = c0004000
*pgd = 00000000, *pmd = 00000000
Internal error: %: c0127b6c
