Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132yoJ-0004EB-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 17:17:35 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 132yoI-0004E5-00
	for cvs-notify@infradead.org; Fri, 16 Jun 2000 17:17:34 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs intrep.c'
Message-Id: <E132yoI-0004E5-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 16 Jun 2000 17:17:34 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv16240

Modified Files:
	intrep.c 
Log Message:
OK, 'fess up - who was responsible for:
	free_page((__u32)page);   ?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
