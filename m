Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12b35y-0003UZ-00
	for mtd-list@infradead.org; Fri, 31 Mar 2000 16:12:22 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12b35w-0003UM-00
	for cvs-notify@infradead.org; Fri, 31 Mar 2000 16:12:20 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd nftl.h'
Message-Id: <E12b35w-0003UM-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 31 Mar 2000 16:12:20 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv13392/include/linux/mtd

Modified Files:
	nftl.h 
Log Message:
Fix the if (doclist) logic to exit when we _haven't_ found and
DisksOnChip, rather than when we _have_.

Change the lock on the NFTL structure to a semaphore, because we have to
be able to sleep while we're holding it. We ought to be able to get away
without having a lock at all, like FTL does. Locking will need to be done
in doc2000.c but that's necessary anyway.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
