From: kai-uwe.bloem@auerswald.de (kai-uwe.bloem at auerswald.de)
Date: 13 Feb 2003 15:18:25 UT
Subject: jffs2 occasionally locking up?
Message-ID: <0019C845.3E4BC54E@mail.auerswald.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I use jffs2 (version from ftp, 20030210) on an Intel xscale pxa250, with one Intel 28f128 in 16 Bit mode.
I occasionally observe the following problem, which I consider rather severe:

- mount an empty partition as jffs2 on an Intel 28f128K3 flash.
- copy a large directory tree to it
- *immediately* overwrite that tree with itself
- *immediately* copy another large oversized (too big for this partition) tree

Sometimes the last copy doesn't produce a "no space" error message. Rather, it does not return for at least half an hour, which is the longest time I waited for completion.

Moreover, if I stop copying by ctrl-c, and try to unmount the partition, the unmount locks up as well.

I have put some code into the cfi driver to observe sector erasing. I noticed that after I have interrupted the copy, sectors are still erased every other second or such. This keeps going on and on. Looks to me like the garbage collector is in a kind of endless loop here.

If I reset the system, on reboot I get some errors concerning node CRCs in one of the last blocks that were erased, then everything appears to be fine.

Has anyone else observed such problems?

--kub
