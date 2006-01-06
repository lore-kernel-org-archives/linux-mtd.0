Received: from [62.254.209.121] (helo=drmail.stives.linx.gbr)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eupf8-0007FG-Rj
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2006 06:21:42 -0500
Message-ID: <DB1B6B12D0E2F0469EB35A9586066B6ECE7974@stivesemail.stives.linx.gbr>
From: James Hughes <JHughes@Linx.co.uk>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 6 Jan 2006 11:09:52 -0000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Trying to get MTD to do anything...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all, 

sorry about this very basic (I assume) question.

I have a SandgateII PXA270 (ARM) board, and am trying to get the flash to be
recognised by MTD so I can mount a jffs2 fs over it.

The board uses Blob bootldr, and this shows 4 partitions on the flash. Last
of these is called ramdisk, from which originally the rootfs was loaded.
However I now use a rootfs over nfs so this partition is not used. I now
want to mount this partition as jffs2 as it's no longer used as a rootfs, so
I can do some performance testing of file handling on the flash itself -
which I obviously cannot do on the rootfs as it is over a network.

However, although I have enabled MTD in the kernel config, and all various
options I think I need, during kernel boot there is no indication that the
MTD driver(s) is being started up - no scanning, no flash finds etc.
Documentation for the patches for this board says MTD should be working.
Kernel version is 2.6.10.

Once booted, if I cat /proc/mtd there are no found MTD blocks.

My question (amongst many) is how do I get the MTD system to start up - what
have I missed? Is there any comprehensive documentation on this MTD system
and setting it up from the bootloader forward? (I have the book Building
Embedded Linux systems but its hasn't helped so far - but this is probably
because I am lacking a piece of information somewhere in my head which make
things clear)

James
