Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1381oz-0004YQ-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 15:31:09 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 1381oy-0004YK-00
	for cvs-notify@infradead.org; Fri, 30 Jun 2000 15:31:08 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c'
Message-Id: <E1381oy-0004YK-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 30 Jun 2000 15:31:08 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv17500

Modified Files:
	cfi_cmdset_0001.c 
Log Message:
sync: Remember to unlock the chip after setting its state to ENFORCED_IDLE
Some more debugging



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
