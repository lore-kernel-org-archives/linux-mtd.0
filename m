Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1383xx-0004xJ-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 17:48:33 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 1383xw-0004x8-00
	for cvs-notify@infradead.org; Fri, 30 Jun 2000 17:48:32 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c'
Message-Id: <E1383xw-0004x8-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 30 Jun 2000 17:48:32 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv19034/kernel

Modified Files:
	cfi_cmdset_0001.c 
Log Message:
Dynamic timeout for writing - if we have to wait a while after our
udelay(), we wait longer next time. If it was ready immediately, we don't
wait as long next time. 
If the write time is 100% constant, we oscillate between the value above
and the value below the time it actually takes. This is fine, IMO.
I'll do something similar for erases - but erase finishing needs to be
shifted into a timer first.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
