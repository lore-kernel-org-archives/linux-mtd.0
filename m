Received: from avg3.hkpc.org ([202.64.133.85])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17InBl-0003pd-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 10:16:14 +0100
Received: from smtp2.hkpc.org ([202.64.133.13])
 by avg3.hkpc.org (NAVGW 2.5.2.11) with SMTP id M2002061417155907011
 for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 17:15:59 +0800
Date: Fri, 14 Jun 2002 17:18:23 +0800 (HKT)
From: Clifford Loo <kfloo@hkpc.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Problem putting JFFS on MTD 
In-Reply-To: <19580.1024044614@redhat.com>
Message-ID: <Pine.LNX.4.33.0206141703010.8899-100000@cliffordux.hkpc.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 14 Jun 2002, David Woodhouse wrote:
>
>kfloo@hkpc.org said:
>>  I can now mount an erased mtdblock device directly to "/mnt/jffs".
>> But creating files or directories results in I/O errors:
>
>Hmmm. No message from the flash driver when this happens? They're not from
>JFFS, they're from the flash driver itself.

I'm not sure what's from the flash driver itself, but there's no "Flash
writer error" or anything like that.  In any case I've attached all the
log messages leading up to the "I/O error" in my previous post.  For the
mount command, here's an excerpt of the debug message:

bash# mount -t jffs /dev/mtdblock0 /mnt/jffs
mtdblock_open
ok
JFFS: Trying to mount device 1f:00.
jffs_build_fs()
jffs_create_control()
jffs_build_begin()
  fmc->flash_start = 0x00000000
  fmc->flash_size = 4194304 bytes
jffs_scan_flash(): start pos = 0x0, end = 0x400000
jffs_scan_flash(): 0xff at pos 0x0.
flash_safe_read(c0d91da0, 00000000, 00000000, c0e9b000)
jffs_scan_flash(): 0xff at pos 0x1000.
flash_safe_read(c0d91da0, 00000000, 00001000, c0e9b000)
jffs_scan_flash(): 0xff at pos 0x2000.
flash_safe_read(c0d91da0, 00000000, 00002000, c0e9b000)
jffs_scan_flash(): 0xff at pos 0x3000.
flash_safe_read(c0d91da0, 00000000, 00003000, c0e9b000)
jffs_scan_flash(): 0xff at pos 0x4000.
flash_safe_read(c0d91da0, 00000000, 00004000, c0e9b000)
[...]
jffs_scan_flash(): 0xff at pos 0x3fd000.
flash_safe_read(c0d91da0, 00000000, 003fd000, c0e9b000)
jffs_scan_flash(): 0xff at pos 0x3fe000.
flash_safe_read(c0d91da0, 00000000, 003fe000, c0e9b000)
jffs_scan_flash(): 0xff at pos 0x3ff000.
flash_safe_read(c0d91da0, 00000000, 003ff000, c0e9b000)
jffs_build_end()
struct jffs_fmcontrol: 0xc0daeec0
{
        0x00000000, /* flash_start  */
        4194304, /* flash_size  */
        0, /* used_size  */
        0, /* dirty_size  */
        4194304, /* free_size  */
        131072, /* sector_size  */
        262144, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc0d91da0, /* mtd  */
        0x00000000, /* head  */    (head->offset = 0x00000000)
        0x00000000, /* tail  */    (tail->offset + tail->size =
0x00000000)
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
JFFS: GC thread pid=12.
JFFS: Successfully mounted device 1f:00.
jffs_garbage_collect_thread(): Starting infinite loop.
thread_should_wake(): free=4194304, dirty=0, blocksize=131072.
bash#



-- 
Clifford
