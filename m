Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sjOb-0001Ie-00
	for mtd-list@infradead.org; Fri, 19 May 2000 10:48:41 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 12sjOa-0001IY-00
	for cvs-notify@infradead.org; Fri, 19 May 2000 10:48:40 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs inode.c'
Message-Id: <E12sjOa-0001IY-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Fri, 19 May 2000 10:48:40 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv4990

Modified Files:
	inode.c 
Log Message:
HOA!
Now the fs does *not* Oops when you remove a file that you've just read.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
