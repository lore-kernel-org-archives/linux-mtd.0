Received: from [218.234.78.231] (helo=digitalparus.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AavKD-0007Os-2u
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2003 11:12:41 +0000
Received: from localhost (digitalparus.com [218.234.78.231])
	by digitalparus.com (Postfix) with ESMTP id 06EAA11506
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Dec 2003 20:09:53 +0900 (KST)
Message-ID: <1072696192.3ff00b80ee311@digitalparus.com>
Date: Mon, 29 Dec 2003 20:09:52 +0900
From: vsergey@digitalparus.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Subject: Problem using JFFS2 with NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a problem with JFFS2 romfs. I can mount empty JFFS2 partition only first 
time!!! Here is the log.

Here is my setup:
board:      IXDP2400
bootloader: redboot
kernel:     2.4.19-rmk7-ds3
flash:      16M (28F128J3A Intel StrataFlash memory)

redboot> fis list
Name              FLASH addr  Mem addr    Length      Entry point
RedBoot           0xC4000000  0x00000000  0x00040000  0x00000000
System Log        0xC4FA0000  0xC4FA0000  0x00020000  0x00000000
RedBoot config    0xC4FDF000  0xC4FDF000  0x00001000  0x00000000
FIS directory     0xC4FE0000  0xC4FE0000  0x00020000  0x00000000
romfs             0xC4240000  0x00000000  0x00100000  0x00000000

Here is the message of MTD from kernel startup:
Using RedBoot partition definition
Creating 7 MTD partitions on "IXP2000 flash":
0x00000000-0x00040000 : "RedBoot"
mtd: Giving out device 0 to RedBoot
0x00040000-0x00240000 : "unallocated space"
mtd: Giving out device 1 to unallocated space
0x00240000-0x00340000 : "romfs"
mtd: Giving out device 2 to romfs
0x00340000-0x00fa0000 : "unallocated space"
mtd: Giving out device 3 to unallocated space
0x00fa0000-0x00fc0000 : "System Log"
mtd: Giving out device 4 to System Log
0x00fdf000-0x00fe0000 : "RedBoot config"
mtd: partition "RedBoot config" doesn't start on an erase block boundary -- 
force read-only
mtd: Giving out device 5 to RedBoot config
0x00fe0000-0x01000000 : "FIS directory"
mtd: Giving out device 6 to FIS directory

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 "RedBoot"
mtd1: 00200000 00020000 "unallocated space"
mtd2: 00100000 00020000 "romfs"
mtd3: 00c60000 00020000 "unallocated space"
mtd4: 00020000 00020000 "System Log"
mtd5: 00001000 00020000 "RedBoot config"
mtd6: 00020000 00020000 "FIS directory"

# eraseall /dev/mtd/2

# mount -t jffs2 /dev/mtdblock/2 /mnt/jffs2

Jan  1 00:02:47 100 syslog.info klogd: mtdblock_open
Jan  1 00:02:47 100 syslog.info klogd: ok
Jan  1 00:02:47 100 syslog.debug klogd: jffs2: read_super for device 1f:02
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_scan_eraseblock(): Scanning block 
at 0x0
Jan  1 00:02:47 100 syslog.debug klogd: Empty flash detected from 0x00000000 to 
0x00020000
Jan  1 00:02:47 100 syslog.debug klogd: Block at 0x00000000 is empty (erased)
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_scan_eraseblock(): Scanning block 
at 0x20000
Jan  1 00:02:47 100 syslog.debug klogd: Empty flash detected from 0x00020000 to 
0x00040000
Jan  1 00:02:47 100 syslog.debug klogd: Block at 0x00020000 is empty (erased)
...
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_scan_eraseblock(): Scanning block 
at 0xe0000
Jan  1 00:02:47 100 syslog.debug klogd: Empty flash detected from 0x000e0000 to 
0x00100000
Jan  1 00:02:47 100 syslog.debug klogd: Block at 0x000e0000 is empty (erased)
Jan  1 00:02:47 100 syslog.debug klogd: Scanned flash completely
Jan  1 00:02:47 100 syslog.debug klogd: Pass 1 complete
Jan  1 00:02:47 100 syslog.debug klogd: Pass 2 (re)starting
Jan  1 00:02:47 100 syslog.debug klogd: Pass 2 complete
Jan  1 00:02:47 100 syslog.debug klogd: Pass 3 complete
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_read_super(): Getting root inode
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_read_inode(): inode->i_ino == 1
Jan  1 00:02:47 100 syslog.debug klogd: getting inocache
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_get_ino_cache(): ino 1
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_get_ino_cache found 00000000 for 
ino 1
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_read_inode(): Got inocache at 
00000000
Jan  1 00:02:47 100 syslog.debug klogd: Allocated inocache at 83d6d2c0
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_read_inode(): Creating inocache 
for root inode
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_add_ino_cache: Add 83d6d2c0 (ino 
#1)
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_read_inode(): ino #1 nlink is 1
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_get_inode_nodes(): ino #1
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_read_inode() returning
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_read_super(): d_alloc_root()
Jan  1 00:02:47 100 syslog.debug klogd: thread_should_wake(): nr_free_blocks 0, 
nr_erasing_blocks 8, dirty_size 0x0
Jan  1 00:02:47 100 syslog.debug klogd: jffs2_garbage_collect_thread sleeping...
Jan  1 00:02:47 100 syslog.debug klogd: JFFS2: Garbage collect thread is pid 66
Jan  1 00:02:50 100 syslog.debug klogd: thread_should_wake(): nr_free_blocks 0, 
nr_erasing_blocks 8, dirty_size 0x0
Jan  1 00:02:50 100 syslog.debug klogd: Starting erase of pending block 
0x000c0000
Jan  1 00:02:50 100 syslog.debug klogd: Freeing all node refs for eraseblock 
offset 0x000c0000
Jan  1 00:02:51 100 syslog.debug klogd: Erase completed successfully at 
0x00300000
...
Jan  1 00:02:56 100 syslog.debug klogd: Starting erase of pending block 
0x000e0000
Jan  1 00:02:56 100 syslog.debug klogd: Freeing all node refs for eraseblock 
offset 0x000e0000
Jan  1 00:02:56 100 syslog.debug klogd: Erase completed successfully at 
0x00320000
Jan  1 00:02:57 100 syslog.debug klogd: jffs2_erase_pending_blocks completed
Jan  1 00:02:57 100 syslog.debug klogd: Verifying erase at 0x000c0000
Jan  1 00:02:57 100 syslog.debug klogd: Writing erased marker to block at 
0x000c0000
Jan  1 00:02:57 100 syslog.debug klogd: Verifying erase at 0x000a0000
Jan  1 00:02:57 100 syslog.debug klogd: Writing erased marker to block at 
0x000a0000
Jan  1 00:02:57 100 syslog.debug klogd: Verifying erase at 0x00080000
Jan  1 00:02:57 100 syslog.debug klogd: Writing erased marker to block at 
0x00080000
Jan  1 00:02:57 100 syslog.debug klogd: Verifying erase at 0x00060000
Jan  1 00:02:57 100 syslog.debug klogd: Writing erased marker to block at 
0x00060000
Jan  1 00:02:58 100 syslog.debug klogd: Verifying erase at 0x00040000
Jan  1 00:02:58 100 syslog.debug klogd: Writing erased marker to block at 
0x00040000
Jan  1 00:02:58 100 syslog.debug klogd: Verifying erase at 0x00020000
Jan  1 00:02:58 100 syslog.debug klogd: Writing erased marker to block at 
0x00020000
Jan  1 00:02:58 100 syslog.debug klogd: Verifying erase at 0x00000000
Jan  1 00:02:58 100 syslog.debug klogd: Writing erased marker to block at 
0x00000000
Jan  1 00:02:58 100 syslog.debug klogd: Verifying erase at 0x000e0000
Jan  1 00:02:58 100 syslog.debug klogd: Writing erased marker to block at 
0x000e0000
Jan  1 00:02:58 100 syslog.debug klogd: thread_should_wake(): nr_free_blocks 8, 
nr_erasing_blocks 0, dirty_size 0x0
Jan  1 00:02:58 100 syslog.debug klogd: jffs2_erase_pending_blocks completed


# mount

rootfs on / type rootfs (rw)
/dev/root on / type nfs 
(ro,v2,rsize=4096,wsize=4096,hard,udp,nolock,addr=100.100.100.6)
none on /dev type devfs (rw)
/proc on /proc type proc (rw)
/dev/mtdblock/2 on /mnt/jffs2 type jffs2 (rw)

When I try to create file I receive:

# touch test

Jan  1 00:05:28 100 syslog.debug klogd: jffs2_lookup()
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_lookup()
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_create()
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_reserve_space(): Requested 0x44 
bytes
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_reserve_spaceARGH. About to write 
node to 0x000c007c on flash, but there's data already there:
(): alloc sem got
Jan  1 00:05:28 100 syslog.de0x000c007c: ff ff ff ff 01 00 00 ff ff ff ff ff ff 
ff ff ff
bug klogd: jffs2_do_reserve_space(): Giving 0x1fff4 bytes at 0xc000c
Jan  1 00:Node totlen on flash (0x44000000) != totlen in node ref (0x00000044)
05:28 100 syslog.debug klogd: jffs2_create(): reserved 0x1fff4 bytes
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_new_inode(): dir_i 1, mode 0x81a4
Jan  1 00:05:28 100 syslog.debug klogd: Allocated inocache at 83d6d2d4
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_new_inode(): Assigned ino# 2
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_add_ino_cache: Add 83d6d2d4 (ino 
#2)
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_add_physical_node_ref(): Node at 
0xc000c, size 0x44
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_write_dnode wrote node at 
0x000c000c with dsize 0x0, csize 0x0, node_crc 0x8ad6c0f8, data_crc 0x00000000, 
totlen 0x00000044
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_create created file with mode 
0x81a4
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_write_dirent(ino #1, name at 
*0x83d9267c "test"->ino #2, name_crc 0xf93ba110)
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_add_physical_node_ref(): Node at 
0xc0050, size 0x2c
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_complete_reservation()
Jan  1 00:05:28 100 syslog.debug klogd: thread_should_wake(): nr_free_blocks 7, 
nr_erasing_blocks 0, dirty_size 0x0
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_add_fd_to_list( 80313720, 
83d9d92c (->00000000))
Jan  1 00:05:28 100 syslog.debug klogd: Dirent "test" (hash 0x01c4ddc5, ino #2
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_create: Created ino #2 with mode 
100644, nlink 1(1). nrpages 0
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_setattr(): ino #2
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_reserve_space(): Requested 0x44 
bytes
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_reserve_space(): alloc sem got
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_do_reserve_space(): Giving 
0x1ff84 bytes at 0xc007c
Jan  1 00:05:28 100 syslog.warn klogd: ARGH. About to write node to 0x000c007c 
on flash, but there's data already there:
Jan  1 00:05:28 100 syslog.warn klogd: 0x000c007c: ff ff ff ff 01 00 00 ff ff 
ff ff ff ff ff ff ff
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_add_physical_node_ref(): Node at 
0xc007c, size 0x44
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_write_dnode wrote node at 
0x000c007c with dsize 0x0, csize 0x0, node_crc 0x699f775a, data_crc 0x00000000, 
totlen 0x00000044
Jan  1 00:05:28 100 syslog.debug klogd: jffs2_complete_reservation()
Jan  1 00:05:28 100 syslog.debug klogd: thread_should_wake(): nr_free_blocks 7, 
nr_erasing_blocks 0, dirty_size 0x0
Jan  1 00:05:28 100 syslog.debug klogd: Not moving nextblock 0x000c0000 to 
dirty/erase_pending list
Jan  1 00:05:28 100 syslog.debug klogd: obliterating obsoleted node at 
0x000c000c
Jan  1 00:05:28 100 syslog.warn klogd: Node totlen on flash (0x44000000) != 
totlen in node ref (0x00000044)

# ls -l

-rw-r--r--    1 root     root            0 Jan  1 00:05 test

# umount /dev/mtdblock/2


If I will try to mount egain:

# mount -t jffs2 /dev/mtdblock/2 /mnt/jffs2

mtdblock_open
ok
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 0x0c00 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 0x98dc 
instead
jffs2_scan_empty(): Empty block at 0x0000000c ends at 0x00000020 (with 
0x032085ff)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x0320 
instead
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020000: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020004: 0x0c00 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020008: 0x98dc 
instead
jffs2_scan_empty(): Empty block at 0x0002000c ends at 0x00020020 (with 
0x032085ff)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020020: 0x0320 
instead
JFFS2: Erase block at 0x00020000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040000: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004: 0x0c00 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008: 0x98dc 
instead
jffs2_scan_empty(): Empty block at 0x0004000c ends at 0x00040020 (with 
0x032085ff)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040020: 0x0320 
instead
JFFS2: Erase block at 0x00040000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060000: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060004: 0x0c00 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060008: 0x98dc 
instead
jffs2_scan_empty(): Empty block at 0x0006000c ends at 0x00060020 (with 
0x032085ff)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060020: 0x0320 
instead
JFFS2: Erase block at 0x00060000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080000: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004: 0x0c00 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080008: 0x98dc 
instead
jffs2_scan_empty(): Empty block at 0x0008000c ends at 0x00080020 (with 
0x032085ff)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080020: 0x0320 
instead
JFFS2: Erase block at 0x00080000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0000: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0004: 0x0c00 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0008: 0x98dc 
instead
jffs2_scan_empty(): Empty block at 0x000a000c ends at 0x000a0020 (with 
0x032085ff)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0020: 0x0320 
instead
JFFS2: Erase block at 0x000a0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0000: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0004: 0x0c00 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0008: 0x98dc 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c000c: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0010: 0x4400 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0014: 0x3e22 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0018: 0x0200 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c001c: 0x0100 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0020: 0x0320 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0030: 0x4801 
instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0000: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0004: 0x0c00 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0008: 0x98dc 
instead
jffs2_scan_empty(): Empty block at 0x000e000c ends at 0x000e0020 (with 
0x032085ff)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0020: 0x0320 
instead
JFFS2: Erase block at 0x000e0000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
mtdblock_release
ok

mount: Mounting /dev/mtdblock/2 on /mnt/jffs2 failed: Invalid argument



Any ideas? I have been reading the mailing list archive and could
not find the answer to this.

Thanks a lot


-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
