Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13op9m-0003Wm-00
	for mtd-list@infradead.org; Thu, 26 Oct 2000 16:41:30 +0100
Received: from d8fa50aa.ptr.dia.nextlink.net ([216.250.80.170] helo=tetsuo.applianceware.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13op9k-0003Wg-00
	for mtd@infradead.org; Thu, 26 Oct 2000 16:41:29 +0100
Received: (from mike@localhost)
	by tetsuo.applianceware.com (8.9.3/8.9.3) id KAA24138
	for mtd@infradead.org; Thu, 26 Oct 2000 10:52:27 -0400
Message-ID: <20001026105227.A23989@tetsuo.applianceware.com>
Date: Thu, 26 Oct 2000 10:52:27 -0400
From: Mike Panetta <mpanetta@applianceware.com>
To: mtd@infradead.org
Subject: Help! I killed my DOC!
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I seem to have got myself in the foot
rather badly...  I was messing with grub
on the DOC yesterday and I accidently 
overwrote part of grub with an NFTL fs.

Now whenever the computer probes the 
bios on the DOC (grub) it says loading
grub from DOC and then promply reboots!
How do I get the system into a state
that will allow me to rewrite grub to 
the DOC?  Is this even possible?  I
have tried booting the computer with
the DOC out of the socket and then 
placing the DOC back into the socket
after the machine has booted.  When
I modprobe the docprobe module I get 
this message:

Cannot find driver for DiskOnChip 2000 at 0xD0000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000

I then try to access /dev/mtd0 and I
get a "No such device" message back
from the kernel...

Please if anyone knows what I can
do to fix this please tell me!

Thanks,
Mike Panetta






-- 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
