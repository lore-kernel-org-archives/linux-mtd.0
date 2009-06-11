Received: from mail-px0-f176.google.com ([209.85.216.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MEZKS-0001za-J4
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 01:43:51 +0000
Received: by pxi6 with SMTP id 6so1241698pxi.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Jun 2009 18:43:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1244525403.5847.370.camel@localhost.localdomain>
References: <1c3f4270906052005y7a50a810sa60daf5a8850bcec@mail.gmail.com>
	<1244440779.5847.334.camel@localhost.localdomain>
	<1c3f4270906081913g7e9b0334r183e87d782b2406d@mail.gmail.com>
	<1244525403.5847.370.camel@localhost.localdomain>
Date: Wed, 10 Jun 2009 18:43:37 -0700
Message-ID: <1c3f4270906101843u65d64a98recfa07b1a67f3d3d@mail.gmail.com>
Subject: Re: write error while using UBI/UBIFS
From: Manoj <manoj23@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So I finally got all patches applied to my tree. I don't see an error
with mount operation now.
But I am seeing corrupted data messages.

Here is the log:


# ./ubiformat /dev/mtd1 -f ubi.img  -s 2048
ubiformat: mtd1 (nand), size 31457280 bytes (30.0 MiB), 240
eraseblocks of 131072 bytes (128.0 KiB),
 min. I/O size 2048 bytes
libscan: scanning eraseblock 239 -- 100 % complete
ubiformat: 240 eraseblocks have valid erase counter, mean value is 1
ubiformat: flashing eraseblock 43 -- 100 % complete
ubiformat: formatting eraseblock 239 -- 100 % complete
# ./ubiattach  /dev/ubi_ctrl -m 1
UBI device number 0, total 240 LEBs (30474240 bytes, 29.1 MiB),
available 0 LEBs (0 bytes), LEB size
 126976 bytes (124.0 KiB)
# mount -t ubifs -osync ubi0:rootfs /tmp/flash/
# cd /tmp/flash/
# dd if=3D/dev/urandom of=3Dfile1 bs=3D1M count=3D3
3+0 records in
3+0 records out
# cp file1 file2
[  112.800000] UBIFS error (pid 157): ubifs_scan: garbage
[  112.800000] UBIFS error (pid 157): ubifs_scanned_corruption:
corrupted data at LEB 10:0
[  112.830000] UBIFS error (pid 157): ubifs_scanned_corruption: first
4096 bytes from LEB 10:0
[  112.850000] UBIFS error (pid 157): ubifs_scan: LEB 10 scanning failed
[  112.890000] UBIFS error (pid 157): do_commit: commit failed, error -117
[  112.930000] UBI error: paranoid_check_all_ff: flash region at PEB
129:51200, length 2048 does not
 contain all 0xFF bytes
[  112.950000] UBI error: paranoid_check_all_ff: paranoid check failed
for PEB 129
[  112.970000] UBIFS error (pid 159): ubifs_wbuf_sync_nolock: cannot
write 2048 bytes to LEB 192:471
04
[  113.030000] UBIFS error (pid 159): ubifs_write_inode: can't write
inode 438, error -22
[  113.040000] UBI error: ubi_io_write: read-only mode
[  113.040000] UBI error: erase_worker: failed to erase PEB 87, error -30
[  113.050000] UBI error: do_work: work failed with error code -30
[  113.070000] UBI error: ubi_thread: ubi_bgt0d: work failed with error cod=
e -30
cp: write error: Invalid argument
# dmesg
10)
[  112.890000]  r6:00000000 r5:00000000 r4:00000000
[  112.930000] UBI error: paranoid_check_all_ff: flash region at PEB
129:51200, length 2048 does not
 contain all 0xFF bytes
[  112.950000] UBI error: paranoid_check_all_ff: paranoid check failed
for PEB 129
[  112.950000] UBI: hex dump of the 51200-53248 region
[  112.950000] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000000a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000000c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000000e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000001a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000001c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000001e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000220: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000240: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000002a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000002c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000002e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000320: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000340: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000360: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 00000380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000003a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000003c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.950000] 000003e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff  ................................
[  112.970000] 00000400: ff ff ff ff ff ff ff ff ff ff ff ff e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000420: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000440: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000460: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000480: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000004a0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000004c0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000004e0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000500: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000520: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000540: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000560: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000580: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000005a0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000005c0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000005e0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000600: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000620: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000640: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000660: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000680: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000006a0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000006c0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000006e0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000700: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000720: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000740: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000760: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 00000780: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000007a0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000007c0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] 000007e0: e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0 e0 e0 e0
e0 e0 e0 e0 e0 e0 e0  ................................
[  112.970000] [<c09cf4f0>] (dump_stack+0x0/0x14) from [<c0b3aff8>]
(paranoid_check_all_ff+0x134/0x1
64)
[  112.970000] [<c0b3aec4>] (paranoid_check_all_ff+0x0/0x164) from
[<c0b3b4fc>] (ubi_io_write+0x154/
0x340)
[  112.970000] [<c0b3b3a8>] (ubi_io_write+0x0/0x340) from [<c0b38bc8>]
(ubi_eba_write_leb+0xb8/0x7fc
)
[  112.970000] [<c0b38b10>] (ubi_eba_write_leb+0x0/0x7fc) from
[<c0b38058>] (ubi_leb_write+0x120/0x1
40)
[  112.970000] [<c0b37f38>] (ubi_leb_write+0x0/0x140) from
[<c0aabfcc>] (dbg_leb_write+0x98/0xb4)
[  112.970000] [<c0aabf34>] (dbg_leb_write+0x0/0xb4) from [<c0a87aa4>]
(ubifs_wbuf_sync_nolock+0x19c
/0x288)
[  112.970000] [<c0a87908>] (ubifs_wbuf_sync_nolock+0x0/0x288) from
[<c0a7a3bc>] (write_head+0x114/0
x134)
[  112.970000]  r8:c4e3378c r7:000000a0 r6:00000001 r5:c4f6f000 r4:000000a4
[  112.970000] [<c0a7a2a8>] (write_head+0x0/0x134) from [<c0a7a5a4>]
(ubifs_jnl_write_inode+0x108/0x
220)
[  112.970000] [<c0a7a49c>] (ubifs_jnl_write_inode+0x0/0x220) from
[<c0a84ed4>] (ubifs_write_inode+0
xfc/0x170)
[  112.970000] [<c0a84dd8>] (ubifs_write_inode+0x0/0x170) from
[<c0a7e8ec>] (ubifs_writepage+0x174/0
x258)
[  112.970000]  r7:00000000 r6:0028b000 r5:00000000 r4:0028a000
[  112.970000] [<c0a7e778>] (ubifs_writepage+0x0/0x258) from
[<c0a0b4e8>] (__writepage+0x20/0x68)
[  112.970000] [<c0a0b4c8>] (__writepage+0x0/0x68) from [<c0a0bd74>]
(write_cache_pages+0x250/0x3d4)
[  112.970000]  r4:c0dd1500
[  112.970000] [<c0a0bb24>] (write_cache_pages+0x0/0x3d4) from
[<c0a0bf28>] (generic_writepages+0x30
/0x38)
[  112.970000] [<c0a0bef8>] (generic_writepages+0x0/0x38) from
[<c0a0bf80>] (do_writepages+0x50/0x60
)
[  112.970000] [<c0a0bf30>] (do_writepages+0x0/0x60) from [<c0a05248>]
(__filemap_fdatawrite_range+0
x6c/0x74)
[  112.970000]  r4:0028a000
[  112.970000] [<c0a051dc>] (__filemap_fdatawrite_range+0x0/0x74) from
[<c0a06110>] (filemap_fdatawr
ite_range+0x24/0x2c)
[  112.970000]  r7:00000000 r6:0028afff r5:00000000 r4:0028afff
[  112.970000] [<c0a060ec>] (filemap_fdatawrite_range+0x0/0x2c) from
[<c0a062e0>] (sync_page_range+0
x60/0xd0)
[  112.970000]  r5:00000000 r4:00001000
[  112.970000] [<c0a06280>] (sync_page_range+0x0/0xd0) from
[<c0a06424>] (generic_file_aio_write+0xd
4/0xf0)
[  112.970000] [<c0a06350>] (generic_file_aio_write+0x0/0xf0) from
[<c0a7c4d0>] (ubifs_aio_write+0x1
88/0x1ec)
[  112.970000] [<c0a7c348>] (ubifs_aio_write+0x0/0x1ec) from
[<c0a279b4>] (do_sync_write+0xb8/0x10c)
[  112.970000] [<c0a278fc>] (do_sync_write+0x0/0x10c) from
[<c0a281cc>] (vfs_write+0xb4/0xdc)
[  112.970000] [<c0a28118>] (vfs_write+0x0/0xdc) from [<c0a28674>]
(sys_write+0x44/0x70)
[  112.970000]  r6:c54a14b8 r5:00000000 r4:0028a000
[  112.970000] [<c0a28630>] (sys_write+0x0/0x70) from [<c09cace0>]
(ret_fast_syscall+0x0/0x2c)
[  112.970000]  r8:c09cae60 r7:00000004 r6:00000004 r5:bec37aa8 r4:00001000
[  112.970000] UBI warning: ubi_eba_write_leb: failed to write data to PEB =
129
[  112.970000] UBI warning: ubi_ro_mode: switch to read-only mode
[  112.970000] UBIFS error (pid 159): ubifs_wbuf_sync_nolock: cannot
write 2048 bytes to LEB 192:471
04
[  113.030000] [<c09cf4f0>] (dump_stack+0x0/0x14) from [<c0a87af0>]
(ubifs_wbuf_sync_nolock+0x1e8/0x
288)
[  113.030000] [<c0a87908>] (ubifs_wbuf_sync_nolock+0x0/0x288) from
[<c0a7a3bc>] (write_head+0x114/0
x134)
[  113.030000]  r8:c4e3378c r7:000000a0 r6:00000001 r5:c4f6f000 r4:000000a4
[  113.030000] [<c0a7a2a8>] (write_head+0x0/0x134) from [<c0a7a5a4>]
(ubifs_jnl_write_inode+0x108/0x
220)
[  113.030000] [<c0a7a49c>] (ubifs_jnl_write_inode+0x0/0x220) from
[<c0a84ed4>] (ubifs_write_inode+0
xfc/0x170)
[  113.030000] [<c0a84dd8>] (ubifs_write_inode+0x0/0x170) from
[<c0a7e8ec>] (ubifs_writepage+0x174/0
x258)
[  113.030000]  r7:00000000 r6:0028b000 r5:00000000 r4:0028a000
[  113.030000] [<c0a7e778>] (ubifs_writepage+0x0/0x258) from
[<c0a0b4e8>] (__writepage+0x20/0x68)
[  113.030000] [<c0a0b4c8>] (__writepage+0x0/0x68) from [<c0a0bd74>]
(write_cache_pages+0x250/0x3d4)
[  113.030000]  r4:c0dd1500
[  113.030000] [<c0a0bb24>] (write_cache_pages+0x0/0x3d4) from
[<c0a0bf28>] (generic_writepages+0x30
/0x38)
[  113.030000] [<c0a0bef8>] (generic_writepages+0x0/0x38) from
[<c0a0bf80>] (do_writepages+0x50/0x60
)
[  113.030000] [<c0a0bf30>] (do_writepages+0x0/0x60) from [<c0a05248>]
(__filemap_fdatawrite_range+0
x6c/0x74)
[  113.030000]  r4:0028a000
[  113.030000] [<c0a051dc>] (__filemap_fdatawrite_range+0x0/0x74) from
[<c0a06110>] (filemap_fdatawr
ite_range+0x24/0x2c)
[  113.030000]  r7:00000000 r6:0028afff r5:00000000 r4:0028afff
[  113.030000] [<c0a060ec>] (filemap_fdatawrite_range+0x0/0x2c) from
[<c0a062e0>] (sync_page_range+0
x60/0xd0)
[  113.030000]  r5:00000000 r4:00001000
[  113.030000] [<c0a06280>] (sync_page_range+0x0/0xd0) from
[<c0a06424>] (generic_file_aio_write+0xd
4/0xf0)


On Mon, Jun 8, 2009 at 10:30 PM, Artem Bityutskiy<dedekind@infradead.org> w=
rote:
> On Mon, 2009-06-08 at 19:13 -0700, Manoj wrote:
>> Thanks for the pointers. But I am using kernel v2.6.27.7. :-(
>
> If you look at the URL I sent you, you'll find 2.6.27 back-port.
> All you need to do is to apply already prepared patches to your
> tree.
>
>>
>> Meanwhile, I disabled all extra checks and
>> CONFIG_MTD_NAND_VERIFY_WRITE as recommended. Now, I see this when I
>> unmount and re-mount ubifs:
>>
>> # mount -o sync -t ubifs ubi0:rootfs /tmp/flash/
>> [ =9A101.480000] UBIFS error (pid 164): ubifs_scan: corrupt empty space
>> at LEB 1:14336
>> [ =9A101.490000] UBIFS error (pid 164): ubifs_scanned_corruption:
>> corrupted data at LEB 1:14336
>> [ =9A101.500000] UBIFS error (pid 164): ubifs_scan: LEB 1 scanning faile=
d
>> [ =9A101.530000] UBIFS error (pid 164): ubifs_recover_master_node:
>> failed to recover master node
>> mount: mounting ubi0:rootfs on /tmp/flash/ failed: Invalid argument
>
> I do not see this with the newest UBI/UBIFS. Please, update yours.
> See here: http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
