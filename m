Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13BiVJ-00011T-00
	for mtd-list@infradead.org; Mon, 10 Jul 2000 19:42:05 +0100
Received: from mail.transzap.net ([207.239.241.226] helo=tzi.transzap.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13BiVI-00011N-00
	for mtd@infradead.org; Mon, 10 Jul 2000 19:42:04 +0100
Received: from localhost (phiggins@localhost)
	by phiggins.transzap.com (8.9.3/8.8.7) with ESMTP id MAA02394
	for <mtd@infradead.org>; Mon, 10 Jul 2000 12:45:52 -0600
From: Patrick Higgins <phiggins@transzap.com>
To: mtd@infradead.org
Date: Mon, 10 Jul 2000 12:45:52 -0600 (MDT)
Subject: NFTL problems
Message-ID: <Pine.LNX.4.21.0007101236250.2339-100000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I think I've found a bug in NFTL, but since some things aren't working
after applying my "fix" I haven't committed it.

I found the bug while trying to fdisk /dev/nftla to change the partition
type from 4 to 83 after using dformat on the DoC.  I was getting a kernel
oops when fdisk calls the BLKRRPART ioctl.  I think the problem is that
the code is calling resetup_one_dev on the wrong disk:

resetup_one_dev(&nftl_gendisk, MINOR(inode->i_dev) / 16);

when the line should read:

resetup_one_dev(&nftl_gendisk, MINOR(inode->i_rdev) / 16);
                                              ^
                                              |
                                              |

The grok_partitions call probably needs a similar fix.  After making this
change, the kernel oops went away and the fdisk completed normally.  I was
also able to run mke2fs on /dev/nftla1, but after all this, nothing seemed
to change.  The partition still showed itself as a type 4, and it still
had a FAT filesystem on it.  It's as if CONFIG_NFTL_RW wasn't defined (but
wouldn't all writes fail with -1 then?).  Anyone know what's going on?

-Patrick


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
