Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136vaw-0002T6-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 14:40:06 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136vav-0002T0-00
	for cvs-notify@infradead.org; Tue, 27 Jun 2000 14:40:05 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtdcore.c'
Message-Id: <E136vav-0002T0-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 27 Jun 2000 14:40:05 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv9478

Modified Files:
	mtdcore.c 
Log Message:
Cover the horribly insane possibility that an MTD device or user could be
registered from a module which then unloads itself - prevent mtdcore from
being unloaded in that case.

Not that I ever really expect such a thing to happen, but there's no harm
in protecting against it.

Al Viro has a sick mind.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
