Received: from ns1.ibisnet.net ([206.96.176.8])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16oDEk-0007ar-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Mar 2002 00:48:54 +0000
Received: from [209.241.58.14] by ns1.multitechcorp.com (NTMail 4.30.0013/AX0073.00.28c4a373) with ESMTP id wzqroaaa for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2002 20:11:40 -0500
From: "Antonio Ruggieri" <truggieri@multitechcorp.com>
To: <linux-mtd@lists.infradead.org>
Subject: failing to remount mtdblock0 after writing to it
Date: Thu, 21 Mar 2002 20:01:06 -0500
Message-ID: <001801c1d13d$0c804e30$5d130aac@multitechcorp.com>
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

Hi all,

I am a newbie to this, so any help would be appreciated.  I have a 16M 16
bit wide Intel Strataflash chip on a custom board with a ZfMicro devices x86
processor.  I can successfully recognize the flash chip through MTD and
partition it, and mount it.  I can copy files to the partition, read them,
cat them, etc. However once I unmount the partition and try to re-mount, the
re-mount fails.  It seems I can only mount a cleanly erased partition. Once
I have added files to it under jffs and umount, I cannot successfully
remount the partition and read the files. Am I doing something wrong here?

Sorry for the lengthy e-mail, but I turned on the verbose options so that
you could see what it is doing.

Thanks

Tony Ruggieri
truggieri@multitechcorp.com
Multitech Corp.
Clearwater, FL 33760
727-540-0030



Linux version 2.4.18 (root@SHOTS2) (gcc version 2.96 20000731 (Red Hat Linux
7.1 2.96-98)) #8 Thu Mar 21 15:48:45 EST 2002
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009f400 (usable)
 BIOS-e820: 000000000009f400 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000d0000 - 00000000000d4000 (reserved)
 BIOS-e820: 00000000000e5c00 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 0000000004000000 (usable)
 BIOS-e820: 00000000fff80000 - 0000000100000000 (reserved)
On node 0 totalpages: 16384
zone(0): 4096 pages.
zone(1): 12288 pages.
zone(2): 0 pages.
Kernel command line:
Initializing CPU#0
Console: colour VGA+ 80x25
Calibrating delay loop... 51.09 BogoMIPS
Memory: 62880k/65536k available (759k kernel code, 2268k reserved, 154k
data, 52k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
CPU: Before vendor init, caps: 00000000 00000000 00000000, vendor = 1
CPU: After vendor init, caps: 00000000 00000000 00000000 00000000
CPU:     After generic, caps: 00000000 00000000 00000000 00000000
CPU:             Common caps: 00000000 00000000 00000000 00000000
CPU: Cyrix Cx486DX2
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with no serial options enabled
ttyS00 at 0x03f8 (irq = 4) is a 16550A
ttyS01 at 0x02f8 (irq = 3) is a 16550A
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Floppy drive(s): fd0 is 1.44M
FDC 0 is a National Semiconductor PC87306
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Insert root floppy disk to be loaded into RAM disk and press ENTER
VFS: Disk change detected on device fd(2,44)
RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem).
Freeing unused kernel memory: 52k freed
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
CSLIP: code copyright 1989 Regents of the University of California
PPP generic driver version 2.4.1
PPP BSD Compression module registered
PPP Deflate Compression module registered
JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
Mtc_Zfx flash: IO:0x218-0x21f MEM:0xd0000-0xdffff
0: offset=0x0,size=0x20000,blocks=128
Using buffer write method
Creating 4 MTD partitions on "Mtc_Zfx flash":
0x00000000-0x00300000 : "Mtc_Zfx flash BOOT partition"
mtd: Giving out device 0 to Mtc_Zfx flash BOOT partition
0x00300000-0x00d00000 : "Mtc_Zfx flash APPLICATION partition"
mtd: Giving out device 1 to Mtc_Zfx flash APPLICATION partition
0x00a00000-0x00c00000 : "Mtc_Zfx flash ETI partition"
mtd: Giving out device 2 to Mtc_Zfx flash ETI partition
0x00200000-0x00300000 : "Mtc_Zfx flash BIOS partition"
mtd: Giving out device 3 to Mtc_Zfx flash BIOS partition

*************************************
#mount -t jffs /dev/mtdblock0 /mnt/fl0
*************************************

flash_safe_read(c116a460, 00295000, c37f2000, 00001000)
flash_safe_read(c116a460, 00296000, c37f2000, 00001000)
...................
flash_safe_read(c116a460, 002fe000, c37f2000, 00001000)
flash_safe_read(c116a460, 002ff000, c37f2000, 00001000)
jffs_scan_flash():0xffffffff ended at pos 0x300000.
Free space accepted: Starting 0x0 for 0x300000 bytes
was hole = 0 end_offset = 0
now = 0 end_offset = 0
jffs_build_end()
struct jffs_fmcontrol: 0xc39a3950
{
        3145728, /* flash_size  */
        0, /* used_size  */
        0, /* dirty_size  */
        3145728, /* free_size  */
        131072, /* sector_size  */
        524288, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc116a460, /* mtd  */
        0x00000000, /* head  */    (head->offset = 0x00000000)
        0x00000000, /* tail  */    (tail->offset + tail->size = 0x00000000)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
}
jffs_scan_flash(): Leaving...
jffs_find_file(): ino: 1
jffs_find_file(): Didn't find file with ino 1.
jffs_add_virtual_root(): Creating a virtual root directory.
jffs_insert_file_into_hash(): f->ino: 1
jffs_possibly_delete_file(): ino: 1
jffs_remove_redundant_nodes(): ino: 1, name: "", newest_type: 1
jffs_insert_file_into_tree(): name: ""
jffs_find_file(): ino: 0
jffs_find_file(): Didn't find file with ino 0.
jffs_build_file(): ino: 1, name: ""
jffs_update_file(): ino: 1, version: 0
JFFS: Dumping the file system's hash table...
*** c->hash[1]: "" (ino: 1, pino: 0)
/ (ino: 1, highest_version: 0, size: 0)
jffs_read_inode(): inode->i_ino == 1
read_inode(): down biglock
jffs_find_file(): ino: 1
jffs_find_file(): Found file with ino 1. (name: "")
read_inode(): up biglock
jffs_garbage_collect_thread(): Starting infinite loop.
thread_should_wake(): free=3145728, dirty=0, blocksize=131072.
thread_should_wake(): Not waking. Insufficient dirty space
JFFS: GC thread pid=58.
JFFS: Successfully mounted device 1f:00.

******************************************
#cp /etc/hosts /mnt/fl0
******************************************
...........................
jffs_lookup(): dir: 0xc3813230, name: "hosts"
lookup(): down biglock
jffs_find_child()
jffs_find_child(): Didn't find the file "hosts".
jffs_lookup(): Couldn't find the file. f = 0x00000000, name = "hosts", d =
0xc39a39d0, d->ino = 1
lookup(): up biglock
jffs_create(): dir: 0xc3813230, name: "hosts"
create(): down biglock
jffs_write_node(): filename = "hosts", ino = 2, total_size = 68
jffs_fmalloc(): fmc = 0xc39a3950, size = 68, node = 0xc37f1180
jffs_fmalloc(): free_chunk_size1 = 3145728, free_chunk_size2 = 0
struct jffs_fmcontrol: 0xc39a3950
{
        3145728, /* flash_size  */
        68, /* used_size  */
        0, /* dirty_size  */
        3145660, /* free_size  */
        131072, /* sector_size  */
        524288, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc116a460, /* mtd  */
        0xc37eb1e0, /* head  */    (head->offset = 0x00000000)
        0xc37eb1e0, /* tail  */    (tail->offset + tail->size = 0x00000044)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
}
struct jffs_fm: 0xc37eb1e0
{
       0x00000000, /* offset  */
       68, /* size  */
       0x00000000, /* prev  */
       0x00000000, /* next  */
       0xc113fde0, /* nodes  */
}
, result: 0x00000000
, result: 0x00000231
, result: 0x000005c5
jffs_write_node(): About to write this raw inode to the flash at pos 0x0:
jffs_raw_inode: inode number: 2
{
        0x34383931, /* magic  */
        0x00000002, /* ino  */
        0x00000001, /* pino  */
        0x00000001, /* version  */
        0x000081a4, /* mode  */
        0x0000,     /* uid  */
        0x0000,     /* gid  */
        0x21dc161c, /* atime  */
        0x21dc161c, /* mtime  */
        0x21dc161c, /* ctime  */
        0x00000000, /* offset  */
        0x00000000, /* dsize  */
        0x00000000, /* rsize  */
        0x05,       /* nsize  */
        0x01,       /* nlink  */
        0x00,       /* spare  */
        0,          /* rename  */
        0,          /* deleted  */
        0xff,       /* accurate  */
        0x00000000, /* dchksum  */
        0x0231,     /* nchksum  */
        0x05c5,     /* chksum  */
}
flash_safe_writev(c116a460, 00000000, c381be48)
jffs_write_node(): Leaving...
jffs_insert_node(): ino = 2, version = 1, name = "hosts", deleted = 0
jffs_find_file(): ino: 2
jffs_find_file(): Didn't find file with ino 2.
jffs_insert_file_into_hash(): f->ino: 2
jffs_insert_node(): Updated the name of the file to "hosts".
jffs_insert_node(): --------------------------------------------------------
-------------- 1
jffs_insert_file_into_tree(): name: "hosts"
jffs_find_file(): ino: 1
jffs_find_file(): Found file with ino 1. (name: "")
jffs_remove_redundant_nodes(): ino: 2, name: "hosts", newest_type: 3
thread_should_wake(): free=3145660, dirty=0, blocksize=131072.
thread_should_wake(): Not waking. Insufficient dirty space
jffs_insert_node(): --------------------------------------------------------
-------------- 2
jffs_find_file(): ino: 2
jffs_find_file(): Found file with ino 2. (name: "hosts")
create(): up biglock
***jffs_readpage(): file = "hosts", page->index = 0
readpage(): down biglock
readpage(): up biglock
jffs_readpage(): Leaving...
***jffs_file_write(): inode: 0xc37ea060 (ino: 2), filp: 0xc1149dd0, buf:
0xc37e8000, count: 248
file_write(): down biglock
jffs_write_node(): filename = "hosts", ino = 2, total_size = 316
jffs_fmalloc(): fmc = 0xc39a3950, size = 316, node = 0xc37f11b0
jffs_fmalloc(): free_chunk_size1 = 3145660, free_chunk_size2 = 0
struct jffs_fmcontrol: 0xc39a3950
{
        3145728, /* flash_size  */
        384, /* used_size  */
        0, /* dirty_size  */
        3145344, /* free_size  */
        131072, /* sector_size  */
        524288, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc116a460, /* mtd  */
        0xc37eb1e0, /* head  */    (head->offset = 0x00000000)
        0xc37eb200, /* tail  */    (tail->offset + tail->size = 0x00000180)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
}
struct jffs_fm: 0xc37eb200
{
       0x00000044, /* offset  */
       316, /* size  */
       0xc37eb1e0, /* prev  */
       0x00000000, /* next  */
       0xc113fe20, /* nodes  */
}
jffs_write_node(): setting version of hosts to 2
, result: 0x00004a89
, result: 0x00000231
, result: 0x00000791
jffs_write_node(): About to write this raw inode to the flash at pos 0x44:
jffs_raw_inode: inode number: 2
{
        0x34383931, /* magic  */
        0x00000002, /* ino  */
        0x00000001, /* pino  */
        0x00000002, /* version  */
        0x000081a4, /* mode  */
        0x0000,     /* uid  */
        0x0000,     /* gid  */
        0x21dc161c, /* atime  */
        0x21dc161c, /* mtime  */
        0x21dc161c, /* ctime  */
        0x00000000, /* offset  */
        0x000000f8, /* dsize  */
        0x00000000, /* rsize  */
        0x05,       /* nsize  */
        0x01,       /* nlink  */
        0x00,       /* spare  */
        0,          /* rename  */
        0,          /* deleted  */
        0xff,       /* accurate  */
        0x00004a89, /* dchksum  */
        0x0231,     /* nchksum  */
        0x0791,     /* chksum  */
}
flash_safe_writev(c116a460, 00000044, c381be3c)
jffs_write_node(): Leaving...
jffs_insert_node(): ino = 2, version = 2, name = "", deleted = 0
jffs_insert_node(): --------------------------------------------------------
-------------- 1
jffs_update_file(): ino: 2, version: 2
jffs_delete_data(): offset = 0, remove_size = 0
jffs_insert_data(): node->data_offset = 0, node->data_size = 248, f->size =
0
jffs_insert_data(): f->size = 248
jffs_remove_redundant_nodes(): ino: 2, name: "hosts", newest_type: 7
jffs_remove_redundant_nodes(): Removing node: ino: 2, version: 1, mod_type:
3
jffs_fmfree(): node->ino = 2, node->version = 1
thread_should_wake(): free=3145344, dirty=68, blocksize=131072.
thread_should_wake(): Not waking. Insufficient dirty space
jffs_insert_node(): --------------------------------------------------------
-------------- 2
jffs_file_write(): new f_pos 248.
file_write(): up biglock
readdir(): down biglock
jffs_readdir(): inode: 0xc3813230, filp: 0xc1149cf0
jffs_readdir(): "." 1
jffs_readdir(): ".." 1
jffs_readdir(): "hosts" ino: 2
readdir(): up biglock
readdir(): down biglock
jffs_readdir(): inode: 0xc3813230, filp: 0xc1149cf0
readdir(): up biglock

********************
#umount /mnt/fl0
********************

jffs_put_super()
jffs_put_super(): Telling gc thread to die.
jffs_garbage_collect_thread(): SIGKILL received.
jffs_put_super(): Successfully waited on thread.
jffs_cleanup_control()
jffs_free_node_list(): f #1, ""
jffs_free_node_list(): f #2, "hosts"
jffs_free_file: f #1, ""
jffs_free_file: f #2, "hosts"
jffs_cleanup_control(): Leaving...
JFFS: Successfully unmounted device 1f:00.
mtdblock_release
ok

*************************************
mount -t jffs /dev/mtdblock0 /mnt/fl0
*************************************

...........................
his raw inode at pos 0x2f0000 on the flash:
jffs_raw_inode: inode number: 2
{
        0x34383931, /* magic  */
        0x00000002, /* ino  */
        0x00000001, /* pino  */
        0x00000001, /* version  */
        0x000081a4, /* mode  */
        0x0000,     /* uid  */
        0x0000,     /* gid  */
        0x21dc161c, /* atime  */
        0x21dc161c, /* mtime  */
        0x21dc161c, /* ctime  */
        0x00000000, /* offset  */
        0x00000000, /* dsize  */
        0x00000000, /* rsize  */
        0x05,       /* nsize  */
        0x01,       /* nlink  */
        0x00,       /* spare  */
        0,          /* rename  */
        0,          /* deleted  */
        0xff,       /* accurate  */
        0x00000000, /* dchksum  */
        0x0231,     /* nchksum  */
        0x05c5,     /* chksum  */
}
flash_safe_read(c116a460, 002f003c, c381bd4c, 00000005)
name == "hosts"
, result: 0x00000231
jffs_fmalloced()
struct jffs_fmcontrol: 0xc1160240
{
        3145728, /* flash_size  */
        18116, /* used_size  */
        3062144, /* dirty_size  */
        65468, /* free_size  */
        131072, /* sector_size  */
        524288, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc116a460, /* mtd  */
        0xc37eb200, /* head  */    (head->offset = 0x00000000)
        0xc37d4560, /* tail  */    (tail->offset + tail->size = 0x002f0044)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
}
struct jffs_fm: 0xc37d4560
{
       0x002f0000, /* offset  */
       68, /* size  */
       0xc37d4540, /* prev  */
       0x00000000, /* next  */
       0xc37d5ba0, /* nodes  */
}
jffs_insert_node(): ino = 2, version = 1, name = "hosts", deleted = 0
jffs_find_file(): ino: 2
jffs_find_file(): Found file with ino 2. (name: "hosts")
jffs_node: 0xc37d3450
{
        0x00000001, /* version  */
        0x00000000, /* data_offset  */
        0x00000000, /* data_size  */
        0x00000000, /* removed_size  */
        0x00000044, /* fm_offset  */
        0x05,       /* name_size  */
        0xc37d4560, /* fm,  fm->offset: 3080192  */
        0x00000000, /* version_prev  */
        0x00000000, /* version_next  */
        0x00000000, /* range_prev  */
        0x00000000, /* range_next  */
}
flash_safe_read(c116a460, 002f0044, c381bd0c, 0000003c)
, result: 0x00000791
*** We have found this raw inode at pos 0x2f0044 on the flash:
jffs_raw_inode: inode number: 2
{
        0x34383931, /* magic  */
        0x00000002, /* ino  */
        0x00000001, /* pino  */
        0x00000002, /* version  */
        0x000081a4, /* mode  */
        0x0000,     /* uid  */
        0x0000,     /* gid  */
        0x21dc161c, /* atime  */
        0x21dc161c, /* mtime  */
        0x21dc161c, /* ctime  */
        0x00000000, /* offset  */
        0x000000f8, /* dsize  */
        0x00000000, /* rsize  */
        0x05,       /* nsize  */
        0x01,       /* nlink  */
        0x00,       /* spare  */
        0,          /* rename  */
        0,          /* deleted  */
        0xff,       /* accurate  */
        0x00004a89, /* dchksum  */
        0x0231,     /* nchksum  */
        0x0791,     /* chksum  */
}
flash_safe_read(c116a460, 002f0080, c381bd4c, 00000005)
name == "hosts"
, result: 0x00000231
jffs_checksum_flash
flash_safe_read(c116a460, 002f0088, c37f2000, 000000f8)
checksum result: 0x00004a89
jffs_fmalloced()
struct jffs_fmcontrol: 0xc1160240
{
        3145728, /* flash_size  */
        18432, /* used_size  */
        3062144, /* dirty_size  */
        65152, /* free_size  */
        131072, /* sector_size  */
        524288, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc116a460, /* mtd  */
        0xc37eb200, /* head  */    (head->offset = 0x00000000)
        0xc37d4580, /* tail  */    (tail->offset + tail->size = 0x002f0180)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
}
struct jffs_fm: 0xc37d4580
{
       0x002f0044, /* offset  */
       316, /* size  */
       0xc37d4560, /* prev  */
       0x00000000, /* next  */
       0xc37d5bc0, /* nodes  */
}
jffs_insert_node(): ino = 2, version = 2, name = "hosts", deleted = 0
jffs_find_file(): ino: 2
jffs_find_file(): Found file with ino 2. (name: "hosts")
jffs_node: 0xc37d3480
{
        0x00000002, /* version  */
        0x00000000, /* data_offset  */
        0x000000f8, /* data_size  */
        0x00000000, /* removed_size  */
        0x00000044, /* fm_offset  */
        0x05,       /* name_size  */
        0xc37d4580, /* fm,  fm->offset: 3080260  */
        0xc37f11b0, /* version_prev  */
        0xc37d3420, /* version_next  */
        0x00000000, /* range_prev  */
        0x00000000, /* range_next  */
}
jffs_scan_flash(): 0xffffffff at pos 0x2f0180.
flash_safe_read(c116a460, 002f0180, c3880000, 00001000)
flash_safe_read(c116a460, 002f1180, c3880000, 00001000)
flash_safe_read(c116a460, 002f2180, c3880000, 00001000)
flash_safe_read(c116a460, 002f3180, c3880000, 00001000)
flash_safe_read(c116a460, 002f4180, c3880000, 00001000)
flash_safe_read(c116a460, 002f5180, c3880000, 00001000)
flash_safe_read(c116a460, 002f6180, c3880000, 00001000)
flash_safe_read(c116a460, 002f7180, c3880000, 00001000)
flash_safe_read(c116a460, 002f8180, c3880000, 00001000)
flash_safe_read(c116a460, 002f9180, c3880000, 00001000)
flash_safe_read(c116a460, 002fa180, c3880000, 00001000)
flash_safe_read(c116a460, 002fb180, c3880000, 00001000)
flash_safe_read(c116a460, 002fc180, c3880000, 00001000)
flash_safe_read(c116a460, 002fd180, c3880000, 00001000)
flash_safe_read(c116a460, 002fe180, c3880000, 00001000)
flash_safe_read(c116a460, 002ff180, c3880000, 00000e80)
jffs_scan_flash():0xffffffff ended at pos 0x300000.
Free space (#24) found but *Not* accepted: Starting 0x2f0180 for 0xfe80
bytes
Dirty space: Starting 0x2f0180 for 0xfe80 bytes
jffs_fmalloced()
struct jffs_fmcontrol: 0xc1160240
{
        3145728, /* flash_size  */
        18432, /* used_size  */
        3127296, /* dirty_size  */
        0, /* free_size  */
        131072, /* sector_size  */
        524288, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc116a460, /* mtd  */
        0xc37eb200, /* head  */    (head->offset = 0x00000000)
        0xc37d45a0, /* tail  */    (tail->offset + tail->size = 0x00300000)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
}
struct jffs_fm: 0xc37d45a0
{
       0x002f0180, /* offset  */
       65152, /* size  */
       0xc37d4580, /* prev  */
       0x00000000, /* next  */
       0x00000000, /* nodes  */
}
jffs_build_end()
struct jffs_fmcontrol: 0xc1160240
{
        3145728, /* flash_size  */
        18432, /* used_size  */
        3127296, /* dirty_size  */
        0, /* free_size  */
        131072, /* sector_size  */
        524288, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc116a460, /* mtd  */
        0xc37eb200, /* head  */    (head->offset = 0x00000000)
        0xc37d45a0, /* tail  */    (tail->offset + tail->size = 0x00300000)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
}
jffs_scan_flash(): Did not find even a single chunk of free space. This is
BAD!
jffs_scan_flash(): Leaving...
jffs_scan_falsh():Free size accounting screwed
jfffs_scan_flash():free_chunk_size1 == 0x300000, free_chunk_size2 == 0x0,
fmc->free_size == 0x0
jffs_cleanup_control()
jffs_free_node_list(): f #2, "hosts"
jffs_free_file: f #2, "hosts"
jffs_cleanup_control(): Leaving...
JFFS: Failed to mount device 1f:00.
mtdblock_release
ok
mtdblock_open
ok
mtdblock_release
ok
