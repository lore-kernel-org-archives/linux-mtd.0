Received: from avg3.hkpc.org ([202.64.133.85])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ImhR-0003lE-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 09:44:53 +0100
Received: from smtp2.hkpc.org ([202.64.133.13])
 by avg3.hkpc.org (NAVGW 2.5.2.11) with SMTP id M2002061416444429727
 for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 16:44:44 +0800
Date: Fri, 14 Jun 2002 16:46:47 +0800 (HKT)
From: Clifford Loo <kfloo@hkpc.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Problem putting JFFS on MTD 
In-Reply-To: <17643.1024039985@redhat.com>
Message-ID: <Pine.LNX.4.33.0206141627370.8899-100000@cliffordux.hkpc.org>
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
>> mount: /dev/mtdblock0 has wrong device number or fs type jffs not
>> supported and cp: cannot create regular file `/dev/mtd0': No such
>> device
>
>I'd strongly recommend using JFFS2, not JFFS.

Yes, I was thinking of migrating to JFFS2 after successfully setting up
JFFS which, unlike JFFS2, comes with my distribution of Linux for PPC.

> Do you definitely have the
>/dev/mtd* device nodes and CONFIG_MTD_BLOCK and CONFIG_MTD_CHAR?

Thanks for pointing this out.  I had made the device nodes with MAKEDEV so
that was no problem; but the CONFIG_MTD_* flags were the missing link
(and they were not mentioned in the only documentation I find, the
"mtd-jffs-HOWTO.txt").

I can now mount an erased mtdblock device directly to "/mnt/jffs".  But
creating files or directories results in I/O errors:

----------------------------------------------------------------------------
bash# cp /linuxrc /mnt/jffs/testfile.txt
jffs_lookup(): dir: 0xc0ef0980, name: "testfile.txt"
lookup(): down biglock
jffs_find_child()
jffs_find_child(): Didn't find the file "testfile.txt".
jffs_lookup(): Couldn't find the file. f = 0x00000000, name =
"testfile.txt", d = 0xc0daef40, d->ino = 1
lookup(): up biglock
jffs_create(): dir: 0xc0ef0980, name: "testfile.txt"
create(): down biglock
jffs_write_node(): filename = "testfile.txt", ino = 5, total_size = 72
jffs_fmalloc(): fmc = 0xc0daeec0, size = 72, node = 0xc0da1810
Free size accounting screwed
free_chunk_size1 == 0x3fff4c, free_chunk_size2 == 0x0, fmc->free_size ==
0x3fff38jffs_fmalloc(): free_chunk_size1 = 4194124, free_chunk_size2 = 0
struct jffs_fmcontrol: 0xc0daeec0
{
        0x00000000, /* flash_start  */
        4194304, /* flash_size  */
        72, /* used_size  */
        180, /* dirty_size  */
        4194032, /* free_size  */
        131072, /* sector_size  */
        262144, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc0d91da0, /* mtd  */
        0xc0da0620, /* head  */    (head->offset = 0x00000000)
        0xc0da0540, /* tail  */    (tail->offset + tail->size =
0x000000fc)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
}
struct jffs_fm: 0xc0da0540
{
       0x000000b4, /* offset  */
       72, /* size  */
       0xc0da07e0, /* prev  */
       0x00000000, /* next  */
       0xc0da0aa0, /* nodes  */
}
, result: 0x00000000
, result: 0x000004ee
, result: 0x00000bd7
jffs_write_node(): About to write this raw inode to the flash at pos 0xb4:
jffs_raw_inode: inode number: 5
{
        0x34383931, /* magic  */
        0x00000005, /* ino  */
        0x00000001, /* pino  */
        0x00000001, /* version  */
        0x00008180, /* mode  */
        0x0000,     /* uid  */
        0x0000,     /* gid  */
        0xbfedf85a, /* atime  */
        0xbfedf85a, /* mtime  */
        0xbfedf85a, /* ctime  */
        0x00000000, /* offset  */
        0x00000000, /* dsize  */
        0x00000000, /* rsize  */
        0x0c,       /* nsize  */
        0x01,       /* nlink  */
        0x00,       /* spare  */
        0,          /* rename  */
        0,          /* deleted  */
        0xff,       /* accurate  */
        0x00000000, /* dchksum  */
        0x04ee,     /* nchksum  */
        0x0bd7,     /* chksum  */
}
Didn't write all bytes in flash_safe_write(). Returned -5
***jffs_fmfree_partly(): fm = 0xc0da0540, fm->nodes = 0xc0da0aa0,
fm->nodes->node->ino = 10, size = 12
JFFS: jffs_write_node: Failed to write raw_inode.
jffs_create(): jffs_write_node() failed.
create(): up biglock
cp: cannot create regular file `/mnt/jffs/testfile.txt': I/O error

----------------------------------------------------------------------------
bash# mkdir /mnt/jffs/testdir
jffs_lookup(): dir: 0xc0ef0980, name: "testdir"
lookup(): down biglock
jffs_find_child()
jffs_find_child(): Didn't find the file "testdir".
jffs_lookup(): Couldn't find the file. f = 0x00000000, name = "testdir", d
= 0xc0daef40, d->ino = 1
lookup(): up biglock
***jffs_mkdir(): dir = 0xc0ef0980, name = "testdir", len = 7, mode =
0x000001ff
mkdir(): down biglock
jffs_write_node(): filename = "testdir", ino = 6, total_size = 68
jffs_fmalloc(): fmc = 0xc0daeec0, size = 68, node = 0xc0da1810
Free size accounting screwed
free_chunk_size1 == 0x3fff10, free_chunk_size2 == 0x0, fmc->free_size ==
0x3ffef0jffs_fmalloc(): free_chunk_size1 = 4194064, free_chunk_size2 = 0
struct jffs_fmcontrol: 0xc0daeec0
{
        0x00000000, /* flash_start  */
        4194304, /* flash_size  */
        68, /* used_size  */
        240, /* dirty_size  */
        4193964, /* free_size  */
        131072, /* sector_size  */
        262144, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc0d91da0, /* mtd  */
        0xc0da0620, /* head  */    (head->offset = 0x00000000)
        0xc0da0aa0, /* tail  */    (tail->offset + tail->size =
0x00000134)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
}
struct jffs_fm: 0xc0da0aa0
{
       0x000000f0, /* offset  */
       68, /* size  */
       0xc0da0540, /* prev  */
       0x00000000, /* next  */
       0xc0da0ac0, /* nodes  */
}
, result: 0x00000000
, result: 0x000002ff
, result: 0x00000d14
jffs_write_node(): About to write this raw inode to the flash at pos 0xf0:
jffs_raw_inode: inode number: 6
{
        0x34383931, /* magic  */
        0x00000006, /* ino  */
        0x00000001, /* pino  */
        0x00000001, /* version  */
        0x000041ff, /* mode  */
        0x0000,     /* uid  */
        0x0000,     /* gid  */
        0xbfedf8ab, /* atime  */
        0xbfedf8ab, /* mtime  */
        0xbfedf8ab, /* ctime  */
        0x00000000, /* offset  */
        0x00000000, /* dsize  */
        0x00000000, /* rsize  */
        0x07,       /* nsize  */
        0x01,       /* nlink  */
        0x00,       /* spare  */
        0,          /* rename  */
        0,          /* deleted  */
        0xff,       /* accurate  */
        0x00000000, /* dchksum  */
        0x02ff,     /* nchksum  */
        0x0d14,     /* chksum  */
}
Didn't write all bytes in flash_safe_write(). Returned -5
***jffs_fmfree_partly(): fm = 0xc0da0aa0, fm->nodes = 0xc0da0ac0,
fm->nodes->node->ino = 10, size = 8
JFFS: jffs_write_node: Failed to write raw_inode.
jffs_mkdir(): jffs_write_node() failed.
mkdir(): up biglock
mkdir: cannot make directory `/mnt/jffs/testdir': I/O error

----------------------------------------------------------------------------
bash# cp /jffs.image /dev/mtd0
MTD_open
MTD_write
cp: /dev/mtd0: I/O error
MTD_close
sync
sync end

----------------------------------------------------------------------------
bash# ls -la /mnt/jffs
readdir(): down biglock
jffs_readdir(): inode: 0xc0ef0980, filp: 0xc0fa16c0
jffs_readdir(): "." 1
jffs_readdir(): ".." 1
readdir(): up biglock
readdir(): down biglock
jffs_readdir(): inode: 0xc0ef0980, filp: 0xc0fa16c0
readdir(): up biglock
total 1
drwxr-xr-x   1 0        0               0 Dec  9 17:54 .
drwxr-xr-x   3 0        0            1024 Jun 11  2002 ..
bash# ls -l /dev/mtd? /dev/mtdblock?
crw-r--r--   1 0        0         90,   0 Jun 11  2002 /dev/mtd0
crw-r--r--   1 0        0         90,   2 Jun 11  2002 /dev/mtd1
crw-r--r--   1 0        0         90,   4 Jun 11  2002 /dev/mtd2
crw-r--r--   1 0        0         90,   6 Jun 11  2002 /dev/mtd3
crw-r--r--   1 0        0         90,   8 Jun 11  2002 /dev/mtd4
crw-r--r--   1 0        0         90,  10 Jun 11  2002 /dev/mtd5
crw-r--r--   1 0        0         90,  12 Jun 11  2002 /dev/mtd6
crw-r--r--   1 0        0         90,  14 Jun 11  2002 /dev/mtd7
crw-r--r--   1 0        0         90,  16 Jun 11  2002 /dev/mtd8
crw-r--r--   1 0        0         90,  18 Jun 11  2002 /dev/mtd9
brw-r--r--   1 0        0         31,   0 Jun 11  2002 /dev/mtdblock0
brw-r--r--   1 0        0         31,   1 Jun 11  2002 /dev/mtdblock1
brw-r--r--   1 0        0         31,   2 Jun 11  2002 /dev/mtdblock2
brw-r--r--   1 0        0         31,   3 Jun 11  2002 /dev/mtdblock3
brw-r--r--   1 0        0         31,   4 Jun 11  2002 /dev/mtdblock4
brw-r--r--   1 0        0         31,   5 Jun 11  2002 /dev/mtdblock5
brw-r--r--   1 0        0         31,   6 Jun 11  2002 /dev/mtdblock6
brw-r--r--   1 0        0         31,   7 Jun 11  2002 /dev/mtdblock7
brw-r--r--   1 0        0         31,   8 Jun 11  2002 /dev/mtdblock8
brw-r--r--   1 0        0         31,   9 Jun 11  2002 /dev/mtdblock9
bash#

-- 
Clifford
