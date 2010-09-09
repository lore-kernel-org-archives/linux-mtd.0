Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Otgy2-0006l5-NK
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 13:15:12 +0000
Message-ID: <4C88DDD5.4060507@parrot.com>
Date: Thu, 9 Sep 2010 15:15:01 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBI/UBIFS interrupted write page handling
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

we have nands where interrupted write page become unstable and can't be 
trusted.

All interrupted write page should be erased before further usage. This 
mean we should have an algorithm to identify them when mounting/scanning.

If we are writing PageX and it is interrupt by power cut. On reboot we 
could have the following case :
1) PageX empty. But we don't know if write process started and the page 
can't be written again
2) PageX contains invalid data (bad crc, ecc).
3) PageX contains valid data, but we don't know if the write finish and 
if the page is stable.

How ubi/ubifs detect this interrupt write pages ?

Only case 2 seems handled and it is not enough.

On one of our test, we are in case 3. Ubifs find a valid interrupt page 
on mount and trust it. Latter the page become corrupted [1] because it 
is unstable.



To identify a interrupted write page we :
- could use interrupted flags for static volume
- handle with care data move (copy flags) : if sqnum of the copy is the 
biggest, we should ignore it/copy it.
- use upper layer for dynamic volume. For ubifs this could be a journal.


Matthieu

PS : the same story happen for erase, but ubi should handle them correctly.

[1]

[   12.720244] UBIFS: un-mount UBI device 3, volume 0
[   12.760056] UBIFS: mounted UBI device 3, volume 0, name "system"
[   12.765919] UBIFS: file system size:   30601216 bytes (29884 KiB, 29
MiB, 241 LEBs)
[   12.773642] UBIFS: journal size:       1523712 bytes (1488 KiB, 1
MiB, 12 LEBs)
[   12.780868] UBIFS: media format:       w4/r0 (latest is w4/r0)
[   12.786668] UBIFS: default compressor: none
[   12.790852] UBIFS: reserved for root:  1445370 bytes (1411 KiB)
writing file '//mnt/dir06/file0046.bin' num=70, size=147120
writing file '//mnt/dir0c/file006c.bin' num=108, size=288146
[   13.491407] UBI error: ubi_io_read: error -74 while reading 60 bytes
from PEB 106:129480, read 60 bytes
[   13.500785] [<c00279f0>] (dump_stack+0x0/0x14) from [<c0161040>]
(ubi_io_read+0xf0/0x258)
[   13.508952] [<c0160f50>] (ubi_io_read+0x0/0x258) from [<c01603a0>]
(ubi_eba_read_leb+0x1b4/0x490)
[   13.517791] [<c01601ec>] (ubi_eba_read_leb+0x0/0x490) from
[<c015e3f0>] (ubi_leb_read+0xe8/0x138)
[   13.526649] [<c015e308>] (ubi_leb_read+0x0/0x138) from [<c00d0c48>]
(ubifs_read_node+0x40/0x190)
[   13.535423]  r7:00000002 r6:00000000 r5:c78489a0 r4:c78489a0
[   13.541065] [<c00d0c08>] (ubifs_read_node+0x0/0x190) from
[<c00d18b8>] (ubifs_read_node_wbuf+0x4c/0x204)
[   13.550547] [<c00d186c>] (ubifs_read_node_wbuf+0x0/0x204) from
[<c00e6b60>] (ubifs_tnc_read_node+0x5c/0xf8)
[   13.560274] [<c00e6b04>] (ubifs_tnc_read_node+0x0/0xf8) from
[<c00d32a8>] (matches_name+0x94/0xdc)
[   13.569218] [<c00d3214>] (matches_name+0x0/0xdc) from [<c00d3334>]
(resolve_collision+0x44/0x204)
[   13.578074] [<c00d32f0>] (resolve_collision+0x0/0x204) from
[<c00d45e4>] (ubifs_tnc_remove_nm+0xf0/0x108)
[   13.587615] [<c00d44f4>] (ubifs_tnc_remove_nm+0x0/0x108) from
[<c00c7f08>] (ubifs_jnl_rename+0x4f8/0x70c)
[   13.597169] [<c00c7a10>] (ubifs_jnl_rename+0x0/0x70c) from
[<c00caaf8>] (ubifs_rename+0x2b0/0x5e4)
[   13.606117] [<c00ca848>] (ubifs_rename+0x0/0x5e4) from [<c008581c>]
(vfs_rename+0x238/0x270)
[   13.614538] [<c00855e4>] (vfs_rename+0x0/0x270) from [<c0086e54>]
(sys_renameat+0x1b8/0x1cc)
[   13.622965] [<c0086c9c>] (sys_renameat+0x0/0x1cc) from [<c0086e8c>]
(sys_rename+0x24/0x28)
[   13.631213] [<c0086e68>] (sys_rename+0x0/0x28) from [<c0023c00>]
(ret_fast_syscall+0x0/0x2c)
[   13.639670] UBIFS error (pid 273): ubifs_read_node: bad node type (0
but expected 2)
[   13.647371] UBIFS error (pid 273): ubifs_read_node: bad node at LEB
47:125384
[   13.654514] UBIFS warning (pid 273): ubifs_ro_mode: switched to
read-only mode, error -22
/endurance: endurance.c: 197: create_file: Assertion `status == 0' failed.
[   46.357586] UBIFS error (pid 101): make_reservation: cannot reserve
160 bytes in jhead 1, error -30
[   46.366503] UBIFS error (pid 101): ubifs_write_inode: can't write
inode 19507, error -30
