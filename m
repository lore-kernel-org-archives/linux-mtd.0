Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132v6f-00039L-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 13:20:17 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 132v6e-00039F-00
	for cvs-notify@infradead.org; Fri, 16 Jun 2000 13:20:16 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs intrep.c jffs_fm.c'
Message-Id: <E132v6e-00039F-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 16 Jun 2000 13:20:16 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv12078

Modified Files:
	intrep.c jffs_fm.c 
Log Message:
Sort out the <linux/module.h> multiple includes by defining __NO_VERSION__
Horrible but effective. At some point in 2.5, remind me to shift the 
__this_module et al definitions from module.h into a different file.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
