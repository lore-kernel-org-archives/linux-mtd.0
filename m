Received: from law14-oe18.law14.hotmail.com ([64.4.20.122] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19cmI0-0004wY-Qz
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2003 14:25:49 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Wed, 16 Jul 2003 18:59:12 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE1840m3DwZpu000076e5@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: thread_should_wake() in background.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,

When I mount jffs2 partition

the system simply stops responding
after givinng the message


JFFS2: Garbage collect thread is pid 1792
thread_should_wake(): nr_free_blocks 1, nr_erasing_blocks 15, dirty_size 0x0
jffs2_garbage_collect_thread sleeping...
thread_should_wake(): nr_free_blocks 1, nr_erasing_blocks 15, dirty_size 0x0


thread_should_wake() is in fs/jffs2/background.c

Any ideas Y is this so

with kind regards
Vikram



# mount -t jffs2 /devmtdblock2 /mnt                 
                        /mtdblock2 /mnt
mtdblock_open
ok
jffs2: read_super for device 1f:02
jffs2_scan_eraseblock(): Scanning block at 0x0
Empty flash detected from 0x00000000 to 0x00010000
Block at 0x00000000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x10000
Found empty flash at 0x1000c
Empty flash detected from 0x0001000c to 0x00020000
Block at 0x00010000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x20000
Empty flash detected from 0x00020000 to 0x00030000
Block at 0x00020000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x30000
Empty flash detected from 0x00030000 to 0x00040000
Block at 0x00030000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x40000
Empty flash detected from 0x00040000 to 0x00050000
Block at 0x00040000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x50000
Empty flash detected from 0x00050000 to 0x00060000
Block at 0x00050000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x60000
Empty flash detected from 0x00060000 to 0x00070000
Block at 0x00060000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x70000
Empty flash detected from 0x00070000 to 0x00080000
Block at 0x00070000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x80000
Empty flash detected from 0x00080000 to 0x00090000
Block at 0x00080000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x90000
Empty flash detected from 0x00090000 to 0x000a0000
Block at 0x00090000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0xa0000
Empty flash detected from 0x000a0000 to 0x000b0000
Block at 0x000a0000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0xb0000
Empty flash detected from 0x000b0000 to 0x000c0000
Block at 0x000b0000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0xc0000
Empty flash detected from 0x000c0000 to 0x000d0000
Block at 0x000c0000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0xd0000
Empty flash detected from 0x000d0000 to 0x000e0000
Block at 0x000d0000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0xe0000
Empty flash detected from 0x000e0000 to 0x000f0000
Block at 0x000e0000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0xf0000
Empty flash detected from 0x000f0000 to 0x00100000
Block at 0x000f0000 is empty (erased)
Scanned flash completely
Pass 1 complete
Pass 2 (re)starting
Pass 2 complete
Pass 3 complete
jffs2_read_super(): Getting root inode
jffs2_read_inode(): inode->i_ino == 1
getting inocache
jffs2_get_ino_cache(): ino 1
jffs2_get_ino_cache found 00000000 for ino 1
jffs2_read_inode(): Got inocache at 00000000
Allocated inocache at 004b92c0
jffs2_read_inode(): Creating inocache for root inode
jffs2_add_ino_cache: Add 004b92c0 (ino #1)
jffs2_read_inode(): ino #1 nlink is 1
jffs2_get_inode_nodes(): ino #1
jffs2_read_inode() returning
jffs2_read_super(): d_alloc_root()
JFFS2: Garbage collect thread is pid 1792
thread_should_wake(): nr_free_blocks 1, nr_erasing_blocks 15, dirty_size 0x0
jffs2_garbage_collect_thread sleeping...
thread_should_wake(): nr_free_blocks 1, nr_erasing_blocks 15, dirty_size 0x0
