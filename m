Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132H4P-000475-00
	for mtd-list@infradead.org; Wed, 14 Jun 2000 18:35:17 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 132H4O-00046z-00
	for cvs-notify@infradead.org; Wed, 14 Jun 2000 18:35:16 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c'
Message-Id: <E132H4O-00046z-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 14 Jun 2000 18:35:16 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv15783

Modified Files:
	cfi_cmdset_0001.c 
Log Message:
Erase code. Now we have basic support for Intel Command Set NOR flash. 
It busy waits for erases, and uses the basic 'word program' for writes
rather than using buffers, but it works.
Now I need to sort out flash chip locking so I can deal with async
behaviour and timers properly.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
