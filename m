Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14V0z9-00086f-00
	for mtd-list@infradead.org; Tue, 20 Feb 2001 00:48:55 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14V0z6-00086Z-00
	for mtd@infradead.org; Tue, 20 Feb 2001 00:48:52 +0000
Message-ID: <3A91C547.4B0126AB@danielind.com>
Date: Mon, 19 Feb 2001 19:15:53 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: mtd <mtd@infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: I/O error copying file to jffs, no obvous problem in jffs log? 
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I am trying to write a file (cp  /bin/cp   /mnt/jffs0) to a jffs file
system on raw CFI AMD uniform sector flash.

The copy fails with an Input/Ouput error, but I cannot see anything go
wrong in the (verbose level 3) jffs log.
A *portion* of the file does get written.

Anyone gove me a pointer as to what is happening?

Thanks a bunch.

I have attached the log that was generated when I tried to do the copy.

Vipin



****************************JFFS verbose level 3 log
**********************************
jffs_lookup(): dir: 0xc3b74600, name: "cp"

lookup(): down biglock

jffs_find_child()

jffs_find_child(): Didn't find the file "cp".

jffs_lookup(): Couldn't find the file. f = 0x00000000, name = "cp", d =
0xc3a7cdf0, d->ino = 1

lookup(): up biglock

jffs_create(): dir: 0xc3b74600, name: "cp"

create(): down biglock

jffs_write_node(): filename = "cp", ino = 207, total_size = 64

jffs_fmalloc(): fmc = 0xc3a7cf70, size = 64, node = 0xc1399690

jffs_fmalloc(): free_chunk_size1 = 1649552, free_chunk_size2 = 0

struct jffs_fmcontrol: 0xc3a7cf70

{

        8388608, /* flash_size  */

        6739120, /* used_size  */

        0, /* dirty_size  */

        1649488, /* free_size  */

        262144, /* sector_size  */

        524288, /* min_free_size  */

        131072, /* max_chunk_size  */

        0xc115eb60, /* mtd  */

        0xc14561e0, /* head  */    (head->offset = 0x00000000)

        0xc1398200, /* tail  */    (tail->offset + tail->size =
0x0066d4b0)

        0x00000000, /* head_extra  */

        0x00000000, /* tail_extra  */

}

struct jffs_fm: 0xc1398200

{

       0x0066d470, /* offset  */

       64, /* size  */

       0xc13981e0, /* prev  */

       0x00000000, /* next  */

       0xc2843800, /* nodes  */

}

, result: 0x00000000

, result: 0x000000d3

, result: 0x000007dd

jffs_write_node(): About to write this raw inode to the flash at pos
0x66d470:

jffs_raw_inode: inode number: 207

{

        0x34383931, /* magic  */

        0x000000cf, /* ino  */

        0x00000001, /* pino  */

        0x00000001, /* version  */

        0x00008180, /* mode  */

        0x0000,     /* uid  */

        0x0000,     /* gid  */

        0x135951b8, /* atime  */

        0x135951b8, /* mtime  */

        0x135951b8, /* ctime  */

        0x00000000, /* offset  */

        0x00000000, /* dsize  */

        0x00000000, /* rsize  */

        0x02,       /* nsize  */

        0x01,       /* nlink  */

        0x00,       /* spare  */

        0,          /* rename  */

        0,          /* deleted  */

        0xff,       /* accurate  */

        0x00000000, /* dchksum  */

        0x00d3,     /* nchksum  */

        0x07dd,     /* chksum  */

}

flash_safe_writev(c115eb60, 0066d470, c215de84)

jffs_write_node(): Leaving...

jffs_insert_node(): ino = 207, version = 1, name = "cp", deleted = 0

jffs_find_file(): ino: 207

jffs_find_file(): Didn't find file with ino 207.

jffs_insert_file_into_hash(): f->ino: 207

jffs_insert_node(): Updated the name of the file to "cp".

jffs_insert_node():
---------------------------------------------------------------------- 1

jffs_insert_file_into_tree(): name: "cp"

jffs_find_file(): ino: 1

jffs_find_file(): Found file with ino 1. (name: "")

jffs_remove_redundant_nodes(): ino: 207, name: "cp", newest_type: 3

thread_should_wake(): free=1649488, dirty=0, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

jffs_insert_node():
---------------------------------------------------------------------- 2

jffs_find_file(): ino: 207

jffs_find_file(): Found file with ino 207. (name: "cp")

create(): up biglock

***jffs_file_write(): inode: 0xc2dda2e0 (ino: 207), filp: 0xc370ee40,
buf: 0xc1683000, count: 4096

file_write(): down biglock

jffs_write_node(): filename = "cp", ino = 207, total_size = 4160

jffs_fmalloc(): fmc = 0xc3a7cf70, size = 4160, node = 0xc13996c0

jffs_fmalloc(): free_chunk_size1 = 1649488, free_chunk_size2 = 0

struct jffs_fmcontrol: 0xc3a7cf70

{

        8388608, /* flash_size  */

        6743280, /* used_size  */

        0, /* dirty_size  */

        1645328, /* free_size  */

        262144, /* sector_size  */

        524288, /* min_free_size  */

        131072, /* max_chunk_size  */

        0xc115eb60, /* mtd  */

        0xc14561e0, /* head  */    (head->offset = 0x00000000)

        0xc1398220, /* tail  */    (tail->offset + tail->size =
0x0066e4f0)

        0x00000000, /* head_extra  */

        0x00000000, /* tail_extra  */

}

struct jffs_fm: 0xc1398220

{

       0x0066d4b0, /* offset  */

       4160, /* size  */

       0xc1398200, /* prev  */

       0x00000000, /* next  */

       0xc28436c0, /* nodes  */

}

jffs_write_node(): setting version of cp to 2

, result: 0x00036e9a

, result: 0x000000d3

, result: 0x000008fb

jffs_write_node(): About to write this raw inode to the flash at pos
0x66d4b0:

jffs_raw_inode: inode number: 207

{

        0x34383931, /* magic  */

        0x000000cf, /* ino  */

        0x00000001, /* pino  */

        0x00000002, /* version  */

        0x00008180, /* mode  */

        0x0000,     /* uid  */

        0x0000,     /* gid  */

        0x135951b9, /* atime  */

        0x135951b9, /* mtime  */

        0x135951b8, /* ctime  */

        0x00000000, /* offset  */

        0x00001000, /* dsize  */

        0x00000000, /* rsize  */

        0x02,       /* nsize  */

        0x01,       /* nlink  */

        0x00,       /* spare  */

        0,          /* rename  */

        0,          /* deleted  */

        0xff,       /* accurate  */

        0x00036e9a, /* dchksum  */

        0x00d3,     /* nchksum  */

        0x08fb,     /* chksum  */

}

flash_safe_writev(c115eb60, 0066d4b0, c215de6c)

jffs_write_node(): Leaving...

jffs_insert_node(): ino = 207, version = 2, name = "", deleted = 0

jffs_insert_node():
---------------------------------------------------------------------- 1

jffs_update_file(): ino: 207, version: 2

jffs_delete_data(): offset = 0, remove_size = 0

jffs_insert_data(): node->data_offset = 0, node->data_size = 4096,
f->size = 0

jffs_insert_data(): f->size = 4096

jffs_remove_redundant_nodes(): ino: 207, name: "cp", newest_type: 7

jffs_remove_redundant_nodes(): Removing node: ino: 207, version: 1,
mod_type: 3

jffs_fmfree(): node->ino = 207, node->version = 1

thread_should_wake(): free=1645328, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

jffs_insert_node():
---------------------------------------------------------------------- 2

jffs_file_write(): new f_pos 4096.

file_write(): up biglock

***jffs_file_write(): inode: 0xc2dda2e0 (ino: 207), filp: 0xc370ee40,
buf: 0xc1682000, count: 4096

file_write(): down biglock

jffs_write_node(): filename = "cp", ino = 207, total_size = 4160

jffs_fmalloc(): fmc = 0xc3a7cf70, size = 4160, node = 0xc1399690

jffs_fmalloc(): free_chunk_size1 = 1645328, free_chunk_size2 = 0

struct jffs_fmcontrol: 0xc3a7cf70

{

        8388608, /* flash_size  */

        6747376, /* used_size  */

        64, /* dirty_size  */

        1641168, /* free_size  */

        262144, /* sector_size  */

        524288, /* min_free_size  */

        131072, /* max_chunk_size  */

        0xc115eb60, /* mtd  */

        0xc14561e0, /* head  */    (head->offset = 0x00000000)

        0xc1398240, /* tail  */    (tail->offset + tail->size =
0x0066f530)

        0x00000000, /* head_extra  */

        0x00000000, /* tail_extra  */

}

struct jffs_fm: 0xc1398240

{

       0x0066e4f0, /* offset  */

       4160, /* size  */

       0xc1398220, /* prev  */

       0x00000000, /* next  */

       0xc2843800, /* nodes  */

}

jffs_write_node(): setting version of cp to 3

, result: 0x00075070

, result: 0x000000d3

, result: 0x000008c8

jffs_write_node(): About to write this raw inode to the flash at pos
0x66e4f0:

jffs_raw_inode: inode number: 207

{

        0x34383931, /* magic  */

        0x000000cf, /* ino  */

        0x00000001, /* pino  */

        0x00000003, /* version  */

        0x00008180, /* mode  */

        0x0000,     /* uid  */

        0x0000,     /* gid  */

        0x135951b9, /* atime  */

        0x135951b9, /* mtime  */

        0x135951b8, /* ctime  */

        0x00001000, /* offset  */

        0x00001000, /* dsize  */

        0x00000000, /* rsize  */

        0x02,       /* nsize  */

        0x01,       /* nlink  */

        0x00,       /* spare  */

        0,          /* rename  */

        0,          /* deleted  */

        0xff,       /* accurate  */

        0x00075070, /* dchksum  */

        0x00d3,     /* nchksum  */

        0x08c8,     /* chksum  */

}

flash_safe_writev(c115eb60, 0066e4f0, c215de6c)

jffs_write_node(): Leaving...

jffs_insert_node(): ino = 207, version = 3, name = "", deleted = 0

jffs_insert_node():
---------------------------------------------------------------------- 1

jffs_update_file(): ino: 207, version: 3

jffs_delete_data(): offset = 4096, remove_size = 0

jffs_insert_data(): node->data_offset = 4096, node->data_size = 4096,
f->size = 4096

jffs_insert_data(): f->size = 8192

jffs_remove_redundant_nodes(): ino: 207, name: "cp", newest_type: 7

thread_should_wake(): free=1641168, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

jffs_insert_node():
---------------------------------------------------------------------- 2

jffs_file_write(): new f_pos 8192.

file_write(): up biglock

***jffs_file_write(): inode: 0xc2dda2e0 (ino: 207), filp: 0xc370ee40,
buf: 0xc1683000, count: 4096

file_write(): down biglock

jffs_write_node(): filename = "cp", ino = 207, total_size = 4160

jffs_fmalloc(): fmc = 0xc3a7cf70, size = 4160, node = 0xc13996f0

jffs_fmalloc(): free_chunk_size1 = 1641168, free_chunk_size2 = 0

struct jffs_fmcontrol: 0xc3a7cf70

{

        8388608, /* flash_size  */

        6751536, /* used_size  */

        64, /* dirty_size  */

        1637008, /* free_size  */

        262144, /* sector_size  */

        524288, /* min_free_size  */

        131072, /* max_chunk_size  */

        0xc115eb60, /* mtd  */

        0xc14561e0, /* head  */    (head->offset = 0x00000000)

        0xc1398260, /* tail  */    (tail->offset + tail->size =
0x00670570)

        0x00000000, /* head_extra  */

        0x00000000, /* tail_extra  */

}

struct jffs_fm: 0xc1398260

{

       0x0066f530, /* offset  */

       4160, /* size  */

       0xc1398240, /* prev  */

       0x00000000, /* next  */

       0xc2843680, /* nodes  */

}

jffs_write_node(): setting version of cp to 4

, result: 0x0006d9a8

, result: 0x000000d3

, result: 0x0000099b

jffs_write_node(): About to write this raw inode to the flash at pos
0x66f530:

jffs_raw_inode: inode number: 207

{

        0x34383931, /* magic  */

        0x000000cf, /* ino  */

        0x00000001, /* pino  */

        0x00000004, /* version  */

        0x00008180, /* mode  */

        0x0000,     /* uid  */

        0x0000,     /* gid  */

        0x135951ba, /* atime  */

        0x135951ba, /* mtime  */

        0x135951b8, /* ctime  */

        0x00002000, /* offset  */

        0x00001000, /* dsize  */

        0x00000000, /* rsize  */

        0x02,       /* nsize  */

        0x01,       /* nlink  */

        0x00,       /* spare  */

        0,          /* rename  */

        0,          /* deleted  */

        0xff,       /* accurate  */

        0x0006d9a8, /* dchksum  */

        0x00d3,     /* nchksum  */

        0x099b,     /* chksum  */

}

flash_safe_writev(c115eb60, 0066f530, c215de6c)

jffs_write_node(): Leaving...

jffs_insert_node(): ino = 207, version = 4, name = "", deleted = 0

jffs_insert_node():
---------------------------------------------------------------------- 1

jffs_update_file(): ino: 207, version: 4

jffs_delete_data(): offset = 8192, remove_size = 0

jffs_insert_data(): node->data_offset = 8192, node->data_size = 4096,
f->size = 8192

jffs_insert_data(): f->size = 12288

jffs_remove_redundant_nodes(): ino: 207, name: "cp", newest_type: 7

thread_should_wake(): free=1637008, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

jffs_insert_node():
---------------------------------------------------------------------- 2

jffs_file_write(): new f_pos 12288.

file_write(): up biglock

thread_should_wake(): free=1637008, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

***jffs_file_write(): inode: 0xc2dda2e0 (ino: 207), filp: 0xc370ee40,
buf: 0xc1682000, count: 4096

file_write(): down biglock

jffs_write_node(): filename = "cp", ino = 207, total_size = 4160

jffs_fmalloc(): fmc = 0xc3a7cf70, size = 4160, node = 0xc1399720

jffs_fmalloc(): free_chunk_size1 = 1637008, free_chunk_size2 = 0

struct jffs_fmcontrol: 0xc3a7cf70

{

        8388608, /* flash_size  */

        6755696, /* used_size  */

        64, /* dirty_size  */

        1632848, /* free_size  */

        262144, /* sector_size  */

        524288, /* min_free_size  */

        131072, /* max_chunk_size  */

        0xc115eb60, /* mtd  */

        0xc14561e0, /* head  */    (head->offset = 0x00000000)

        0xc1398280, /* tail  */    (tail->offset + tail->size =
0x006715b0)

        0x00000000, /* head_extra  */

        0x00000000, /* tail_extra  */

}

struct jffs_fm: 0xc1398280

{

       0x00670570, /* offset  */

       4160, /* size  */

       0xc1398260, /* prev  */

       0x00000000, /* next  */

       0xc2843640, /* nodes  */

}

jffs_write_node(): setting version of cp to 5

, result: 0x00074fd2

, result: 0x000000d3

, result: 0x0000094f

jffs_write_node(): About to write this raw inode to the flash at pos
0x670570:

jffs_raw_inode: inode number: 207

{

        0x34383931, /* magic  */

        0x000000cf, /* ino  */

        0x00000001, /* pino  */

        0x00000005, /* version  */

        0x00008180, /* mode  */

        0x0000,     /* uid  */

        0x0000,     /* gid  */

        0x135951bb, /* atime  */

        0x135951bb, /* mtime  */

        0x135951b8, /* ctime  */

        0x00003000, /* offset  */

        0x00001000, /* dsize  */

        0x00000000, /* rsize  */

        0x02,       /* nsize  */

        0x01,       /* nlink  */

        0x00,       /* spare  */

        0,          /* rename  */

        0,          /* deleted  */

        0xff,       /* accurate  */

        0x00074fd2, /* dchksum  */

        0x00d3,     /* nchksum  */

        0x094f,     /* chksum  */

}

flash_safe_writev(c115eb60, 00670570, c215de6c)

jffs_write_node(): Leaving...

jffs_insert_node(): ino = 207, version = 5, name = "", deleted = 0

jffs_insert_node():
---------------------------------------------------------------------- 1

jffs_update_file(): ino: 207, version: 5

jffs_delete_data(): offset = 12288, remove_size = 0

jffs_insert_data(): node->data_offset = 12288, node->data_size = 4096,
f->size = 12288

jffs_insert_data(): f->size = 16384

jffs_remove_redundant_nodes(): ino: 207, name: "cp", newest_type: 7

thread_should_wake(): free=1632848, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

jffs_insert_node():
---------------------------------------------------------------------- 2

jffs_file_write(): new f_pos 16384.

file_write(): up biglock

***jffs_file_write(): inode: 0xc2dda2e0 (ino: 207), filp: 0xc370ee40,
buf: 0xc1683000, count: 4096

file_write(): down biglock

jffs_write_node(): filename = "cp", ino = 207, total_size = 4160

jffs_fmalloc(): fmc = 0xc3a7cf70, size = 4160, node = 0xc1399750

jffs_fmalloc(): free_chunk_size1 = 1632848, free_chunk_size2 = 0

struct jffs_fmcontrol: 0xc3a7cf70

{

        8388608, /* flash_size  */

        6759856, /* used_size  */

        64, /* dirty_size  */

        1628688, /* free_size  */

        262144, /* sector_size  */

        524288, /* min_free_size  */

        131072, /* max_chunk_size  */

        0xc115eb60, /* mtd  */

        0xc14561e0, /* head  */    (head->offset = 0x00000000)

        0xc13982a0, /* tail  */    (tail->offset + tail->size =
0x006725f0)

        0x00000000, /* head_extra  */

        0x00000000, /* tail_extra  */

}

struct jffs_fm: 0xc13982a0

{

       0x006715b0, /* offset  */

       4160, /* size  */

       0xc1398280, /* prev  */

       0x00000000, /* next  */

       0xc2843600, /* nodes  */

}

jffs_write_node(): setting version of cp to 6

, result: 0x0006354c

, result: 0x000000d3

, result: 0x000008c1

jffs_write_node(): About to write this raw inode to the flash at pos
0x6715b0:

jffs_raw_inode: inode number: 207

{

        0x34383931, /* magic  */

        0x000000cf, /* ino  */

        0x00000001, /* pino  */

        0x00000006, /* version  */

        0x00008180, /* mode  */

        0x0000,     /* uid  */

        0x0000,     /* gid  */

        0x135951bc, /* atime  */

        0x135951bc, /* mtime  */

        0x135951b8, /* ctime  */

        0x00004000, /* offset  */

        0x00001000, /* dsize  */

        0x00000000, /* rsize  */

        0x02,       /* nsize  */

        0x01,       /* nlink  */

        0x00,       /* spare  */

        0,          /* rename  */

        0,          /* deleted  */

        0xff,       /* accurate  */

        0x0006354c, /* dchksum  */

        0x00d3,     /* nchksum  */

        0x08c1,     /* chksum  */

}

flash_safe_writev(c115eb60, 006715b0, c215de6c)

jffs_write_node(): Leaving...

jffs_insert_node(): ino = 207, version = 6, name = "", deleted = 0

jffs_insert_node():
---------------------------------------------------------------------- 1

jffs_update_file(): ino: 207, version: 6

jffs_delete_data(): offset = 16384, remove_size = 0

jffs_insert_data(): node->data_offset = 16384, node->data_size = 4096,
f->size = 16384

jffs_insert_data(): f->size = 20480

jffs_remove_redundant_nodes(): ino: 207, name: "cp", newest_type: 7

thread_should_wake(): free=1628688, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

jffs_insert_node():
---------------------------------------------------------------------- 2

jffs_file_write(): new f_pos 20480.

file_write(): up biglock

***jffs_file_write(): inode: 0xc2dda2e0 (ino: 207), filp: 0xc370ee40,
buf: 0xc1682000, count: 4096

file_write(): down biglock

jffs_write_node(): filename = "cp", ino = 207, total_size = 4160

jffs_fmalloc(): fmc = 0xc3a7cf70, size = 4160, node = 0xc1399780

jffs_fmalloc(): free_chunk_size1 = 1628688, free_chunk_size2 = 0

struct jffs_fmcontrol: 0xc3a7cf70

{

        8388608, /* flash_size  */

        6764016, /* used_size  */

        64, /* dirty_size  */

        1624528, /* free_size  */

        262144, /* sector_size  */

        524288, /* min_free_size  */

        131072, /* max_chunk_size  */

        0xc115eb60, /* mtd  */

        0xc14561e0, /* head  */    (head->offset = 0x00000000)

        0xc13982c0, /* tail  */    (tail->offset + tail->size =
0x00673630)

        0x00000000, /* head_extra  */

        0x00000000, /* tail_extra  */

}

struct jffs_fm: 0xc13982c0

{

       0x006725f0, /* offset  */

       4160, /* size  */

       0xc13982a0, /* prev  */

       0x00000000, /* next  */

       0xc28435c0, /* nodes  */

}

jffs_write_node(): setting version of cp to 7

, result: 0x0004eda4

, result: 0x000000d3

, result: 0x000009e0

jffs_write_node(): About to write this raw inode to the flash at pos
0x6725f0:

jffs_raw_inode: inode number: 207

{

        0x34383931, /* magic  */

        0x000000cf, /* ino  */

        0x00000001, /* pino  */

        0x00000007, /* version  */

        0x00008180, /* mode  */

        0x0000,     /* uid  */

        0x0000,     /* gid  */

        0x135951bc, /* atime  */

        0x135951bc, /* mtime  */

        0x135951b8, /* ctime  */

        0x00005000, /* offset  */

        0x00001000, /* dsize  */

        0x00000000, /* rsize  */

        0x02,       /* nsize  */

        0x01,       /* nlink  */

        0x00,       /* spare  */

        0,          /* rename  */

        0,          /* deleted  */

        0xff,       /* accurate  */

        0x0004eda4, /* dchksum  */

        0x00d3,     /* nchksum  */

        0x09e0,     /* chksum  */

}

flash_safe_writev(c115eb60, 006725f0, c215de6c)

jffs_write_node(): Leaving...

jffs_insert_node(): ino = 207, version = 7, name = "", deleted = 0

jffs_insert_node():
---------------------------------------------------------------------- 1

jffs_update_file(): ino: 207, version: 7

jffs_delete_data(): offset = 20480, remove_size = 0

jffs_insert_data(): node->data_offset = 20480, node->data_size = 4096,
f->size = 20480

jffs_insert_data(): f->size = 24576

jffs_remove_redundant_nodes(): ino: 207, name: "cp", newest_type: 7

thread_should_wake(): free=1624528, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

jffs_insert_node():
---------------------------------------------------------------------- 2

jffs_file_write(): new f_pos 24576.

file_write(): up biglock

***jffs_readpage(): file = "cp", page->index = 6

readpage(): down biglock

readpage(): up biglock

jffs_readpage(): Leaving...

thread_should_wake(): free=1624528, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

thread_should_wake(): free=1624528, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

thread_should_wake(): free=1624528, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

thread_should_wake(): free=1624528, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

thread_should_wake(): free=1624528, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

thread_should_wake(): free=1624528, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

thread_should_wake(): free=1624528, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space

thread_should_wake(): free=1624528, dirty=64, blocksize=262144.

thread_should_wake(): Not waking. Insufficient dirty space



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
