Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ai7I-0000xc-00
	for mtd-list@infradead.org; Thu, 30 Mar 2000 17:48:20 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12ai6Z-0000xQ-00
	for cvs-notify@infradead.org; Thu, 30 Mar 2000 17:47:35 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel ftl.c'
Message-Id: <E12ai6Z-0000xQ-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 30 Mar 2000 17:47:35 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv3661

Modified Files:
	ftl.c 
Log Message:
Remove some of the random printk()s from ftl.c now that it appears to work.
Fix the BLKGETSIZE ioctl to return the size of the partition, not the whole
device.
Note that 'appears to work' is intentional - it corrupts data somehow. I
need to locate a PCMCIA flash card, and verify that it was working before
I ported it to MTD - as far as I'm aware, I didn't change anything that
should cause this to break.

Oh yes - and in case you hadn't worked it out already, I started forwarding
the CVS commit logs to the mailing list.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
