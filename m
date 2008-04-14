Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlGZx-0002lY-3g
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 04:46:05 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1420337wff.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 13 Apr 2008 21:46:03 -0700 (PDT)
Message-ID: <bae050c10804132146t284e9a3pd3952c30a7e892c7@mail.gmail.com>
Date: Mon, 14 Apr 2008 12:46:03 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
In-Reply-To: <1207995042.5965.136.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
	<1207994233.5965.124.camel@sauron> <1207995042.5965.136.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Aterm
     First of all, I don't know how to express my deep thankfulness to
you. You are such busy man, but replyed so carefully, patiently and
clearly. That's a big suprise to me :-)  Thank you !

     Hmm..
     I simply use the way you told to port UBI & UBIFS to mine.
> # cd /home/nanxy/ubifs-v2.6.24
> # git diff v2.6.24 > all_ubifs.diff
> # cd /home/nancy/linux-2.6.24.3
> # patch -p1 < all_ubifs.diff

    In fact, I found a serious bug which makes me consider to update
the UBI & UBIFS to the latest version. But it still exist!

# flash_eraseall /dev/mtd5
# nandwrite -a -m -q /dev/mtd5 ubi0414

# modprobe ubi mtd=5
UBI: attached mtd5 to ubi0
UBI: MTD device name:            "NAND VFAT partition"
UBI: MTD device size:            512 MiB
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    258048 bytes
UBI: number of good PEBs:        2048
UBI: number of bad PEBs:         0
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     2
UBI: available PEBs:             398
UBI: total number of reserved PEBs: 1650
UBI: number of PEBs reserved for bad PEB handling: 20
UBI: max/mean erase counter: 1/0
UBI: background thread "ubi_bgt0d" started, PID 328
# lsmod
Module                  Size  Used by    Not tainted
ubi                    95344  0
# modprobe ubifs
# lsmod
Module                  Size  Used by    Not tainted
ubifs                 271360  0
ubi                    95344  1 ubifs
# mount -t ubifs ubi0:ubifs /mnt/1
UBIFS: mounted UBI device 0, volume 0
UBIFS: minimal I/O unit size:   2048 bytes
UBIFS: logical eraseblock size: 258048 bytes (252 KiB)
UBIFS: file system size:        207212544 bytes (202356 KiB, 197 MiB, 803 LEBs)
UBIFS: journal size:            9420800 bytes (9200 KiB, 8 MiB, 37 LEBs)
UBIFS: data journal heads:      1
UBIFS: default compressor:      LZO
# ls /mnt/1
bin      etc      lib      mnt      proc     sbin     tmp      var
dev      home     linuxrc  opt      root     sys      usr
# umount /mnt/1
UBIFS: un-mount UBI device 0, volume 0
# rmmod ubifs
# rmmod ubi
UBI: mtd5 is detached from ubi0
# modprobe ubi mtd=5
UBI: attached mtd5 to ubi0
UBI: MTD device name:            "NAND VFAT partition"
UBI: MTD device size:            512 MiB
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    258048 bytes
UBI: number of good PEBs:        2048
UBI: number of bad PEBs:         0
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     2
UBI: available PEBs:             398
UBI: total number of reserved PEBs: 1650
UBI: number of PEBs reserved for bad PEB handling: 20
UBI: max/mean erase counter: 4/0
UBI: background thread "ubi_bgt0d" started, PID 369
# modprobe ubifs
# lsmod
Module                  Size  Used by    Not tainted
ubifs                 271360  0
ubi                    95344  1 ubifs
# mount -t ubifs ubi0:ubifs /mnt/1
NAND: Uncorrectable ECC error
NAND: Uncorrectable ECC error
NAND: Uncorrectable ECC error
NAND: Uncorrectable ECC error
UBI error: ubi_io_read: error -77 while reading 258048 bytes from PEB
3:4096, read 258048 bytes
UBIFS error (pid 375): ubifs_scan: corrupt empty space at LEB 1:4096
UBIFS error (pid 375): ubifs_scanned_corruption: corrupted data at LEB 1:4096
UBIFS error (pid 375): ubifs_scanned_corruption: first 4096 bytes from
LEB 1:4096
UBIFS error (pid 375): ubifs_scan: LEB 1 scanning failed
NAND: Uncorrectable ECC error
NAND: Uncorrectable ECC error
NAND: Uncorrectable ECC error
NAND: Uncorrectable ECC error
UBI error: ubi_io_read: error -77 while reading 258048 bytes from PEB
3:4096, read 258048 bytes
UBIFS error (pid 375): ubifs_recover_master_node: failed to recover master node
UBIFS error (pid 375): ubifs_recover_master_node: dumping first master node
CPU 0 Unable to handle kernel paging request at virtual address
c021e003, epc == c014a9e0, ra == c01467d0
Oops[#1]:
Cpu 0
$ 0   : 00000000 10000400 c014a9b4 00000000
$ 4   : 83fb8800 c021e000 00000001 00000000
$ 8   : 8043e280 00000002 00004001 80490000
$12   : 80490000 80490000 000000a0 00000038
$16   : 8003e3a0 c0150000 ffffffea 83fb8800
$20   : 83fb8b70 c0130000 c015c380 c0160000
$24   : 00000002 8009a3d0
$28   : 83efc000 83efdbe0 83fb8800 c01467d0
Hi    : 000000a7
Lo    : 86c91000
epc   : c014a9e0 dbg_dump_node+0x2c/0xd20 [ubifs]     Not tainted
ra    : c01467d0 ubifs_recover_master_node+0xe4/0x2f4 [ubifs]
Status: 10000403    KERNEL EXL IE
Cause : 00800008
BadVA : c021e003
PrId  : 0ad0024f (Ingenic JZRISC)
Modules linked in: ubifs ubi
Process mount (pid: 375, threadinfo=83efc000, task=83c87198)
Stack : ffffffea 00000800 8003e3a0 c0150000 ffffffea 83fb8800 83fb8b70 c0130000
        c015c380 c0160000 8003e3a0 c0150000 ffffffea 83fb8800 83fb8b70 c0130000
        c015c380 c0160000 83fb8800 c01467d0 00001000 00000177 c014d3dc 00000000
        83efdc50 00000001 00000000 00000000 00000000 00000000 c021e000 00000000
        83d90da8 83fb8800 ffffff79 00000000 83fb8b70 c0130464 83fb8b42 83fb8800
        ...
Call Trace:
[<c014a9e0>] dbg_dump_node+0x2c/0xd20 [ubifs]
[<c01467d0>] ubifs_recover_master_node+0xe4/0x2f4 [ubifs]
[<c0130464>] ubifs_read_master+0xb4/0xaec [ubifs]
[<c011f0b8>] ubifs_get_sb+0xe48/0x17c0 [ubifs]
[<800ae134>] vfs_kern_mount+0x64/0x10c
[<800ae238>] do_kern_mount+0x4c/0x134
[<800ce500>] do_mount+0x1c0/0x6e4
[<800ceabc>] sys_mount+0x98/0xfc
[<80021df0>] stack_done+0x20/0x3c


Code: afb40038  afb1002c  afb00028 <88a30003> 3c020610  98a30000
34421831  00a09021  10620022
Segmentation fault
#


pls:

UBIFS UBI: commit 2bee7c9d6d42df3af73d36749760319592c68a96
mkfs.ubifs: commit 20dbf0ae5792e5b13153f676181f83336508d820
mtd-utils: commit fcb52ccc99679460640386c297023f852b108f68

Both root26.img and ubi0414 created on PC
[yrtan@st mkfs.ubifs]$ ./mkfs.ubifs -r /nfsroot/release/rootfs/root26
-m 2048 -e 258048 -c 813 -o root26.img
[yrtan@st new-utils]$ ./ubinize -o ubi0414 ubinize.cfg -p 262144 -m 2048
[yrtan@st new-utils]$ cat ubinize.cfg
[ubifs]
mode=ubi
image=root26.img
vol_id=0
vol_size=200MiB
vol_type=dynamic
vol_name=ubifs
vol_alignment=1
vol_flag=autoresize

[vfat]
mode=ubi
image=vfat.img
vol_id=1
vol_size=298MiB
vol_type=dynamic
vol_name=vfat
vol_alignment=1
vol_flag=autoresize

For original test, I use the origial UBI code, do not add any of the
UBI block layer codes. Though the ubi0414 contain vfat.img, the whole
process do not use it. I think it won't effect the test result.

Maybe there's bug in "ubinize".  Cause if I use "ubiupdatevol",
everything is OK.


--
Best wishes,
Nancy
