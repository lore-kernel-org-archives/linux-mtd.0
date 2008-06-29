Received: from fk-out-0910.google.com ([209.85.128.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KCvCc-0002Db-NR
	for linux-mtd@lists.infradead.org; Sun, 29 Jun 2008 11:36:19 +0000
Received: by fk-out-0910.google.com with SMTP id 18so1051489fks.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Jun 2008 04:36:14 -0700 (PDT)
Message-ID: <90d987c0806290436h2dbe9416ne2e849435c309028@mail.gmail.com>
Date: Sun, 29 Jun 2008 17:06:14 +0530
From: "rohit h" <hrohit85@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [JFFS2]BUG message on write failure
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everyone.
I am getting a BUG message when running JFFS2 on OneNAND.
This happens when write operation on device fails.
The same message comes again after some time for write on the same block.
Can someone please give some idea to resolve this.

Thanks in advance,
Rohit


root@apollon:~# onenand_wait: controller error = 0x0400
onenand_write_ops_nolock: write filaed -5
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf succeeded to 0e381000
BUG: sleeping function called from invalid context at
include/linux/writeback.h:80
in_atomic():1, irqs_disabled():0
[<c0025ec8>] (dump_stack+0x0/0x14) from [<c00357a8>] (__might_sleep+0xdc/0xf8)
[<c00356cc>] (__might_sleep+0x0/0xf8) from [<c00958ac>] (ifind_fast+0x50/0x90)
 r4:c3aea09c
[<c009585c>] (ifind_fast+0x0/0x90) from [<c0095c28>] (iget_locked+0x40/0x158)
 r6:c3c80600 r5:00000001 r4:0000003f
[<c0095be8>] (iget_locked+0x0/0x158) from [<c00f0074>]
(jffs2_gc_fetch_inode+0xe0/0x14c)
[<c00eff94>] (jffs2_gc_fetch_inode+0x0/0x14c) from [<c00f1d28>]
(__jffs2_flush_wbuf+0x70c/0xc84)
[<c00f161c>] (__jffs2_flush_wbuf+0x0/0xc84) from [<c00f24b8>]
(jffs2_flash_writev+0x218/0x41c)
[<c00f22a4>] (jffs2_flash_writev+0x4/0x41c) from [<c00ea4fc>]
(jffs2_write_dnode+0x12c/0x370)
[<c00ea3d0>] (jffs2_write_dnode+0x0/0x370) from [<c00eab8c>]
(jffs2_write_inode_range+0x1c8/0x340)
[<c00ea9c4>] (jffs2_write_inode_range+0x0/0x340) from [<c00e4d28>]
(jffs2_commit_write+0x10c/0x23c)
[<c00e4c1c>] (jffs2_commit_write+0x0/0x23c) from [<c0062160>]
(generic_file_buffered_write+0x4a0/0x6b4)
[<c0061cc4>] (generic_file_buffered_write+0x4/0x6b4) from [<c006285c>]
(__generic_file_aio_write_nolock+0x4e8/0x53c)
[<c0062374>] (__generic_file_aio_write_nolock+0x0/0x53c) from
[<c0062930>] (generic_file_aio_write+0x80/0xfc)
[<c00628b4>] (generic_file_aio_write+0x4/0xfc) from [<c00813ec>]
(do_sync_write+0xc4/0x118)
[<c0081328>] (do_sync_write+0x0/0x118) from [<c0081c50>] (vfs_write+0xb8/0xf8)
 r8:402008d0 r7:c38aff78 r6:402008d0 r5:c3aefb80 r4:0001b2dc
[<c0081b98>] (vfs_write+0x0/0xf8) from [<c00821d0>] (sys_write+0x4c/0x80)
 r7:0001b2dc r6:c3aefb80 r5:00000000 r4:0005786b
[<c0082184>] (sys_write+0x0/0x80) from [<c0021e40>] (ret_fast_syscall+0x0/0x2c)
 r8:c0021fe4 r7:00000004 r6:beeefb1c r5:beeefb14 r4:4f19b2db
Write of 4164 bytes at 0x0e447064 failed. returned -5, retlen 0
Not marking the space at 0x0e447064 as dirty because the flash driver
returned retlen zero
