Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12b2bM-0003Lc-00
	for mtd-list@infradead.org; Fri, 31 Mar 2000 15:40:44 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12b2bL-0003LU-00
	for cvs-notify@infradead.org; Fri, 31 Mar 2000 15:40:43 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel doc2000.c ftl.c mapped.c mtd.c mtdblock.c nftl.c pmc551.c'
Message-Id: <E12b2bL-0003LU-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 31 Mar 2000 15:40:43 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv12827/kernel

Modified Files:
	doc2000.c ftl.c mapped.c mtd.c mtdblock.c nftl.c pmc551.c 
Log Message:
Make everything conform to the new notify stuff - separate add and remove
	functions, etc.

Remove all references to get_mtd_device.

Add a linked list of devices in pmc551.c and doc2000.c to copy with the
	fact that they can no longer just go through the available MTD
	devices with get_mtd_device()

Probably break the request handling in mtdblock.c in an attempt to make
	it compile and work in 2.3.

Make the MTDERASE ioctl on the char device wait for completion.

Change all the debugging macros again. Now they're based on DHinds' 
	PCMCIA_DEBUG stuff: DEBUG(level, fmt, args...)

Remove the kfree(instr) from a handful of drivers' erase functions - that
	was never really a clever idea in the first place. Let the caller
	free it themselves if they must, or pass &kfree as the callback
	function if they can't be bothered.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
