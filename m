Received: from [194.51.134.17] (helo=www.anfora.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16yVya-0006yt-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2002 11:50:48 +0100
Date: Fri, 19 Apr 2002 12:49:48 +0200
From: Gagneraud Christian <cgagneraud@anfora.fr>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problems when remounting jffs2
Message-Id: <20020419124948.5938ee48.cgagneraud@anfora.fr>
In-Reply-To: <2713.1019031947@redhat.com>
References: <20020416163230.27f26996.cgagneraud@anfora.fr>
	<2713.1019031947@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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

On Wed, 17 Apr 2002 09:25:47 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> 
> cgagneraud@anfora.fr said:
> > jffs2_scan_eraseblock(): Node at 0x00240000 {0x1985, 0x2003,
> > 0x0000000c) has invalid CRC 0x000000)JFFS2: Erase block at 0x00240000
> > is not formatted. It will be erased
> 
> It does this on the second and _every_ subsequent mount? Can you reproduce 
> it with fewer actual files on the file system and CONFIG_JFFS2_FS_DEBUG=1, 
> and send me all the output?
Yes the first time is always OK, but not for every subsequent.
here's some log after erasing and copying the /dev/mtd1 
I create the jffs2 image with:
[cgagneraud@christian ppc]$ mkfs.jffs2 -p0x700000 -r edu-tmp -e0x40000 -oedu-tmp.jffs2 -b

-8<---------------------------------------------------------------
root@edu:~# mtd_debug info /dev/mtd1
MTD_open
MTD_ioctl
MTD_ioctl
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 7340032 (7M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0 
mtd.oobsize = 0 
mtd.ecctype = MTD_ECC_NONE
regions = 0

MTD_close
root@edu:~# mtd_debug info /dev/mtd0
MTD_open
MTD_ioctl
MTD_ioctl
MTD_ioctl
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 8388608 (8M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0 
mtd.oobsize = 0 
mtd.ecctype = MTD_ECC_NONE
regions = 1

region[0].offset = 0x00000000
region[0].erasesize = 262144 (256K)
region[0].numblocks = 32
region[0].regionindex = 0
MTD_close
root@edu:~# mtd_debug info /dev/mtd1
MTD_open
MTD_ioctl
MTD_ioctl
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 7340032 (7M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0 
mtd.oobsize = 0 
mtd.ecctype = MTD_ECC_NONE
regions = 0

MTD_close
root@edu:~# mtd_debug info /dev/mtd2
MTD_open
MTD_ioctl
MTD_ioctl
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 262144 (256K)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0 
mtd.oobsize = 0 
mtd.ecctype = MTD_ECC_NONE
regions = 0

MTD_close
root@edu:~# mtd_debug info /dev/mtd3
MTD_open
MTD_ioctl
MTD_ioctl
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 262144 (256K)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0 
mtd.oobsize = 0 
mtd.ecctype = MTD_ECC_NONE
regions = 0

MTD_close
root@edu:~# mtd_debug info /dev/mtd4
MTD_open
MTD_ioctl
MTD_ioctl
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 524288 (512K)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0 
mtd.oobsize = 0 
mtd.ecctype = MTD_ECC_NONE
regions = 0

MTD_close
root@edu:~# mount -t jffs2 /dev/mtdblock1 /mnt/flash0
mtdblock_open
ok
root@edu:~# ls -al /mnt/flash0
total 27
drwxr-xr-x    3 root     root            0 Jan  1 00:00 .
drwxrwxrwx    4 root     users        4096 Apr 12  2002 ..
-rw-r--r--    1 root     root         1182 Apr 19  2002 completion.h
-rw-r--r--    1 root     root        10557 Apr 19  2002 edu-rootmtd.config
-rw-r--r--    1 root     root        10546 Apr 19  2002 edu-rootnfs.config
root@edu:~# umount /mnt/flash0
mtdblock_release
ok
root@edu:~# mount -t jffs2 /dev/mtdblock1 /mnt/flash0
mtdblock_open
ok
jffs2_scan_eraseblock(): Node at 0x00040000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00040000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00080000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00080000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x000c0000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00100000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00100000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00140000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00140000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00180000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00180000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x001c0000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x001c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00200000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00200000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00240000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00240000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00280000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00280000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x002c0000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x002c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00300000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00300000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00340000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00340000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00380000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00380000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x003c0000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x003c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00400000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00400000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00440000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00440000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00480000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00480000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x004c0000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x004c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00500000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00500000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00540000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00540000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00580000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00580000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x005c0000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x005c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00600000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00600000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00640000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00640000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00680000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x00680000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x006c0000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculate)JFFS2: Erase block at 0x006c0000 is not formatted. It will be erased
root@edu:~# ls -al /mnt/flash0
total 27
drwxr-xr-x    3 root     root            0 Jan  1 00:00 .
drwxrwxrwx    4 root     users        4096 Apr 12  2002 ..
-rw-r--r--    1 root     root         1182 Apr 19  2002 completion.h
-rw-r--r--    1 root     root        10557 Apr 19  2002 edu-rootmtd.config
-rw-r--r--    1 root     root        10546 Apr 19  2002 edu-rootnfs.config
root@edu:~# cat /proc/kmsg 
(): Node at 0x00680000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calculated 0xf060dc98)
<7>Empty bitmask at 0x00680004
<7>Empty bitmask at 0x00680008
<7>Found empty flash at 0x68000c
<7>Empty flash detected from 0x0068000c to 0x006c0000
<7>Block at 0x00680000: free 0x0003fff4, dirty 0x0000000c, used 0x00000000
<5>JFFS2: Erase block at 0x00680000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6c0000
<5>jffs2_scan_eraseblock(): Node at 0x006c0000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x00000000 (calcul)<7>Empty bitmask at 0x006c0004
<7>Empty bitmask at 0x006c0008
<7>Found empty flash at 0x6c000c
<7>Empty flash detected from 0x006c000c to 0x00700000
<7>Block at 0x006c0000: free 0x0003fff4, dirty 0x0000000c, used 0x00000000
<5>JFFS2: Erase block at 0x006c0000 is not formatted. It will be erased
<7>Scanned flash completely
<7>Pass 1: ino #1
<7>jffs2_build_inode building inode #1
<7>jffs2_get_ino_cache(): ino 2
<7>jffs2_get_ino_cache found c04712e8 for ino 2
<7>Increased nlink for child "completion.h" (ino #2)
<7>jffs2_get_ino_cache(): ino 3
<7>jffs2_get_ino_cache found c04712d4 for ino 3
<7>Increased nlink for child "edu-rootmtd.config" (ino #3)
<7>jffs2_get_ino_cache(): ino 4
<7>jffs2_get_ino_cache found c04712c0 for ino 4
<7>Increased nlink for child "edu-rootnfs.config" (ino #4)
<7>Pass 1: ino #2
<7>jffs2_build_inode building inode #2
<7>adding node 0000-049e @0x00000034 on flash, newfrag *c046e338
<7>jffs2_build_inode_pass1 truncating fraglist to 0x0000049e
<7>Truncating fraglist to 0x0000049e bytes
<7>Pass 1: ino #3
<7>jffs2_build_inode building inode #3
<7>adding node 0000-1000 @0x00000350 on flash, newfrag *c046e338
<7>adding node 1000-2000 @0x00000898 on flash, newfrag *c046e324
<7>j_a_f_d_t_f: skipping frag 0x0000-0x1000; phys 0x00000350 (*c046e338->00000000)
<7>adding node 2000-293d @0x00000d80 on flash, newfrag *c046e310
<7>j_a_f_d_t_f: skipping frag 0x0000-0x1000; phys 0x00000350 (*c046e338->c046e324)
<7>j_a_f_d_t_f: skipping frag 0x1000-0x2000; phys 0x00000898 (*c046e324->00000000)
<7>jffs2_build_inode_pass1 truncating fraglist to 0x0000293d
<7>Truncating fraglist to 0x0000293d bytes
<7>Pass 1: ino #4
<7>jffs2_build_inode building inode #4
<7>adding node 0000-1000 @0x00001088 on flash, newfrag *c046e310
<7>adding node 1000-2000 @0x000015d0 on flash, newfrag *c046e324
<7>j_a_f_d_t_f: skipping frag 0x0000-0x1000; phys 0x00001088 (*c046e310->00000000)
<7>adding node 2000-2932 @0x00001ab8 on flash, newfrag *c046e338
<7>j_a_f_d_t_f: skipping frag 0x0000-0x1000; phys 0x00001088 (*c046e310->c046e324)
<7>j_a_f_d_t_f: skipping frag 0x1000-0x2000; phys 0x000015d0 (*c046e324->00000000)
<7>jffs2_build_inode_pass1 truncating fraglist to 0x00002932
<7>Truncating fraglist to 0x00002932 bytes
<7>Pass 1 complete
<7>Pass 2 (re)starting
<7>Pass 2: ino #1, nlink 1, ic c04712fc, nodes c04724e0
<7>Pass 2: ino #2, nlink 1, ic c04712e8, nodes c0472490
<7>Pass 2: ino #3, nlink 1, ic c04712d4, nodes c04724d0
<7>Pass 2: ino #4, nlink 1, ic c04712c0, nodes c0472510
<7>Pass 2 complete
<7>Pass 3: ino #1, ic c04712fc, nodes c04724e0
<7>Pass 3: ino #2, ic c04712e8, nodes c0472490
<7>Pass 3: ino #3, ic c04712d4, nodes c04724d0
<7>Pass 3: ino #4, ic c04712c0, nodes c0472510
<7>Pass 3 complete
<7>Not rotating empty clean_list
<7>Not rotating empty dirty_list
<7>Not rotating empty erasable_list
<7>Rotating erase_pending_list by 5
<7>Erase block at front of erase_pending_list is at 00540000
<7>Not rotating empty free_list
<7>jffs2_do_fill_super(): Getting root inode
<7>jffs2_read_inode(): inode->i_ino == 1
<7>jffs2_do_read_inode(): getting inocache
<7>jffs2_get_ino_cache(): ino 1
<7>jffs2_get_ino_cache found c04712fc for ino 1
<7>jffs2_do_read_inode(): Got inocache at c04712fc
<7>jffs2_do_read_inode(): ino #1 nlink is 1
<7>jffs2_get_inode_nodes(): ino #1
<7>Node at 0000104c is a dirent node
<7>Adding fd "edu-rootnfs.config", ino #4
<7>jffs2_add_fd_to_list( c01f4660, c0c23bdc (->00000000))
<7>Dirent "edu-rootnfs.config" (hash 0xaebb1b5e, ino #4
<7>Node at 00000314 is a dirent node
<7>Adding fd "edu-rootmtd.config", ino #3
<7>jffs2_add_fd_to_list( c01f46a0, c0c23bdc (->c01f4660))
<7>Dirent "edu-rootmtd.config" (hash 0x8e367a48, ino #3
<7>Dirent "edu-rootnfs.config" (hash 0xaebb1b5e, ino #4
<7>Node at 00000000 is a dirent node
<7>Adding fd "completion.h", ino #2
<7>jffs2_add_fd_to_list( c01f46e0, c0c23bdc (->c01f46a0))
<7>Dirent "completion.h" (hash 0x29557120, ino #2
<7>Dirent "edu-rootmtd.config" (hash 0x8e367a48, ino #3
<7>Dirent "edu-rootnfs.config" (hash 0xaebb1b5e, ino #4
<7>jffs2_read_inode() returning
<7>jffs2_do_fill_super(): d_alloc_root()
<7>JFFS2: Garbage collect thread is pid 26
<7>thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 27, dirty_size 0x144
<7>jffs2_garbage_collect_thread sleeping...
<7>jffs2_write_super(): flush_wbuf before gc-trigger
<7>thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 27, dirty_size 0x144
<7>Starting erase of pending block 0x00540000
<7>Freeing all node refs for eraseblock offset 0x00540000
<7>Erase completed successfully at 0x00540000
<7>Starting erase of pending block 0x00500000
<7>Freeing all node refs for eraseblock offset 0x00500000
<7>Erase completed successfully at 0x00500000
<7>Starting erase of pending block 0x004c0000
<7>Freeing all node refs for eraseblock offset 0x004c0000
<7>Erase completed successfully at 0x004c0000
<7>Starting erase of pending block 0x00480000
<7>Freeing all node refs for eraseblock offset 0x00480000
<7>Erase completed successfully at 0x00480000
<7>Starting erase of pending block 0x00440000
<7>Freeing all node refs for eraseblock offset 0x00440000
<7>Erase completed successfully at 0x00440000
<7>Starting erase of pending block 0x00400000
<7>Freeing all node refs for eraseblock offset 0x00400000
<7>Erase completed successfully at 0x00400000
<7>Starting erase of pending block 0x003c0000
<7>Freeing all node refs for eraseblock offset 0x003c0000
<7>Erase completed successfully at 0x003c0000
<7>Starting erase of pending block 0x00380000
<7>Freeing all node refs for eraseblock offset 0x00380000
<7>Erase completed successfully at 0x00380000
<7>Starting erase of pending block 0x00340000
<7>Freeing all node refs for eraseblock offset 0x00340000
<7>Erase completed successfully at 0x00340000
<7>Starting erase of pending block 0x00300000
<7>Freeing all node refs for eraseblock offset 0x00300000
<7>Erase completed successfully at 0x00300000
<7>Starting erase of pending block 0x002c0000
<7>Freeing all node refs for eraseblock offset 0x002c0000
<7>Erase completed successfully at 0x002c0000
<7>Starting erase of pending block 0x00280000
<7>Freeing all node refs for eraseblock offset 0x00280000
<7>jffs2_readdir() for dir_i #1
<7>Dirent 0: ".", ino #1
<7>Dirent 1: "..", ino #1
<7>Dirent 2: "completion.h", ino #2, type 8
<7>Dirent 3: "edu-rootmtd.config", ino #3, type 8
<7>Dirent 4: "edu-rootnfs.config", ino #4, type 8
<7>jffs2_lookup()
<7>jffs2_read_inode(): inode->i_ino == 2
<7>jffs2_do_read_inode(): getting inocache
<7>jffs2_get_ino_cache(): ino 2
<7>jffs2_get_ino_cache found c04712e8 for ino 2
<7>jffs2_do_read_inode(): Got inocache at c04712e8
<7>jffs2_do_read_inode(): ino #2 nlink is 1
<7>jffs2_get_inode_nodes(): ino #2
<7>Node at 00000034 is a data node
<7>version 1, highest_version now 1
<7>dnode @00000034: ver 1, offset 0000, dsize 049e
<7>jffs2_add_full_dnode_to_inode(ino #2, f c04b3ea8, fn c046f3a0)
<7>adding node 0000-049e @0x00000034 on flash, newfrag *c046e338
<7>frag 0000-049e: 0x00000034 on flash (*c046e338->00000000)
<7>Truncating fraglist to 0x0000049e bytes
<7>jffs2_read_inode() returning
<7>jffs2_lookup()
<7>jffs2_read_inode(): inode->i_ino == 3
<7>jffs2_do_read_inode(): getting inocache
<7>jffs2_get_ino_cache(): ino 3
<7>jffs2_get_ino_cache found c04712d4 for ino 3
<7>jffs2_do_read_inode(): Got inocache at c04712d4
<7>jffs2_do_read_inode(): ino #3 nlink is 1
<7>jffs2_get_inode_nodes(): ino #3
<7>Node at 00000d80 is a data node
<7>version 3, highest_version now 3
<7>dnode @00000d80: ver 3, offset 2000, dsize 093d
<7>Node at 00000898 is a data node
<7>version 2, highest_version now 3
<7>dnode @00000898: ver 2, offset 1000, dsize 1000
<7>Node at 00000350 is a data node
<7>version 1, highest_version now 3
<7>dnode @00000350: ver 1, offset 0000, dsize 1000
<7>jffs2_add_full_dnode_to_inode(ino #3, f c04b3cc8, fn c046f390)
<7>adding node 0000-1000 @0x00000350 on flash, newfrag *c046e324
<7>frag 0000-1000: 0x00000350 on flash (*c046e324->00000000)
<7>jffs2_add_full_dnode_to_inode(ino #3, f c04b3cc8, fn c046f380)
<7>adding node 1000-2000 @0x00000898 on flash, newfrag *c046e310
<7>j_a_f_d_t_f: skipping frag 0x0000-0x1000; phys 0x00000350 (*c046e324->00000000)
<7>frag 0000-1000: 0x00000350 on flash (*c046e324->c046e310)
<7>frag 1000-2000: 0x00000898 on flash (*c046e310->00000000)
<7>jffs2_add_full_dnode_to_inode(ino #3, f c04b3cc8, fn c046f370)
<7>adding node 2000-293d @0x00000d80 on flash, newfrag *c046e2fc
<7>j_a_f_d_t_f: skipping frag 0x0000-0x1000; phys 0x00000350 (*c046e324->c046e310)
<7>j_a_f_d_t_f: skipping frag 0x1000-0x2000; phys 0x00000898 (*c046e310->00000000)
<7>frag 0000-1000: 0x00000350 on flash (*c046e324->c046e310)
<7>frag 1000-2000: 0x00000898 on flash (*c046e310->c046e2fc)
<7>frag 2000-293d: 0x00000d80 on flash (*c046e2fc->00000000)
<7>Truncating fraglist to 0x0000293d bytes
<7>jffs2_read_inode() returning
<7>jffs2_lookup()
<7>jffs2_read_inode(): inode->i_ino == 4
<7>jffs2_do_read_inode(): getting inocache
<7>jffs2_get_ino_cache(): ino 4
<7>jffs2_get_ino_cache found c04712c0 for ino 4
<7>jffs2_do_read_inode(): Got inocache at c04712c0
<7>jffs2_do_read_inode(): ino #4 nlink is 1
<7>jffs2_get_inode_nodes(): ino #4
<7>Node at 00001ab8 is a data node
<7>version 3, highest_version now 3
<7>dnode @00001ab8: ver 3, offset 2000, dsize 0932
<7>Node at 000015d0 is a data node
<7>version 2, highest_version now 3
<7>dnode @000015d0: ver 2, offset 1000, dsize 1000
<7>Node at 00001088 is a data node
<7>version 1, highest_version now 3
<7>dnode @00001088: ver 1, offset 0000, dsize 1000
<7>jffs2_add_full_dnode_to_inode(ino #4, f c04321a8, fn c046f360)
<7>adding node 0000-1000 @0x00001088 on flash, newfrag *c046e2e8
<7>frag 0000-1000: 0x00001088 on flash (*c046e2e8->00000000)
<7>jffs2_add_full_dnode_to_inode(ino #4, f c04321a8, fn c046f350)
<7>adding node 1000-2000 @0x000015d0 on flash, newfrag *c046e2d4
<7>j_a_f_d_t_f: skipping frag 0x0000-0x1000; phys 0x00001088 (*c046e2e8->00000000)
<7>frag 0000-1000: 0x00001088 on flash (*c046e2e8->c046e2d4)
<7>frag 1000-2000: 0x000015d0 on flash (*c046e2d4->00000000)
<7>jffs2_add_full_dnode_to_inode(ino #4, f c04321a8, fn c046f340)
<7>adding node 2000-2932 @0x00001ab8 on flash, newfrag *c046e2c0
<7>j_a_f_d_t_f: skipping frag 0x0000-0x1000; phys 0x00001088 (*c046e2e8->c046e2d4)
<7>j_a_f_d_t_f: skipping frag 0x1000-0x2000; phys 0x000015d0 (*c046e2d4->00000000)
<7>frag 0000-1000: 0x00001088 on flash (*c046e2e8->c046e2d4)
<7>frag 1000-2000: 0x000015d0 on flash (*c046e2d4->c046e2c0)
<7>frag 2000-2932: 0x00001ab8 on flash (*c046e2c0->00000000)
<7>Truncating fraglist to 0x00002932 bytes
<7>jffs2_read_inode() returning
<7>jffs2_readdir() for dir_i #1
<7>Skipping dirent: "completion.h", ino #2, type 8, because curofs 2 < offset 5
<7>Skipping dirent: "edu-rootmtd.config", ino #3, type 8, because curofs 3 < offset 5
<7>Skipping dirent: "edu-rootnfs.config", ino #4, type 8, because curofs 4 < offset 5
<7>Erase completed successfully at 0x00280000
<7>Starting erase of pending block 0x00240000
<7>Freeing all node refs for eraseblock offset 0x00240000
<7>Erase completed successfully at 0x00240000
<7>Starting erase of pending block 0x00200000
<7>Freeing all node refs for eraseblock offset 0x00200000
<7>Erase completed successfully at 0x00200000
<7>Starting erase of pending block 0x001c0000
<7>Freeing all node refs for eraseblock offset 0x001c0000
<7>Erase completed successfully at 0x001c0000
<7>Starting erase of pending block 0x00180000
<7>Freeing all node refs for eraseblock offset 0x00180000
<7>Erase completed successfully at 0x00180000
<7>Starting erase of pending block 0x00140000
<7>Freeing all node refs for eraseblock offset 0x00140000
<7>Erase completed successfully at 0x00140000
<7>Starting erase of pending block 0x00100000
<7>Freeing all node refs for eraseblock offset 0x00100000
<7>Erase completed successfully at 0x00100000
<7>Starting erase of pending block 0x000c0000
<7>Freeing all node refs for eraseblock offset 0x000c0000
<7>Erase completed successfully at 0x000c0000
<7>Starting erase of pending block 0x00080000
<7>Freeing all node refs for eraseblock offset 0x00080000
<7>Erase completed successfully at 0x00080000
<7>Starting erase of pending block 0x00040000
<7>Freeing all node refs for eraseblock offset 0x00040000
<7>Erase completed successfully at 0x00040000
<7>Starting erase of pending block 0x006c0000
<7>Freeing all node refs for eraseblock offset 0x006c0000
<7>Erase completed successfully at 0x006c0000
<7>Starting erase of pending block 0x00680000
<7>Freeing all node refs for eraseblock offset 0x00680000
<7>Erase completed successfully at 0x00680000
<7>Starting erase of pending block 0x00640000
<7>Freeing all node refs for eraseblock offset 0x00640000
<7>Erase completed successfully at 0x00640000
<7>Starting erase of pending block 0x00600000
<7>Freeing all node refs for eraseblock offset 0x00600000
<7>Erase completed successfully at 0x00600000
<7>Starting erase of pending block 0x005c0000
<7>Freeing all node refs for eraseblock offset 0x005c0000
<7>Erase completed successfully at 0x005c0000
<7>Starting erase of pending block 0x00580000
<7>Freeing all node refs for eraseblock offset 0x00580000
<7>Erase completed successfully at 0x00580000
<7>jffs2_erase_pending_blocks completed
<7>Verifying erase at 0x00540000
<7>Writing erased marker to block at 0x00540000
<7>Verifying erase at 0x00500000
<7>Writing erased marker to block at 0x00500000
<7>Verifying erase at 0x004c0000
<7>Writing erased marker to block at 0x004c0000
<7>Verifying erase at 0x00480000
<7>Writing erased marker to block at 0x00480000
<7>Verifying erase at 0x00440000
<7>Writing erased marker to block at 0x00440000
<7>Verifying erase at 0x00400000
<7>Writing erased marker to block at 0x00400000
<7>Verifying erase at 0x003c0000
<7>Writing erased marker to block at 0x003c0000
<7>Verifying erase at 0x00380000
<7>Writing erased marker to block at 0x00380000
<7>Verifying erase at 0x00340000
<7>Writing erased marker to block at 0x00340000
<7>Verifying erase at 0x00300000
<7>Writing erased marker to block at 0x00300000
<7>Verifying erase at 0x002c0000
<7>Writing erased marker to block at 0x002c0000
<7>Verifying erase at 0x00280000
<7>Writing erased marker to block at 0x00280000
<7>Verifying erase at 0x00240000
<7>Writing erased marker to block at 0x00240000
<7>Verifying erase at 0x00200000
<7>Writing erased marker to block at 0x00200000
<7>Verifying erase at 0x001c0000
<7>Writing erased marker to block at 0x001c0000
<7>Verifying erase at 0x00180000
<7>Writing erased marker to block at 0x00180000
<7>Verifying erase at 0x00140000
<7>Writing erased marker to block at 0x00140000
<7>Verifying erase at 0x00100000
<7>Writing erased marker to block at 0x00100000
<7>Verifying erase at 0x000c0000
<7>Writing erased marker to block at 0x000c0000
<7>Verifying erase at 0x00080000
<7>Writing erased marker to block at 0x00080000
<7>Verifying erase at 0x00040000
<7>Writing erased marker to block at 0x00040000
<7>Verifying erase at 0x006c0000
<7>Writing erased marker to block at 0x006c0000
<7>Verifying erase at 0x00680000
<7>Writing erased marker to block at 0x00680000
<7>Verifying erase at 0x00640000
<7>Writing erased marker to block at 0x00640000
<7>Verifying erase at 0x00600000
<7>Writing erased marker to block at 0x00600000
<7>Verifying erase at 0x005c0000
<7>Writing erased marker to block at 0x005c0000
<7>Verifying erase at 0x00580000
<7>Writing erased marker to block at 0x00580000
<7>jffs2_write_super(): flush_wbuf before gc-trigger
<7>thread_should_wake(): nr_free_blocks 27, nr_erasing_blocks 0, dirty_size 0x0
<7>jffs2_erase_pending_blocks completed
<6>MTD_open
<6>MTD_ioctl
<6>MTD_ioctl
<6>MTD_ioctl
<6>MTD_close
<6>MTD_open
<6>MTD_ioctl
<6>MTD_ioctl
<6>MTD_close
<6>MTD_open
<6>MTD_ioctl
<6>MTD_ioctl
<6>MTD_close
<6>MTD_open
<6>MTD_ioctl
<6>MTD_ioctl
<6>MTD_close
-8<---------------------------------------------------------------

It seems that i have a problem with the free space.

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


-- 
/**********************************************
* Christian Gagneraud
***********************************************
* cgagneraud@anfora.fr
***********************************************
* ANFORA
* bat Actys, Voie3
* 31313 Labège Innopole
* FRANCE
***********************************************/
