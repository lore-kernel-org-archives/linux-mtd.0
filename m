Received: from shawidc-mo1.cg.shawcable.net ([24.71.223.10]
	helo=pd2mo2so.prod.shaw.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AXNO2-0001YC-Dk
	for linux-mtd@lists.infradead.org; Fri, 19 Dec 2003 16:21:58 +0000
Received: from pd3mr1so.prod.shaw.ca (pd3mr1so-ser.prod.shaw.ca
	[10.0.141.177])2003))linux-mtd@lists.infradead.org;
	Fri, 19 Dec 2003 09:16:25 -0700 (MST)
Received: from pn2ml10so.prod.shaw.ca
 (pn2ml10so-qfe0.prod.shaw.ca [10.0.121.80])
 by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28 2003))
 with ESMTP id <0HQ5005E9H7DHR@l-daemon> for linux-mtd@lists.infradead.org;
 Fri, 19 Dec 2003 09:16:25 -0700 (MST)
Received: from ThomasVan (h24-80-140-166.vc.shawcable.net [24.80.140.166])
 by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28 2003))
 with ESMTP id <0HQ500CLTH7CKH@l-daemon> for linux-mtd@lists.infradead.org;
 Fri, 19 Dec 2003 09:16:25 -0700 (MST)
Date: Fri, 19 Dec 2003 08:16:30 -0800
From: Thomas Pang <thomaspang@shaw.ca>
In-reply-to: <Law11-F49ynA6xSm1A00005337c@hotmail.com>
To: 'J B' <mad_flasher@hotmail.com>
Message-id: <000501c3c64b$767a9de0$a68c5018@ThomasVan>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Problem with mtd-snapshot-20031211.tar
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using AMD NOR+SRAM flash in MCP (multi-chip packages) with CFI
support.
Thanks.
Thomas

-----Original Message-----

>I download the boot image into my target system and successfully boot
up
>the board.  I also download the file systems, one is CRAMFS, another
one
>is JFFS2.

What kind of flash chips does your board have?  AMD, Intel, etc and NOR
or 
NAND?

>
>I am using the latest mkfs.jffs2 to create my JFFS2 file system as
shown
>below:
>
>mkfs.jffs2 -p -e 0x10000 -c 12 -b -r rootfs -o jffsImage
>
>Problem 1 (Fail to mount JFFS2 file system)
>===========================================
>
>I seem to be able to mount the JFFS2 file system but when I access the
>JFFS2 file system, the system complains "Chip not ready after erase
>suspended: status = 0x1985". Any idea?

0x1985 is the magic number on a jffs2 filesystem.  Looks like the chip 
driver is trying to read the status register of the chips and its in
read 
array mode, not read status.

># ls
>Chip not ready after erase suspended: status = 0x1985
>error -5 reading node at 0x001901f8 in get_inode_nodes()
>jffs2_get_inode_nodes() for ino 2 returned -5
>ls: ./bin: Input/output error

see comment about magic number above.  JFFS2 is probably erasing any
extra 
eraseblocks you have so it can use them  and the erase suspend is
failing 
when the ls command is done.


>Problem 2 (Writing to JFFS2 file system still slow)

<snip>

>     rm myfile
>     cp bin/myfile .
>     Chip not ready after erase suspended: status = 0xffff
>     Chip not ready after erase suspended: status = 0xffff

looks like the same problem.  0xffff is what erased flash blocks look
like.

So two questions are, what kind of flash chips do you have, and what mtd

chip driver are you using?

j

_________________________________________________________________
Enjoy the holiday season with great tips from MSN.  
http://special.msn.com/network/happyholidays.armx
