Received: from [209.71.224.24] (helo=mail.webnet.qc.ca)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ydWq-0007QX-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2002 19:54:40 +0100
Subject: jffs2 on a DiskOnChip 2000
From: Frederick Lefebvre <flefebvre@irg.ca>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 19 Apr 2002 14:57:45 -0400
Message-Id: <1019242665.1363.8.camel@zeus>
Mime-Version: 1.0
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

I wa able to create a jffs2 image using the utilities and I copied it to
/dev/mtd0.  Copying back /dev/mtd0 to a file and reading it with
jffs2reader returns the extected results. But I was not able to mount
/dev/mtdblock0.  

"mount -t jffs2 /dev/mtdblock0 /mnt"  returned :
mount: wrong fs type, bad option, bad superblock on /dev/mtdblock0,
	or too many mounted file systems

And here are the logs from the kernel. Anybody has an idea of what if
going on :

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
Apr 19 14:50:55 junior kernel: Allocated inocache at c53a0224
Apr 19 14:50:55 junior kernel: jffs2_add_ino_cache: Add c53a0224 (ino
#1)
Apr 19 14:50:55 junior kernel: jffs2_add_fd_to_list( cb2f0d5c, cbff46cc
(->00000000))
Apr 19 14:50:55 junior kernel: Dirent "X11R6" (hash 0x0e52bf31, ino #2
Apr 19 14:50:55 junior kernel: jffs2_scan_inode_node(): Node at
0x00000030
Apr 19 14:50:55 junior kernel: jffs2_get_ino_cache(): ino 2
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache found 00000000 for
ino 2
Apr 19 14:50:56 junior kernel: Allocated inocache at c53a0240
Apr 19 14:50:56 junior kernel: jffs2_add_ino_cache: Add c53a0240 (ino
#2)
Apr 19 14:50:56 junior kernel: Node is ino #2, version 1. Range 0x0-0x0
Apr 19 14:50:56 junior kernel: jffs2_scan_dirent_node(): Node at
0x00000074
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache(): ino 2
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache found c53a0240 for
ino 2
Apr 19 14:50:56 junior kernel: jffs2_add_fd_to_list( cbff4fb4, cbff4564
(->00000000))
Apr 19 14:50:56 junior kernel: Dirent "bin" (hash 0x0023605a, ino #3
Apr 19 14:50:56 junior kernel: jffs2_scan_inode_node(): Node at
0x000000a0
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache(): ino 3
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache found 00000000 for
ino 3
Apr 19 14:50:56 junior kernel: Allocated inocache at c53a025c
Apr 19 14:50:56 junior kernel: jffs2_add_ino_cache: Add c53a025c (ino
#3)
Apr 19 14:50:56 junior kernel: Node is ino #3, version 1. Range 0x0-0x0
Apr 19 14:50:56 junior kernel: jffs2_scan_dirent_node(): Node at
0x000000e4
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache(): ino 2
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache found c53a0240 for
ino 2
Apr 19 14:50:56 junior kernel: jffs2_add_fd_to_list( cbff4f8c, cbff4564
(->cbff4fb4))
Apr 19 14:50:56 junior kernel: Dirent "bin" (hash 0x0023605a, ino #3
Apr 19 14:50:56 junior kernel: Dirent "lib" (hash 0x002697fa, ino #4
Apr 19 14:50:56 junior kernel: jffs2_scan_inode_node(): Node at
0x00000110
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache(): ino 4
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache found 00000000 for
ino 4
Apr 19 14:50:56 junior kernel: Allocated inocache at c53a0278
Apr 19 14:50:56 junior kernel: jffs2_add_ino_cache: Add c53a0278 (ino
#4)
Apr 19 14:50:56 junior kernel: Node is ino #4, version 1. Range 0x0-0x0
Apr 19 14:50:56 junior kernel: jffs2_scan_dirent_node(): Node at
0x00000154
Apr 19 14:50:56 junior kernel: jffs2_get_ino_cache(): ino 1
Apr 19 14:50:57 junior kernel: jffs2_get_ino_cache found c53a0224 for
ino 1
Apr 19 14:50:57 junior kernel: jffs2_add_fd_to_list( cb8774ac, cbff46cc
(->cb2f0d5c))
Apr 19 14:50:57 junior kernel: Dirent "X11R6" (hash 0x0e52bf31, ino #2
Apr 19 14:50:57 junior kernel: Dirent "lost+found" (hash 0xfbd7df7b, ino
#5
Apr 19 14:50:57 junior kernel: jffs2_scan_inode_node(): Node at
0x00000188
Apr 19 14:50:57 junior kernel: jffs2_get_ino_cache(): ino 5
Apr 19 14:50:57 junior kernel: jffs2_get_ino_cache found 00000000 for
ino 5
Apr 19 14:50:57 junior kernel: Allocated inocache at c53a0294
Apr 19 14:50:57 junior kernel: jffs2_add_ino_cache: Add c53a0294 (ino
#5)
Apr 19 14:50:57 junior kernel: Node is ino #5, version 1. Range 0x0-0x0
Apr 19 14:50:57 junior kernel: jffs2_scan_dirent_node(): Node at
0x000001cc
Apr 19 14:50:57 junior kernel: jffs2_get_ino_cache(): ino 1
Apr 19 14:50:57 junior kernel: jffs2_get_ino_cache found c53a0224 for
ino 1
Apr 19 14:50:57 junior kernel: jffs2_add_fd_to_list( cb891ec4, cbff46cc
(->cb2f0d5c))
Apr 19 14:50:57 junior kernel: Dirent "proc" (hash 0x01baa5b4, ino #6
Apr 19 14:50:57 junior kernel: Dirent "X11R6" (hash 0x0e52bf31, ino #2
Apr 19 14:50:57 junior kernel: Dirent "lost+found" (hash 0xfbd7df7b, ino
#5
Apr 19 14:50:57 junior kernel: Read at 0x1f8 gave only 0x8 bytes
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask
0x1985 not found at 0x00000200: 0xfb1d instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask
0x1985 not found at 0x00000204: 0x0006 instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask
0x1985 not found at 0x00000208: 0x0001 instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask
0x1985 not found at 0x0000020c: 0x41ed instead
Apr 19 14:50:57 junior kernel: Empty bitmask at 0x00000210
Apr 19 14:50:57 junior kernel: Empty bitmask at 0x00000214
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask
0x1985 not found at 0x00000218: 0x6644 instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask
0x1985 not found at 0x0000021c: 0x6644 instead
Apr 19 14:50:57 junior kernel: jffs2_scan_eraseblock(): Magic bitmask
0x1985 not found at 0x00000220: 0x6644 instead
Apr 19 14:50:57 junior kernel: Empty bitmask at 0x00000224
Apr 19 14:50:58 junior kernel: Empty bitmask at 0x00000228
Apr 19 14:50:58 junior kernel: Empty bitmask at 0x0000022c
Apr 19 14:50:58 junior kernel: Empty bitmask at 0x00000230
Apr 19 14:50:58 junior kernel: Empty bitmask at 0x00000234
Apr 19 14:50:58 junior kernel: jffs2_scan_eraseblock(): Magic bitmask
0x1985 not found at 0x00000238: 0xfd88 instead
Apr 19 14:50:58 junior kernel: jffs2_scan_dirent_node(): Node at
0x0000023c
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache(): ino 1
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache found c53a0224 for
ino 1
Apr 19 14:50:58 junior kernel: jffs2_add_fd_to_list( cb891eec, cbff46cc
(->cb891ec4))
Apr 19 14:50:58 junior kernel: Dirent "etc" (hash 0x0024a603, ino #7
Apr 19 14:50:58 junior kernel: Dirent "proc" (hash 0x01baa5b4, ino #6
Apr 19 14:50:58 junior kernel: Dirent "X11R6" (hash 0x0e52bf31, ino #2
Apr 19 14:50:58 junior kernel: Dirent "lost+found" (hash 0xfbd7df7b, ino
#5
Apr 19 14:50:58 junior kernel: jffs2_scan_inode_node(): Node at
0x00000268
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache(): ino 7
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache found 00000000 for
ino 7
Apr 19 14:50:58 junior kernel: Allocated inocache at c53a02b0
Apr 19 14:50:58 junior kernel: jffs2_add_ino_cache: Add c53a02b0 (ino
#7)
Apr 19 14:50:58 junior kernel: Node is ino #7, version 1. Range 0x0-0x0
Apr 19 14:50:58 junior kernel: jffs2_scan_dirent_node(): Node at
0x000002ac
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache(): ino 7
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache found c53a02b0 for
ino 7
Apr 19 14:50:58 junior kernel: jffs2_add_fd_to_list( cb891f14, cb891f8c
(->00000000))
Apr 19 14:50:58 junior kernel: Dirent "config" (hash 0xbaaf08e8, ino #8
Apr 19 14:50:58 junior kernel: jffs2_scan_inode_node(): Node at
0x000002dc
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache(): ino 8
Apr 19 14:50:58 junior kernel: jffs2_get_ino_cache found 00000000 for
ino 8
Apr 19 14:50:58 junior kernel: Allocated inocache at c53a02cc
Apr 19 14:50:58 junior kernel: jffs2_add_ino_cache: Add c53a02cc (ino
#8)
Apr 19 14:50:59 junior kernel: Node is ino #8, version 1. Range 0x0-0x0
Apr 19 14:50:59 junior kernel: jffs2_scan_dirent_node(): Node at
0x00000320
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache(): ino 7
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache found c53a02b0 for
ino 7
Apr 19 14:50:59 junior kernel: jffs2_add_fd_to_list( cb891e4c, cb891f8c
(->cb891f14))
Apr 19 14:50:59 junior kernel: Dirent "default" (hash 0x05edd908, ino #9
Apr 19 14:50:59 junior kernel: Dirent "config" (hash 0xbaaf08e8, ino #8
Apr 19 14:50:59 junior kernel: jffs2_scan_inode_node(): Node at
0x00000350
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache(): ino 9
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache found 00000000 for
ino 9
Apr 19 14:50:59 junior kernel: Allocated inocache at c53a02e8
Apr 19 14:50:59 junior kernel: jffs2_add_ino_cache: Add c53a02e8 (ino
#9)
Apr 19 14:50:59 junior kernel: Node is ino #9, version 1. Range 0x0-0x0
Apr 19 14:50:59 junior kernel: jffs2_scan_dirent_node(): Node at
0x00000394
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache(): ino 7
Apr 19 14:50:59 junior kernel: jffs2_get_ino_cache found c53a02b0 for
ino 7
Apr 19 14:50:59 junior kernel: jffs2_add_fd_to_list( c2076a3c, cb891f8c
(->cb891e4c))
Apr 19 14:50:59 junior kernel: Dirent "default" (hash 0x05edd908, ino #9
Apr 19 14:50:59 junior kernel: Dirent "config" (hash 0xbaaf08e8, ino #8
Apr 19 14:50:59 junior kernel: Dirent "init.d" (hash 0xc49bb6f7, ino #10
Apr 19 14:50:59 junior kernel: jffs2_scan_inode_node(): Node at
0x000003c4
Apr 19 14:50:59 junior kernel: Short read: 0x3c bytes at 0x000003c4
instead of requested 44
Apr 19 14:50:59 junior kernel: build_fs failed
Apr 19 14:50:59 junior kernel: jffs2_free_ino_caches: Freeing ino #1 at
c53a0224
Apr 19 14:50:59 junior kernel: Freeing inocache at c53a0224
Apr 19 14:50:59 junior kernel: jffs2_free_ino_caches: Freeing ino #2 at
c53a0240
Apr 19 14:50:59 junior kernel: Freeing inocache at c53a0240
Apr 19 14:50:59 junior kernel: jffs2_free_ino_caches: Freeing ino #3 at
c53a025c
Apr 19 14:50:59 junior kernel: Freeing inocache at c53a025c
Apr 19 14:51:00 junior kernel: jffs2_free_ino_caches: Freeing ino #4 at
c53a0278
Apr 19 14:51:00 junior kernel: Freeing inocache at c53a0278
Apr 19 14:51:00 junior kernel: jffs2_free_ino_caches: Freeing ino #5 at
c53a0294
Apr 19 14:51:00 junior kernel: Freeing inocache at c53a0294
Apr 19 14:51:00 junior kernel: jffs2_free_ino_caches: Freeing ino #7 at
c53a02b0
Apr 19 14:51:00 junior kernel: Freeing inocache at c53a02b0
Apr 19 14:51:00 junior kernel: jffs2_free_ino_caches: Freeing ino #8 at
c53a02cc
Apr 19 14:51:00 junior kernel: Freeing inocache at c53a02cc
Apr 19 14:51:00 junior kernel: jffs2_free_ino_caches: Freeing ino #9 at
c53a02e8
Apr 19 14:51:00 junior kernel: Freeing inocache at c53a02e8
Apr 19 14:51:00 junior kernel: mtdblock_release
Apr 19 14:51:00 junior kernel: ok
Apr 19 14:51:00 junior kernel: mtdblock_open
Apr 19 14:51:00 junior kernel: ok
Apr 19 14:51:00 junior kernel: mtdblock_release
Apr 19 14:51:00 junior kernel: ok

Thank's

-- 
Frederick Lefebvre
flefebvre@irg.ca
Software Developer,
(418)523-4474 #242
Infomedia Research Group (IRG)
Quebec, Canada
