Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12tRUj-0006Ue-00
	for mtd-list@infradead.org; Sun, 21 May 2000 09:53:57 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 12tRUe-0006UP-00
	for cvs-notify@infradead.org; Sun, 21 May 2000 09:53:52 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs intrep.c'
Message-Id: <E12tRUe-0006UP-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Sun, 21 May 2000 09:53:52 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv24946/fs/jffs

Modified Files:
	intrep.c 
Log Message:
Use list_head instead of home-cooked list primitives for hashtable.
Patch from al viro.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
