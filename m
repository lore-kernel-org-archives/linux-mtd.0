Received: from relais.videotron.ca ([24.201.245.36] helo=VL-MS-MR002.sc1.videotron.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170YRz-0007NF-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Apr 2002 02:53:35 +0100
Received: from flefebvre ([66.130.133.115]) by
          VL-MS-MR002.sc1.videotron.ca (Netscape Messaging Server 4.15)
          with SMTP id GV3P9904.5T8 for <linux-mtd@lists.infradead.org>;
          Wed, 24 Apr 2002 21:53:33 -0400
Message-ID: <001c01c1ebfc$00fea960$0201000a@flefebvre>
From: "Frederick Lefebvre" <flefebvre@irg.ca>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
References: <1019677528.1351.67.camel@zeus>  <17234.1019686502@redhat.com>
Subject: Re: build_fs failed 
Date: Wed, 24 Apr 2002 21:53:32 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Sorry, I included the full log in a message last week but did not get any
answers so I tought I would ask a more precise question.  I am including it
below.  Here are some of the problems I had that I think could be relevent
in this case.

I am using a DiskOnChip 2000 of 32Mb with a 16K erase size ... but the
"mkfs.jffs2" utility enforces a minimum erase size of 64K.  So I removed the
piece of code that replaced any value < 64K from the source and recompile to
build my jffs2 image (but I had the same problem with the original version).

I had to do the same kind of modification to the nftl_format utility. The
nftl layer under ext2 worked perfectly afterward but I really need something
like jffs2 for my application.

Apr 19 14:50:55 junior kernel: mtdblock_open
Apr 19 14:50:55 junior kernel: ok
Apr 19 14:50:55 junior kernel: jffs2: read_super for device 1f:00
Apr 19 14:50:55 junior kernel: jffs2_scan_eraseblock(): Scanning block
at 0x0
Apr 19 14:50:55 junior kernel: jffs2_scan_dirent_node(): Node at
0x00000000
Apr 19 14:50:55 junior kernel: jffs2_get_ino_cache(): ino 1
Apr 19 14:50:55 junior kernel: jffs2_get_ino_cache found 00000000 for
ino 1
...
Apr 19 14:50:57 junior kernel: jffs2_scan_dirent_node(): Node at
0x000001cc
Apr 19 14:50:57 junior kernel: jffs2_get_ino_cache(): ino 1
Apr 19 14:50:57 junior kernel: jffs2_get_ino_cache found c53a0224 for
ino 1
Apr 19 14:50:57 junior kernel: jffs2_add_fd_to_list( cb891ec4, cbff46cc
(->cb2f0d5c))
Apr 19 14:50:57 junior kernel: Dirent "proc" (hash 0x01baa5b4, ino #6
Apr 19 14:50:57 junior kernel: Dirent "X11R6" (hash 0x0e52bf31, ino #2
Apr 19 14:50:57 junior kernel: Dirent "lost+found" (hash 0xfbd7df7b, ino #5
Apr 19 14:50:57 junior kernel: Read at 0x1f8 gave only 0x8 bytes
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x00000200: 0xfb1d instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x00000204: 0x0006 instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x00000208: 0x0001 instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x0000020c: 0x41ed instead
Apr 19 14:50:57 junior kernel: Empty bitmask at 0x00000210
Apr 19 14:50:57 junior kernel: Empty bitmask at 0x00000214
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x00000218: 0x6644 instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x0000021c: 0x6644 instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x00000220: 0x6644 instead
Apr 19 14:50:57 junior kernel: Empty bitmask at 0x00000224
Apr 19 14:50:58 junior kernel: Empty bitmask at 0x00000228
Apr 19 14:50:58 junior kernel: Empty bitmask at 0x0000022c
Apr 19 14:50:58 junior kernel: Empty bitmask at 0x00000230
Apr 19 14:50:58 junior kernel: Empty bitmask at 0x00000234
Apr 19 14:50:58 junior kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x00000238: 0xfd88 instead
Apr 19 14:50:58 junior kernel: jffs2_scan_dirent_node(): Node at 0x0000023c
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache(): ino 1
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache found c53a0224 for ino 1
Apr 19 14:50:58 junior kernel: jffs2_add_fd_to_list( cb891eec, cbff46cc
(->cb891ec4))
Apr 19 14:50:58 junior kernel: Dirent "etc" (hash 0x0024a603, ino #7
...
Apr 19 14:50:58 junior kernel: Allocated inocache at c53a02cc
Apr 19 14:50:58 junior kernel: jffs2_add_ino_cache: Add c53a02cc (ino #8)
Apr 19 14:50:59 junior kernel: Node is ino #8, version 1. Range 0x0-0x0
Apr 19 14:50:59 junior kernel: jffs2_scan_dirent_node(): Node at 0x00000320
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache(): ino 7
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache found c53a02b0 for ino 7
Apr 19 14:50:59 junior kernel: jffs2_add_fd_to_list( cb891e4c, cb891f8c
(->cb891f14))
Apr 19 14:50:59 junior kernel: Dirent "default" (hash 0x05edd908, ino #9
Apr 19 14:50:59 junior kernel: Dirent "config" (hash 0xbaaf08e8, ino #8
Apr 19 14:50:59 junior kernel: jffs2_scan_inode_node(): Node at 0x00000350
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache(): ino 9
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache found 00000000 for ino 9
Apr 19 14:50:59 junior kernel: Allocated inocache at c53a02e8
Apr 19 14:50:59 junior kernel: jffs2_add_ino_cache: Add c53a02e8 (ino #9)
Apr 19 14:50:59 junior kernel: Node is ino #9, version 1. Range 0x0-0x0
Apr 19 14:50:59 junior kernel: jffs2_scan_dirent_node(): Node at 0x00000394
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache(): ino 7
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache found c53a02b0 for ino 7
Apr 19 14:50:59 junior kernel: jffs2_add_fd_to_list( c2076a3c, cb891f8c
(->cb891e4c))
Apr 19 14:50:59 junior kernel: Dirent "default" (hash 0x05edd908, ino #9
Apr 19 14:50:59 junior kernel: Dirent "config" (hash 0xbaaf08e8, ino #8
Apr 19 14:50:59 junior kernel: Dirent "init.d" (hash 0xc49bb6f7, ino #10
Apr 19 14:50:59 junior kernel: jffs2_scan_inode_node(): Node at 0x000003c4
Apr 19 14:50:59 junior kernel: Short read: 0x3c bytes at 0x000003c4 instead
of requested 44
Apr 19 14:50:59 junior kernel: build_fs failed
Apr 19 14:50:59 junior kernel: jffs2_free_ino_caches: Freeing ino #1 at
c53a0224
Apr 19 14:50:59 junior kernel: Freeing inocache at c53a0224
...
Apr 19 14:51:00 junior kernel: jffs2_free_ino_caches: Freeing ino #9 at
c53a02e8
Apr 19 14:51:00 junior kernel: Freeing inocache at c53a02e8
Apr 19 14:51:00 junior kernel: mtdblock_release
Apr 19 14:51:00 junior kernel: ok
Apr 19 14:51:00 junior kernel: mtdblock_open
Apr 19 14:51:00 junior kernel: ok
Apr 19 14:51:00 junior kernel: mtdblock_release
Apr 19 14:51:00 junior kernel: ok


Thank you

Fred

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Frederick Lefebvre" <flefebvre@irg.ca>
Cc: "linux-mtd" <linux-mtd@lists.infradead.org>
Sent: Wednesday, April 24, 2002 6:15 PM
Subject: Re: build_fs failed


>
> flefebvre@irg.ca said:
> > What does a "build_fs failed" msg means when trying to mount a jffs2
> > filesystem?
>
> It means you have debugging enabled but you neglected to quote the
messages
> _before_ 'build_fs failed' which might have indicated _why_ it failed :)
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
