Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1384e3-00056g-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 18:32:03 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 1384e2-00056a-00
	for cvs-notify@infradead.org; Fri, 30 Jun 2000 18:32:02 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel nora.c'
Message-Id: <E1384e2-00056a-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 30 Jun 2000 18:32:02 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv19619/kernel

Modified Files:
	nora.c 
Log Message:
Switch nora back to only point at the second flash chip, now that I know
the alias detection works OK. I don't _really_ want to stick a filesystem
over my firmware and kernel :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
