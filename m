Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1370Nb-0003rS-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 19:46:39 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 1370Na-0003rM-00
	for cvs-notify@infradead.org; Tue, 27 Jun 2000 19:46:38 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c cfi_probe.c nora.c'
Message-Id: <E1370Na-0003rM-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 27 Jun 2000 19:46:38 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv14836/kernel

Modified Files:
	cfi_cmdset_0001.c cfi_probe.c nora.c 
Log Message:
Fix the extended probe to switch the chip back into Query Mode first.
We now happily handle aliases - so change the nora driver to map the 
whole of the first 64Mb - we sort it out at runtime now, rather than
cheating and munging the VM mapping :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
