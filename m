Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136xMu-0002un-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 16:33:44 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136xMt-0002uh-00
	for cvs-notify@infradead.org; Tue, 27 Jun 2000 16:33:43 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs intrep.c'
Message-Id: <E136xMt-0002uh-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 27 Jun 2000 16:33:43 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv11196

Modified Files:
	intrep.c 
Log Message:
Remove a redundant set_current_state(TASK_RUNNING) after schedule().
Add a FIXME comment because we don't handle the case where we're brought
out of that same schedule() by a signal.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
