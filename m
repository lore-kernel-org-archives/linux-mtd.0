Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xJAl-0004T7-00
	for mtd-list@infradead.org; Thu, 01 Jun 2000 01:49:19 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12xJAk-0004T1-00
	for cvs-notify@infradead.org; Thu, 01 Jun 2000 01:49:18 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/grub doc_stage1.S'
Message-Id: <E12xJAk-0004T1-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 01 Jun 2000 01:49:18 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/grub
In directory infradead.org:/tmp/cvs-serv17114

Modified Files:
	doc_stage1.S 
Log Message:
Fix the setup of the INT 19h handler so we are no longer using the
previously initialised %es register as the segment address of the vector.

Also fix the segment registers in the actual copy, so that we put the 
right stuff in place, rather than starting our copy at 0000:0000.

I can hardly believe that this has ever worked. It seems that by an
amazing coincidence, the IPL ROM sets %es to 0x2000 before jumping to
the code - so even though we were using an uninitialised segment
address pointer, and our copy of the IRQ handler to the _intended_
location went AWOL, we ended up with the INT 19h handler pointing at
the location in memory at which the IPL ROM loads the SPL, before the
SPL relocates itself into the reserved area.

So as long as nothing touched that memory later in the startup sequence,
it would still be there when the BIOS got round to calling INT 19h to
boot. This is why it worked on simple machines like my 386 testbed, but
nothing else.

I hereby declare myself to be Today's Official Mr F*** All Good.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
