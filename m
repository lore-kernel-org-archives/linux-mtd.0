Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131cmB-0000CC-00
	for mtd-list@infradead.org; Mon, 12 Jun 2000 23:33:47 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 131cmA-0000C6-00
	for cvs-notify@infradead.org; Mon, 12 Jun 2000 23:33:46 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel vmax301.c'
Message-Id: <E131cmA-0000C6-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 12 Jun 2000 23:33:46 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv746

Modified Files:
	vmax301.c 
Log Message:
VMAX301 should have been using ioremap(). Now it does.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
