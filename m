Received: from motgate3.mot.com ([144.189.100.103])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C10HO-0004Vx-JZ
	for linux-mtd@lists.infradead.org; Sat, 28 Aug 2004 06:17:54 -0400
Received: from az33exr01.mot.com (az33exr01.mot.com [10.64.251.231])
	by motgate3.mot.com (Motorola/Motgate3) with ESMTP id i7SAHiVZ021369
	for <linux-mtd@lists.infradead.org>;
	Sat, 28 Aug 2004 03:17:44 -0700 (MST)
Received: from ex-deu-munich02.force.de (ex-deu-munich02.ea.mot.com
	[10.254.2.10])
	by az33exr01.mot.com (Motorola/az33exr01) with ESMTP id i7SA9kFT006578
	for <linux-mtd@lists.infradead.org>; Sat, 28 Aug 2004 05:09:47 -0500
Message-ID: <903E17B6FF22A24C96B4E28C2C0214D7025D7F8C@sr-bng-exc01.ap.mot.com>
From: "Kodandaram, Harish" <Harish.Kodandaram@fci.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Sat, 28 Aug 2004 15:47:50 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: failing to edit files in mtdblock0 after mounting a jffs image
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Hi all,
> 
> and Thank you Josh Boyer,
> I'm looking into those spurious interrupts that are generated. 
> 
> Regarding my problem i've mailed in previous mail, this is the dmesg dump
> during crash.
> In brief:
> 
> I am able create partition, do raw copy and raw read into flash device. I
> can successfully mount the jffs filesystem. Once mounted i can create and
> edit new files, but when i try to edit existing files Segmentation Fault
> is occurring.
> 
> dmesg dump:
> **************************************************************************
> *****************************
> 000f3ed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000f4ed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000f5ed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000f6ed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000f7ed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000f8ed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000f9ed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000faed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000fbed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000fced0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000fded0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000feed0, f7776000, 00001000)
> flash_safe_read(f7e5a484, 000ffed0, f7776000, 00000130)
> jffs_scan_flash():0xffffffff ended at pos 0x100000.
> Free space accepted: Starting 0x6ed0 for 0xf9130 bytes
> was hole = 0 end_offset = 0
> now = f9130 end_offset = 100000
> jffs_build_end()
> struct jffs_fmcontrol: 0xf75d929c
> {
>         1048576, /* flash_size  */
>         28368, /* used_size  */
>         0, /* dirty_size  */
>         1020208, /* free_size  */
>         131072, /* sector_size  */
>         524288, /* min_free_size  */
>         65536, /* max_chunk_size  */
>         0xf7e5a484, /* mtd  */
>         0xf71d5224, /* head  */    (head->offset = 0x00000000)
>         0xf71d5390, /* tail  */    (tail->offset + tail->size =
> 0x00006ed0)
>         0x00000000, /* head_extra  */
>         0x00000000, /* tail_extra  */
> }
> jffs_scan_flash(): Leaving...
> jffs_find_file(): ino: 1
> jffs_find_file(): Found file with ino 1. (name: "")
> jffs_possibly_delete_file(): ino: 1
> jffs_possibly_delete_file(): ino: 2
> jffs_possibly_delete_file(): ino: 3
> jffs_possibly_delete_file(): ino: 4
> jffs_possibly_delete_file(): ino: 5
> jffs_fmfree(): node->ino = 5, node->version = 1
> jffs_fmfree(): node->ino = 5, node->version = 2
> jffs_unlink_file_from_hash(): f: 0xf75d9544, ino 5
> jffs_free_node_list(): f #5, ".config.swp"
> jffs_free_file: f #5, ".config.swp"
> jffs_possibly_delete_file(): ino: 6
> jffs_fmfree(): node->ino = 6, node->version = 1
> jffs_fmfree(): node->ino = 6, node->version = 2
> jffs_unlink_file_from_hash(): f: 0xf75d95cc, ino 6
> jffs_free_node_list(): f #6, ".config.swpx"
> jffs_free_file: f #6, ".config.swpx"
> jffs_possibly_delete_file(): ino: 7
> jffs_possibly_delete_file(): ino: 8
> jffs_fmfree(): node->ino = 8, node->version = 1
> jffs_fmfree(): node->ino = 8, node->version = 2
> jffs_unlink_file_from_hash(): f: 0xf75d96dc, ino 8
> jffs_free_node_list(): f #8, ".config.swpx"
> jffs_free_file: f #8, ".config.swpx"
> jffs_possibly_delete_file(): ino: 9
> jffs_fmfree(): node->ino = 9, node->version = 1
> jffs_fmfree(): node->ino = 9, node->version = 2
> jffs_unlink_file_from_hash(): f: 0xf75d9764, ino 9
> jffs_free_node_list(): f #9, ".config.swpx"
> jffs_free_file: f #9, ".config.swpx"
> jffs_remove_redundant_nodes(): ino: 1, name: "", newest_type: 1
> jffs_remove_redundant_nodes(): ino: 2, name: "config", newest_type: 7
> jffs_remove_redundant_nodes(): ino: 3, name: "temp", newest_type: 7
> jffs_remove_redundant_nodes(): ino: 4, name: "temp1", newest_type: 7
> jffs_remove_redundant_nodes(): ino: 7, name: ".config.swp", newest_type: 7
> jffs_remove_redundant_nodes(): Removing node: ino: 7, version: 1,
> mod_type: 3
> jffs_fmfree(): node->ino = 7, node->version = 1
> jffs_insert_file_into_tree(): name: ""
> jffs_find_file(): ino: 0
> jffs_find_file(): Didn't find file with ino 0.
> jffs_insert_file_into_tree(): name: "config"
> jffs_find_file(): ino: 1
> jffs_find_file(): Found file with ino 1. (name: "")
> jffs_insert_file_into_tree(): name: "temp"
> jffs_find_file(): ino: 1
> jffs_find_file(): Found file with ino 1. (name: "")
> jffs_insert_file_into_tree(): name: "temp1"
> jffs_find_file(): ino: 1
> jffs_find_file(): Found file with ino 1. (name: "")
> jffs_insert_file_into_tree(): name: ".config.swp"
> jffs_find_file(): ino: 1
> jffs_find_file(): Found file with ino 1. (name: "")
> jffs_build_file(): ino: 1, name: ""
> jffs_update_file(): ino: 1, version: 1
> jffs_build_file(): ino: 2, name: "config"
> jffs_update_file(): ino: 2, version: 1
> jffs_delete_data(): offset = 0, remove_size = 0
> jffs_insert_data(): node->data_offset = 0, node->data_size = 23306,
> f->size = 0
> jffs_insert_data(): f->size = 23306
> jffs_build_file(): ino: 3, name: "temp"
> jffs_update_file(): ino: 3, version: 1
> jffs_delete_data(): offset = 0, remove_size = 0
> jffs_insert_data(): node->data_offset = 0, node->data_size = 10, f->size =
> 0
> jffs_insert_data(): f->size = 10
> jffs_build_file(): ino: 4, name: "temp1"
> jffs_update_file(): ino: 4, version: 1
> jffs_delete_data(): offset = 0, remove_size = 0
> jffs_insert_data(): node->data_offset = 0, node->data_size = 19, f->size =
> 0
> jffs_insert_data(): f->size = 19
> jffs_build_file(): ino: 7, name: ".config.swp"
> jffs_update_file(): ino: 7, version: 2
> jffs_delete_data(): offset = 0, remove_size = 0
> jffs_insert_data(): node->data_offset = 0, node->data_size = 4096, f->size
> = 0
> jffs_insert_data(): f->size = 4096
> JFFS: Dumping the file system's hash table...
> *** c->hash[1]: "" (ino: 1, pino: 0)
> *** c->hash[2]: "config" (ino: 2, pino: 1)
> *** c->hash[3]: "temp" (ino: 3, pino: 1)
> *** c->hash[4]: "temp1" (ino: 4, pino: 1)
> *** c->hash[7]: ".config.swp" (ino: 7, pino: 1)
> / (ino: 1, highest_version: 1, size: 0)
>   .config.swp (ino: 7, highest_version: 2, size: 4096)
>   temp1 (ino: 4, highest_version: 1, size: 19)
>   temp (ino: 3, highest_version: 1, size: 10)
>   config (ino: 2, highest_version: 1, size: 23306)
> jffs_read_inode(): inode->i_ino == 1
> read_inode(): down biglock
> jffs_find_file(): ino: 1
> jffs_find_file(): Found file with ino 1. (name: "")
> read_inode(): up biglock
> JFFS: GC thread pid=545.
> JFFS: Successfully mounted device 1f:00.
> jffs_garbage_collect_thread(): Starting infinite loop.
> thread_should_wake(): free=1020208, dirty=600, blocksize=131072.
> thread_should_wake(): Not waking. Insufficient dirty space
> readdir(): down biglock
> jffs_readdir(): inode: 0xf71d7500, filp: 0xf7713344
> jffs_readdir(): "." 1
> jffs_readdir(): ".." 1
> jffs_readdir(): ".config.swp" ino: 7
> jffs_readdir(): "temp1" ino: 4
> jffs_readdir(): "temp" ino: 3
> jffs_readdir(): "config" ino: 2
> readdir(): up biglock
> readdir(): down biglock
> jffs_readdir(): inode: 0xf71d7500, filp: 0xf7713344
> readdir(): up biglock
> jffs_lookup(): dir: 0xf71d7500, name: "config"
> lookup(): down biglock
> jffs_find_child()
> jffs_find_child(): Found "config".
> lookup(): up biglock
> jffs_read_inode(): inode->i_ino == 2
> read_inode(): down biglock
> jffs_find_file(): ino: 2
> jffs_find_file(): Found file with ino 2. (name: "config")
> read_inode(): up biglock
> lookup(): down biglock
> lookup(): up biglock
> jffs_lookup(): dir: 0xf71d7500, name: ".config.swp"
> lookup(): down biglock
> jffs_find_child()
> jffs_find_child(): Found ".config.swp".
> lookup(): up biglock
> jffs_read_inode(): inode->i_ino == 7
> read_inode(): down biglock
> jffs_find_file(): ino: 7
> jffs_find_file(): Found file with ino 7. (name: ".config.swp")
> read_inode(): up biglock
> lookup(): down biglock
> lookup(): up biglock
> jffs_lookup(): dir: 0xf71d7500, name: ".config.swpx"
> lookup(): down biglock
> jffs_find_child()
> jffs_find_child(): Didn't find the file ".config.swpx".
> jffs_lookup(): Couldn't find the file. f = 0x00000000, name =
> ".config.swpx", d = 0xf75d9324, d->ino = 1
> lookup(): up biglock
> jffs_create(): dir: 0xf71d7500, name: ".config.swpx"
> create(): down biglock
> jffs_write_node(): filename = ".config.swpx", ino = 10, total_size = 72
> jffs_fmalloc(): fmc = 0xf75d929c, size = 72, node = 0xf71d6304
> jffs_fmalloc(): free_chunk_size1 = 1020208, free_chunk_size2 = 0
> struct jffs_fmcontrol: 0xf75d929c
> {
>         1048576, /* flash_size  */
>         27840, /* used_size  */
>         600, /* dirty_size  */
>         1020136, /* free_size  */
>         131072, /* sector_size  */
>         524288, /* min_free_size  */
>         65536, /* max_chunk_size  */
>         0xf7e5a484, /* mtd  */
>         0xf71d5224, /* head  */    (head->offset = 0x00000000)
>         0xf71d53ac, /* tail  */    (tail->offset + tail->size =
> 0x00006f18)
>         0x00000000, /* head_extra  */
>         0x00000000, /* tail_extra  */
> }
> struct jffs_fm: 0xf71d53ac
> {
>        0x00006ed0, /* offset  */
>        72, /* size  */
>        0xf71d5390, /* prev  */
>        0x00000000, /* next  */
>        0xf71efe74, /* nodes  */
> }
> , result: 0x00000000
> , result: 0x000004a4
> , result: 0x00000985
> jffs_write_node(): About to write this raw inode to the flash at pos
> 0x6ed0:
> jffs_raw_inode: inode number: 10
> {
>         0x34383931, /* magic  */
>         0x0000000a, /* ino  */
>         0x00000001, /* pino  */
>         0x00000001, /* version  */
>         0x00008180, /* mode  */
>         0x0000,     /* uid  */
>         0x0000,     /* gid  */
>         0x40ddf43e, /* atime  */
>         0x40ddf43e, /* mtime  */
>         0x40ddf43e, /* ctime  */
>         0x00000000, /* offset  */
>         0x00000000, /* dsize  */
>         0x00000000, /* rsize  */
>         0x0c,       /* nsize  */
>         0x01,       /* nlink  */
>         0x00,       /* spare  */
>         0,          /* rename  */
>         0,          /* deleted  */
>         0xff,       /* accurate  */
>         0x00000000, /* dchksum  */
>         0x04a4,     /* nchksum  */
>         0x0985,     /* chksum  */
> }
> flash_safe_writev(f7e5a484, 00006ed0, f71d1e70)
> jffs_write_node(): Leaving...
> jffs_insert_node(): ino = 10, version = 1, name = ".config.swpx", deleted
> = 0
> jffs_find_file(): ino: 10
> jffs_find_file(): Didn't find file with ino 10.
> jffs_insert_file_into_hash(): f->ino: 10
> jffs_insert_node(): Updated the name of the file to ".config.swpx".
> jffs_insert_node():
> ---------------------------------------------------------------------- 1
> jffs_insert_file_into_tree(): name: ".config.swpx"
> jffs_find_file(): ino: 1
> jffs_find_file(): Found file with ino 1. (name: "")
> jffs_remove_redundant_nodes(): ino: 10, name: ".config.swpx", newest_type:
> 3
> thread_should_wake(): free=1020136, dirty=600, blocksize=131072.
> thread_should_wake(): Not waking. Insufficient dirty space
> jffs_insert_node():
> ---------------------------------------------------------------------- 2
> jffs_find_file(): ino: 10
> jffs_find_file(): Found file with ino 10. (name: ".config.swpx")
> create(): up biglock
> ***jffs_unlink()
> unlink(): down biglock
> ***jffs_remove(): file = ".config.swpx", ino = 10
> jffs_find_child()
> jffs_find_child(): Found ".config.swpx".
> jffs_write_node(): filename = "", ino = 10, total_size = 60
> jffs_fmalloc(): fmc = 0xf75d929c, size = 60, node = 0xf71d641c
> jffs_fmalloc(): free_chunk_size1 = 1020136, free_chunk_size2 = 0
> struct jffs_fmcontrol: 0xf75d929c
> {
>         1048576, /* flash_size  */
>         27900, /* used_size  */
>         600, /* dirty_size  */
>         1020076, /* free_size  */
>         131072, /* sector_size  */
>         524288, /* min_free_size  */
>         65536, /* max_chunk_size  */
>         0xf7e5a484, /* mtd  */
>         0xf71d5224, /* head  */    (head->offset = 0x00000000)
>         0xf71d53c8, /* tail  */    (tail->offset + tail->size =
> 0x00006f54)
>         0x00000000, /* head_extra  */
>         0x00000000, /* tail_extra  */
> }
> struct jffs_fm: 0xf71d53c8
> {
>        0x00006f18, /* offset  */
>        60, /* size  */
>        0xf71d53ac, /* prev  */
>        0x00000000, /* next  */
>        0xf71efe4c, /* nodes  */
> }
> jffs_write_node(): setting version of .config.swpx to 2
> , result: 0x00000000
> , result: 0x00000000
> , result: 0x00000952
> jffs_write_node(): About to write this raw inode to the flash at pos
> 0x6f18:
> jffs_raw_inode: inode number: 10
> {
>         0x34383931, /* magic  */
>         0x0000000a, /* ino  */
>         0x00000001, /* pino  */
>         0x00000002, /* version  */
>         0x00008180, /* mode  */
>         0x0000,     /* uid  */
>         0x0000,     /* gid  */
>         0x40ddf43e, /* atime  */
>         0x40ddf43e, /* mtime  */
>         0x40ddf43e, /* ctime  */
>         0x00000000, /* offset  */
>         0x00000000, /* dsize  */
>         0x00000000, /* rsize  */
>         0x00,       /* nsize  */
>         0x01,       /* nlink  */
>         0x00,       /* spare  */
>         0,          /* rename  */
>         1,          /* deleted  */
>         0xff,       /* accurate  */
>         0x00000000, /* dchksum  */
>         0x0000,     /* nchksum  */
>         0x0952,     /* chksum  */
> }
> flash_safe_writev(f7e5a484, 00006f18, f71d1ea4)
> jffs_write_node(): Leaving...
> jffs_insert_node(): ino = 10, version = 2, name = "", deleted = 1
> jffs_insert_node():
> ---------------------------------------------------------------------- 1
> jffs_remove_redundant_nodes(): ino: 10, name: ".config.swpx", newest_type:
> 1
> thread_should_wake(): free=1020076, dirty=600, blocksize=131072.
> thread_should_wake(): Not waking. Insufficient dirty space
> jffs_insert_node():
> ---------------------------------------------------------------------- 2
> jffs_delete_inode(): inode->i_ino == 10
> jffs_find_file(): ino: 10
> jffs_find_file(): Found file with ino 10. (name: ".config.swpx")
> jffs_possibly_delete_file(): ino: 10
> jffs_fmfree(): node->ino = 10, node->version = 1
> jffs_fmfree(): node->ino = 10, node->version = 2
> jffs_unlink_file_from_tree(): ino: 10, pino: 1, name: ".config.swpx"
> f->parent=f75d9324
> jffs_unlink_file_from_hash(): f: 0xf75d9a94, ino 10
> jffs_free_node_list(): f #10, ".config.swpx"
> jffs_free_file: f #10, ".config.swpx"
> unlink(): up biglock
> jffs_lookup(): dir: 0xf71d7500, name: ".config.swx"
> lookup(): down biglock
> jffs_find_child()
> jffs_find_child(): Didn't find the file ".config.swx".
> jffs_lookup(): Couldn't find the file. f = 0x00000000, name =
> ".config.swx", d = 0xf75d9324, d->ino = 1
> lookup(): up biglock
> ***jffs_readpage(): file = ".config.swp", page->index = 0
> readpage(): down biglock
> jffs_read_data(): file = ".config.swp", read_offset = 0, size = 4096
>   jffs_get_node_data(): file: ".config.swp", ino: 7, version: 2,
> node_offset: 0
> jffs_get_node_data
> flash_safe_read(f7e5a484, 00005dc8, 00000000, 00001000)
> Unable to handle kernel NULL pointer dereference at virtual address
> 00000000
>  printing eip:
> c024db99
> *pde = 00000000
> Oops: 0002
>  
> CPU:    0
> EIP:    0060:[<c024db99>]    Not tainted
> EFLAGS: 00010216
> EIP is at cpci747_uflash_copy_from+0xc9/0x110 [kernel]
> eax: f9749dc8   ebx: 00001000   ecx: 00000400   edx: f71d0000
> esi: f9749dc8   edi: 00000000   ebp: 00000000   esp: f71d1d84
> ds: 0068   es: 0068   ss: 0068
> Process vim (pid: 549, stackpage=f71d1000)
> Stack: f9749dc8 c030209e 000000a0 f71d0000 f71d0000 00005dc8 00000000
> 00000000 
>        c024c1be c03db8c0 00000000 00005dc8 00001000 f7bbdadc 00005dc8
> 00001000 
>        f7bbdb18 00000000 00001000 c0249bed c03db8c0 f7bbdb18 00005dc8
> 00000000 
> Call Trace:
>  [<c024c1be>] do_read_onechip+0x9e/0x170 [kernel]
>  [<c0249bed>] cfi_intelext_read+0xbd/0xf0 [kernel]
>  [<c0243b7f>] part_read+0x6f/0x100 [kernel]
>  [<c011c254>] release_console_sem+0xc4/0xd0 [kernel]
>  [<c01d1dad>] flash_safe_read+0x6d/0xa0 [kernel]
>  [<c01d44f6>] jffs_get_node_data+0x86/0xc0 [kernel]
>  [<c01d464d>] jffs_read_data+0x11d/0x150 [kernel]
>  [<c01d79f7>] jffs_do_readpage_nolock+0xd7/0x180 [kernel]
>  [<c01d7abf>] jffs_readpage+0x1f/0x40 [kernel]
>  [<c0138413>] do_generic_file_read+0x2b3/0x4b0 [kernel]
>  [<c015462c>] permission+0x8c/0xa0 [kernel]
>  [<c0138a72>] generic_file_read+0xb2/0x170 [kernel]
>  [<c01388c0>] file_read_actor+0x0/0x100 [kernel]
>  [<c013edad>] kmem_cache_free_one+0xed/0x200 [kernel]
>  [<c0148353>] sys_read+0xa3/0x120 [kernel]
>  [<c0107a8f>] system_call+0x33/0x38 [kernel]
> 
> Code: f3 a5 f6 c3 02 74 02 66 a5 f6 c3 01 74 01 a4 8b 44 24 0c ff 
>  <6>note: vim[549] exited with preempt_count 2
> **************************************************************************
> ******************
> 
> 
> If we analyze the call trace the panic is occurring in function
> do_read_onechip: 
> This function intern calls "uflash_copy_from" function, which is
> programmer defined function specific to flash in struct map_info. For this
> function arguments are 
> 
> 	map_info structure
> 	"to" address of memory
> 	"from" offset in flash
> 	"size".
> 
> the problem is that "to" argument which it is getting is NULL. This
> function when tries to call "memcpy_fromio", an architecture specific
> function to copy data from flash to memory, oops is caused with "Unable to
> handle kernel NULL pointer dereference at virtual address 00000000" error.
> 
> Desperately waiting for your responses
> Thanks in advance
> Harish
> 
> 
> 
> 
> 
> -----Original Message-----
> From: Josh Boyer [mailto:jdub@us.ibm.com]
> Sent: Thursday, August 26, 2004 9:19 PM
> To: Kodandaram, Harish
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: failing to edit files in mtdblock0 after mounting a jffs
> image
> 
> 
> On Thu, 2004-08-26 at 10:08, Kodandaram, Harish wrote:
> > > Jun  1 04:42:09 10 kernel:  printing eip:
> > > Jun  1 04:42:09 10 kernel: c024cb00
> > > Jun  1 04:42:09 10 kernel: Oops: 0002
> > > Jun  1 04:42:09 10 kernel:  
> > > Jun  1 04:42:09 10 kernel: CPU:    0
> > > Jun  1 04:42:09 10 kernel: EIP:    0060:[ip_send_check+32/80]    Not
> > > tainted
> > > Jun  1 04:42:09 10 kernel: EFLAGS: 00010216
> > > Jun  1 04:42:09 10 kernel: eax: f9744080   ebx: 00001000   ecx:
> 00000400
> > > edx: f71aa000
> > > Jun  1 04:42:09 10 kernel: esi: f9744080   edi: 00000000   ebp:
> f71abd74
> > > esp: f71abd58
> > > Jun  1 04:42:09 10 kernel: ds: 0068   es: 0068   ss: 0068
> > > Jun  1 04:42:09 10 kernel: Process vim (pid: 555, stackpage=f71ab000)
> > > Jun  1 04:42:09 10 kernel: Stack: f9744080 c02f6a4c 00000082 f71aa000
> > > f71aa000 00000080 00000000 f71abda4 
> > > Jun  1 04:42:09 10 kernel:        c024b17a c03458a0 00000000 00000080
> > > 00001000 00000000 f7ba59ec 00000080 
> > > Jun  1 04:42:09 10 kernel:        00001000 00001000 00000000 f71abde0
> > > c0248cbc c03458a0 f7ba5a28 00000080 
> > > Jun  1 04:42:09 10 kernel: Call Trace: [ip_options_rcv_srr+442/448]
> > > [ip_rcv_finish+12/592]  [netlink_recvmsg+82/368]
> [do_con_write+1635/1776]
> > > [rs_interrupt+117/352]  [rs_interrupt_single+121/304]
> [rmqueue+171/592]
> > > [block_til_ready+454/736]  [block_til_ready+670/736]
> > > [set_page_dirty+78/112]  [invalidate_list_pages2+160/176]
> > > [generic_buffer_fdatasync+184/256]  [invalidate_list_pages2+160/176]
> > > [get_device_list+37/128]  [spurious_interrupt_bug+7/24] 
> > > Jun  1 04:42:09 10 kernel: Code: f3 a5 f6 c3 02 74 02 66 a5 f6 c3 01
> 74 01
> > > a4 8b 45 f0 ff 48 
> > > Jun  1 04:42:09 10 kernel:  <6>note: vim[555] exited with
> preempt_count 2
> >
> **************************************************************************
> **
> > ******** 
> 
> Um...  maybe I am wrong, but doesn't your oops show you got a spurious
> interrupt?  If so, how is that related to MTD?
> 
> josh
> 
