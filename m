Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xoXP-0001Ge-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 11:18:47 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 12xoXO-0001GR-00
	for cvs-notify@infradead.org; Fri, 02 Jun 2000 11:18:46 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs intrep.c'
Message-Id: <E12xoXO-0001GR-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Fri, 02 Jun 2000 11:18:46 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv4857/fs/jffs

Modified Files:
	intrep.c 
Log Message:
Reverting al viros hash list cleanup patch. It made my X freeze when i 
mounted a jffs fs. That makes me a bit uneasy, because it shouldn't be able 
do that, and it worked in the console.

I'll have to check this out a bit more carefully later.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
