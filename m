Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15pBKU-0006AB-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2001 17:26:34 +0100
Message-ID: <20011004093533.A25013@recycle.lbl.gov>
Date: Thu, 4 Oct 2001 09:35:33 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: No clean _or_ dirty blocks to GC from!
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is really strange.  I go through the following steps:

0. Run linux-2.4.9-ac10-rmk2-np1 with latest CVS MTD/JFFS2 on a
   StrongARM with Intel 28F320B3B Flash.  /dev/mtd2 is a 1M partition.

1. eraseall /dev/mtd2
    (works, I can verify all 1's in the 16 64K blocks)

2. cp image /dev/mtd2
    (image created with mkfs.jffs2.  Seems to work)

3. mount -t jffs2 /dev/mtdblock2 /mnt/test

mtdblock_open
ok
jffs2: No clean _or_ dirty blocks to GC from! Where are they all?
jffs2: Couldn't find erase block to garbage collect!

   The files are there.

4. umount /mnt/test
    (works)

5. check the blocks -- the 15 blocks that were all 1's before
   all now have at the beginning:

begin 644 foo
@A1D#(`P```"QL![D__________________________\`
`
end

$ hexdump foo
0000000 1985 2003 000c 0000 b0b1 e41e ffff ffff
0000010 ffff ffff ffff ffff ffff ffff ffff ffff
0000020

   Wild guess, after reading jffs2.h: these are "clean" markers.
   magic is 0x1985 == JFFS2_MAGIC_BITMASK,
   nodetype is 0x2003 == JFFS2_NODETYPE_CLEANMARKER,
   totlen is 12,
   hdr_crc is 0xe41eb0b1.
   So everything is fine, why the complaint?  And if I mount again,
   I get the same nasty message as before.

Clearly, I'm still a novice at JFFS2.

     - Larry
