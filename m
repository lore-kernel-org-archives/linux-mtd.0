Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1381do-0004VC-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 15:19:36 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 1381do-0004V6-00
	for cvs-notify@infradead.org; Fri, 30 Jun 2000 15:19:36 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_probe.c'
Message-Id: <E1381do-0004V6-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 30 Jun 2000 15:19:36 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv17298

Modified Files:
	cfi_probe.c 
Log Message:
Initialise the wait queue and spinlock _after_ we've memcpy'd them to
their final location, not before.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
