Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131YDr-0007lS-00
	for mtd-list@infradead.org; Mon, 12 Jun 2000 18:42:03 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 131YDp-0007lC-00
	for cvs-notify@infradead.org; Mon, 12 Jun 2000 18:42:01 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_probe.c nora.c Config.in Makefile'
Message-Id: <E131YDp-0007lC-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 12 Jun 2000 18:42:01 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv29800/kernel

Modified Files:
	Config.in Makefile 
Added Files:
	cfi_probe.c nora.c 
Log Message:
Add a slightly neater, if less optimal, structure for memory-mapped
devices. Couple it with a start at detecting CFI devices and a driver
which should support CFI flash attached directly to the CPU's memory bus.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
