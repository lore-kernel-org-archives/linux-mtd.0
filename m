Received: from hephaestus-pat.cam.equator.com ([205.242.233.131]
	helo=scyld.cam.equator.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DgXCv-0003b1-S5
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2005 20:17:11 -0400
Received: from [10.0.0.147] (pkamp-t2.cam.equator.com [10.0.0.147])
	by scyld.cam.equator.com (8.12.10/8.12.10) with ESMTP id j5A0H6Kf004749
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2005 17:17:07 -0700
Message-ID: <42A8DC02.90708@equator.com>
Date: Thu, 09 Jun 2005 17:17:06 -0700
From: Phillip Kamp <pkamp@equator.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: mkfs.jffs2 --cleanmarker=?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm developing a proprietary nand flash driver based on the
drivers/mtd/nand/nand_base.c code.  I can successfully read
and write the nand device in char mode, but when I write a jffs2
file system on it I get these CLEANMARKER errors:
CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0
CLEANMARKER node found at 0x00004000 has totlen 0xc != normal 0x0
CLEANMARKER node found at 0x00008000 has totlen 0xc != normal 0x0
CLEANMARKER node found at 0x0000c000 has totlen 0xc != normal 0x0
...
for every single block.

The Samsung nand chip we use is has 512 byte pages, 16 byte OOB area and
16 Kbyte erase blocks:
dev:    size   erasesize  name
mtd0: 00800000 00004000 "Boot Image"
mtd1: 01800000 00004000 "Root FS (JFFS2)"

I can successfully boot from the mtd0 partiion.  But when I create my
jffs2 image I use
mkfs.jffs2 -s 0x200 -e 0x4000 -o jffs2.image

and copy it,
cp jffs2.image /dev/mtd1

but when I mount the partion using
mount -t jffs2 /dev/mtdblock1 /mnt/nf

I get the above errors.  The fs seems to function okay, but this slew
of errors seems ominous.  (Same results if I mount the partition as my
root fs).

What is the --cleanmarker option?  Is it related to the oob size?  I
tried -c 16 and the error changed to "totlen 0x10 != normal 0x0".
Perhaps -c 0 would mask these errors, but before I do that I wanted
to see what exactly the cleanmarker meant.

I'm using jffs2 sources from Linux 2.6.11.  I see you latest distribution
is more recent.  Is it worth it for me to port your distribution
to my linux version, or am I doing something fundamentally ignorant?

Thanks in advance.
Phil
