Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136yLB-0003GM-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 17:36:01 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136yLA-0003GG-00
	for cvs-notify@infradead.org; Tue, 27 Jun 2000 17:36:00 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c'
Message-Id: <E136yLA-0003GG-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 27 Jun 2000 17:36:00 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv12506/kernel

Modified Files:
	cfi_cmdset_0001.c 
Log Message:
First attempt at doing locking and per-chip access. I'll eat my hat if
this works - but it compiles!



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
