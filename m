Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12slEK-0001Vy-00
	for mtd-list@infradead.org; Fri, 19 May 2000 12:46:12 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12slEI-0001Vl-00
	for cvs-notify@infradead.org; Fri, 19 May 2000 12:46:10 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd compatmac.h mtd.h'
Message-Id: <E12slEI-0001Vl-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 19 May 2000 12:46:10 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv5771/include/linux/mtd

Modified Files:
	mtd.h 
Added Files:
	compatmac.h 
Log Message:
Fixed the 2.2 and 2.3 builds, and hopefully paved the way for the 2.0
build to be merged in a less intrusive manner.

Reverted the addition of the extra arguments to mtd->read and mtd->write,
which we'd previously decided to delete. Yes, mtdchar is broken ATM, but
we knew that already - just hadn't yet got round to fixing it.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
