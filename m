Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GfDiU-0005rP-TF
	for linux-mtd@lists.infradead.org; Wed, 01 Nov 2006 05:53:12 -0500
Received: from cad-250-152.norway.atmel.com (cad-250-152.norway.atmel.com
	[10.191.250.152])
	by relay.atmel.no (8.13.4/8.13.4) with ESMTP id kA1AqqwP010296
	for <linux-mtd@lists.infradead.org>;
	Wed, 1 Nov 2006 11:52:54 +0100 (CET)
	(envelope-from hskinnemoen@atmel.com)
Date: Wed, 1 Nov 2006 11:52:52 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2_flash_writev(): Non-contiguous write to 00825300 with
	mtd_dataflash
Message-ID: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone,

I've seen a couple of other people reporting this bug before, so I'm
just going to offer some observations I've made when trying to debug
this (I'm not a filesystem developer, so I don't fully understand the
code).

I can successfully mount a jffs2 filesystem on a freshly erased
AT45DB642x DataFlash chip through the mtd_dataflash driver. However,
when trying to write something to a file on that filesystem, I get a
BUG and the messages

jffs2_flash_writev(): Non-contiguous write to 00825300
wbuf was previously 00825300-008253b8

Just creating a file without trying to write anything to it works fine.

I've inserted a call to dump_stack() and a few debugging printks in
jffs2_flash_writev() to see what's going on, and I see the following:

pagesize=0x420 sector_size=0x2100

jffs2_flash_writev: count=1 to=0x825300
called from jffs2_write_dnode()
writebuffer: ofs=0x825300 len=0x0
jffs2_flash_writev: count=2 to=0x825344
called from jffs2_write_dirent()
writebuffer: ofs=0x825300 len=0x44
jffs2_flash_writev: count=2 to=0x825370
called from jffs2_write_dnode()
writebuffer: ofs=0x825300 len=0x6f
jffs2_flash_writev: count=1 to=0x825300
called from jffs2_mark_node_obsolete()
writebuffer: ofs=0x825300 len=0xb8
jffs2_flash_writev(): Non-contiguous write to 00825300
wbuf was previously 00825300-008253b8

So what appears to be going on is that a new file is created, then
something is written to it and the metadata has to be updated. This is
done by first writing a new dnode and then marking the old one as
obsolete. Since both nodes share the same sector, obsoleting the old
one means updating something that's already in the write buffer and
thus violating the assumption that the write buffer will only be
appended to.

Like I said, my understanding of the code is very limited, so I'd
really appreciate if someone could tell me if I understand this
correctly. I'd be happy to debug this further if you could just point
me in the right direction.

Btw, I'm using a new SPI driver for the Atmel SPI controller present on
most AT91 and AT32 chips. I'm planning to send it to akpm in a day or
two for possible inclusion in the -mm kernel, but I can of course send
it to you if you think something funny is going on in there.

Haavard
