Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sTDO-0008GY-00
	for mtd-list@infradead.org; Thu, 18 May 2000 17:32:02 +0100
Received: from eauth by infradead.org with local (Exim 3.03 #1)
	id 12sTDM-0008GJ-00
	for cvs-notify@infradead.org; Thu, 18 May 2000 17:32:00 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtdblock.c mtdchar.c mtdcore.c mtdram.c ftl.c'
Message-Id: <E12sTDM-0008GJ-00@infradead.org>
From: eauth@infradead.org
Date: Thu, 18 May 2000 17:32:00 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv31740/kernel

Modified Files:
	mtdblock.c mtdchar.c mtdcore.c mtdram.c ftl.c 
Log Message:
An attempt to support 2.0 and 2.1 kernels for uClinux 
and other systems where the latest kernel is not used.
Until now, only the MTD core modules, mtdram.c and
ftl.c are converted. The changes are centralized in the
file sysdep-2.2.h.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
