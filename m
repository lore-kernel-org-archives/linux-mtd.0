Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13844b-0004z3-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 17:55:25 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 13844a-0004yx-00
	for cvs-notify@infradead.org; Fri, 30 Jun 2000 17:55:24 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c'
Message-Id: <E13844a-0004yx-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 30 Jun 2000 17:55:24 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv19151

Modified Files:
	cfi_cmdset_0001.c 
Log Message:
Don't schedule() while waiting for chip to be ready. It seems to lock up.
I'm convinced it _shouldn't_ but that can wait until I can debug it more
easily.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
