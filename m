Received: from mail14.syd.optusnet.com.au ([211.29.132.195])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JuLVv-0005ry-TC
	for linux-mtd@lists.infradead.org; Fri, 09 May 2008 05:51:28 +0000
Received: from [192.168.70.104] (218-214-145-58.people.net.au [218.214.145.58])
	(authenticated sender jamessteward)
	by mail14.syd.optusnet.com.au (8.13.1/8.13.1) with ESMTP id
	m495pGgW008360
	for <linux-mtd@lists.infradead.org>; Fri, 9 May 2008 15:51:19 +1000
Subject: New thread [BUG] JFFS2 usage of write_begin and write_end
	functions causes kernel panic
From: James <jamessteward@optusnet.com.au>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 09 May 2008 15:51:16 +1000
Message-Id: <1210312276.28139.19.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've just subscribed.  I saw this in the archives and it matches exactly
what I'm seeing on an AT91SAM9263-EK board.  I have 4 such boards.  2
work ok, the other 2 exhibit this problem.  I'm using 2.6.24 + patches
from linux4sam.org.  I'm using soft ECC.  There are no bad blocks
detected by U-boot.

mtd->read(0x44 bytes from 0x33f1fdc) returned ECC error
Node CRC 6331fb4e != calculated CRC db9ac943 for node at 033f1fdc
kernel BUG at fs/jffs2/file.c:251!
Unable to handle kernel NULL pointer dereference at virtual address
00000000
pgd = c3de0000
[00000000] *pgd=23dea031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]

<snip>

Backtrace: 
[<c002afa8>] (__bug+0x0/0x2c) from [<c0105ac0>] (jffs2_write_end
+0x48/0x2ec)
[<c0105a78>] (jffs2_write_end+0x0/0x2ec) from [<c0063120>]
(generic_file_buffered_write+0x190/0x62c)
[<c0062f90>] (generic_file_buffered_write+0x0/0x62c) from [<c00639dc>]
(__generic_file_aio_write_nolock+0x420/0x470)
[<c00635bc>] (__generic_file_aio_write_nolock+0x0/0x470) from
[<c0063aa4>] (generic_file_aio_write+0x78/0xf4)
[<c0063a2c>] (generic_file_aio_write+0x0/0xf4) from [<c007f3f4>]
(do_sync_write+0xbc/0x10c)
[<c007f338>] (do_sync_write+0x0/0x10c) from [<c007fce0>] (vfs_write
+0xb8/0x148)
[<c007fc28>] (vfs_write+0x0/0x148) from [<c00802ac>] (sys_write
+0x44/0x70)
 r7:00000004 r6:c3f9b8a0 r5:00000000 r4:00002000
[<c0080268>] (sys_write+0x0/0x70) from [<c0026de0>] (ret_fast_syscall
+0x0/0x2c)
 r6:4001b000 r5:00001000 r4:002a3790
Code: e1a01000 e59f000c eb004874 e3a03000 (e5833000) 
---[ end trace 4f4710199a7699a4 ]---
Segmentation fault
mtd->read(0x19f bytes from 0x33d1f54) returned ECC error

Did the change suggested here
http://lists.infradead.org/pipermail/linux-mtd/2008-April/021473.html
help?

<quote>
diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 5e92034..a146bf4 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -99,7 +99,7 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
  	kunmap(pg);

  	D2(printk(KERN_DEBUG "readpage finished\n"));
-	return 0;
+	return ret;
  }

  int jffs2_do_readpage_unlock(struct inode *inode, struct page *pg)
</quote>

I realise I should not have started a new thread, so is there a way I
could reply to a message on the list archive?

Regards,
James.
