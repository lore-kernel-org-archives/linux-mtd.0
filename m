Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12nNRO-0001KN-00
	for mtd-list@infradead.org; Thu, 04 May 2000 16:21:26 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12nNRN-0001KE-00
	for cvs-notify@infradead.org; Thu, 04 May 2000 16:21:25 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel doc2001.c docprobe.c Config.in Makefile doc2000.c'
Message-Id: <E12nNRN-0001KE-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 04 May 2000 16:21:25 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv5008/kernel

Modified Files:
	Config.in Makefile doc2000.c 
Added Files:
	doc2001.c docprobe.c 
Log Message:
Split the DiskOnChip probe from the DoC2000 and DoCMillennium specific
code. This involves implementing dlopen() in kernel, amusingly.

Don't get _too_ excited - this doesn't mean I'm about to actually write
the Millennium support - just that I'm making room for someone to do it.

The Millennium driver is currently a straight copy of the DoC2000 code -
which means it won't work.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
