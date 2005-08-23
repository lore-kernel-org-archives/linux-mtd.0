Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7iJl-0000I3-Iq
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 19:36:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.realmsys.com (Postfix) with ESMTP id 4681C4C23D
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2005 17:28:59 -0600 (MDT)
Received: from mail.realmsys.com ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 32565-09 for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2005 17:28:57 -0600 (MDT)
Received: from pgrayson1.inrealm.net (fire2.inream.net [66.239.3.2])
	by mail.realmsys.com (Postfix) with ESMTP id DBC0E3DCC0
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2005 17:28:56 -0600 (MDT)
From: Peter Grayson <pgrayson@realmsys.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 23 Aug 2005 17:36:26 -0600
Message-Id: <1124840186.7086.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Latest jffs2 broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to use the latest mtd from cvs. There appears to be a
problem with jffs2 -- I'm surprised this has not tripped up anyone else
yet. I am seeing a kernel oops when I do the following procedure: erase
an mtd partition, mount the partition as jffs2, touch a file, unmount,
and remount.

This is fully reproducible for me. I am running the latest mtd cvs (as
of 8/23/2005) on a 2.6.10 kernel. I am using a 32MB partition for this
test, but it is not obvious that the partition size matters. My nand
part has a 2048-byte page size and 128 kB eraseblock size.

I have included the output showing the problem. Debug level is set to 1.

Has anyone else run into this?

Pete

---- Debug output below ----

# flash_eraseall -jq /dev/mtd3
# mount /mnt/mtdb3
# touch /mnt/mtdb3/foo
jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they
all?
jffs2: Couldn't find erase block to garbage collect!
# umount /mnt/mtdb3
# mount /mnt/mtdb3
kernel BUG in read_unknown at fs/jffs2/readinode.c:353!
Oops: Exception in kernel mode, sig: 5 [#1]
TASK = c0601190[74] 'jffs2_gcd_mtd3' THREAD: c044c000
Last syscall: -1
NIP [c00ad818] jffs2_do_read_inode_internal+0x804/0x1220
LR [c00ad1f4] jffs2_do_read_inode_internal+0x1e0/0x1220
Call trace:
 [c00ae2a4] jffs2_do_crccheck_inode+0x70/0xcc
 [c00b2de4] jffs2_garbage_collect_pass+0x284/0xa80
 [c00b4fc8] jffs2_garbage_collect_thread+0x1a0/0x1f4
 [c0004f6c] kernel_thread+0x44/0x60
