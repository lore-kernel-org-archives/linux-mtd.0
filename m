Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ayBT-0002or-00
	for mtd-list@infradead.org; Fri, 31 Mar 2000 10:57:43 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12ayBS-0002ol-00
	for cvs-notify@infradead.org; Fri, 31 Mar 2000 10:57:42 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtdram.c'
Message-Id: <E12ayBS-0002ol-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 31 Mar 2000 10:57:42 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv10828

Modified Files:
	mtdram.c 
Log Message:
Change erase size of mtdram to 4K, to see if it makes FTL happier.
Remove the kfree(instr) in ram_erase, which shouldn't really be there.
(I know, it was copied from my code :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
