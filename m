Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1382O2-0004fH-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 16:07:22 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 1382O2-0004fB-00
	for cvs-notify@infradead.org; Fri, 30 Jun 2000 16:07:22 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c'
Message-Id: <E1382O2-0004fB-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 30 Jun 2000 16:07:22 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv17925

Modified Files:
	cfi_cmdset_0001.c 
Log Message:
Doh! change a handful of:
	chipnum = (to % cfi->chipsize);
to:
	chipnum = (to / cfi->chipsize);



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
