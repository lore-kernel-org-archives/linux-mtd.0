Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12njuF-0004KO-00
	for mtd-list@infradead.org; Fri, 05 May 2000 16:20:43 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 12njuE-0004KI-00
	for cvs-notify@infradead.org; Fri, 05 May 2000 16:20:42 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs intrep.c'
Message-Id: <E12njuE-0004KI-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Fri, 05 May 2000 16:20:42 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv16626

Modified Files:
	intrep.c 
Log Message:
Fix for dereferencing f->parent == NULL in jffs_unlink_file_from_tree().
This is needed when mounting a fs with deleted nodes in it.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
