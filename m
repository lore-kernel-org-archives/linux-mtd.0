Received: from qnaomail2.qinetiq-na.com ([96.45.212.13])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRpb2-0000av-E9
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 17:52:45 +0000
Received: from qnamail2.qinetiq-na.com ([172.16.64.17]) by
	qnaomail2.QinetiQ-NA.com with ESMTP id Vm3WJEUQzYA8dHVJ for
	<linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 13:52:40 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
Subject: ubi image only mounts once
Date: Wed, 1 Jun 2011 13:52:16 -0400
Message-ID: <29EDD457F13D0846B91A4845A68C3836DF7DEF@BOSQNAOMAIL1.qnao.net>
From: "Douglass, Woody" <Woodrow.Douglass@QinetiQ-NA.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To whom it may concern;

I am trying to build a linux image to run on a custom omap3530 board. I
have reached a point where my build system builds a UBI image that can
be mounted exactly once; subsequent mounts fail. Here is the related
dmesg output:

When it works:

[  131.461883] omap2-nand driver initializing
[  131.466796] OMAP NAND: use WAIT0 as R/B# pin
[  131.504669] NAND device: Manufacturer ID: 0xad, Chip ID: 0xba (Hynix
NAND 256MiB 1,8V 16-bit)
[  131.524658] omap_ident_nand_chip:1352 ad ba
[  131.528869] Creating 5 MTD partitions on "omap2-nand":
[  131.534057] 0x000000000000-0x000000080000 : "X-Loader"
[  131.544036] 0x000000080000-0x000000260000 : "U-Boot"
[  131.552947] 0x000000260000-0x000000280000 : "U-Boot Env"
[  131.561065] 0x000000280000-0x000000680000 : "Kernel"
[  131.570281] 0x000000680000-0x000010000000 : "File System"
[  131.668182] OneNAND driver initializing
[  131.677215] UBI: attaching mtd4 to ubi0
[  131.681091] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[  131.687744] UBI: logical eraseblock size:    129024 bytes
[  131.693176] UBI: smallest flash I/O unit:    2048
[  131.697998] UBI: sub-page size:              512
[  131.702636] UBI: VID header offset:          512 (aligned 512)
[  131.708923] UBI: data offset:                2048
[  132.483612] UBI: volume 0 ("rootfs") re-sized from 1041 to 1970 LEBs
[  132.495361] UBI: attached mtd4 to ubi0
[  132.499145] UBI: MTD device name:            "File System"
[  132.504852] UBI: MTD device size:            249 MiB
[  132.509857] UBI: number of good PEBs:        1993
[  132.514678] UBI: number of bad PEBs:         3
[  132.519165] UBI: max. allowed volumes:       128
[  132.523803] UBI: wear-leveling threshold:    4096
[  132.528594] UBI: number of internal volumes: 1
[  132.533081] UBI: number of user volumes:     1
[  132.537628] UBI: available PEBs:             0
[  132.542114] UBI: total number of reserved PEBs: 1993
[  132.547180] UBI: number of PEBs reserved for bad PEB handling: 19
[  132.553314] UBI: max/mean erase counter: 4/2
[  132.557678] UBI: image sequence number: 859895637
[  132.563018] UBI: background thread "ubi_bgt0d" started, PID 425

When it doesn't:

[  196.955749] omap2-nand driver initializing
[  196.960693] OMAP NAND: use WAIT0 as R/B# pin
[  196.998199] NAND device: Manufacturer ID: 0xad, Chip ID: 0xba (Hynix
NAND 256MiB 1,8V 16-bit)
[  197.018188] omap_ident_nand_chip:1352 ad ba
[  197.022399] Creating 5 MTD partitions on "omap2-nand":
[  197.027587] 0x000000000000-0x000000080000 : "X-Loader"
[  197.037536] 0x000000080000-0x000000260000 : "U-Boot"
[  197.046417] 0x000000260000-0x000000280000 : "U-Boot Env"
[  197.054565] 0x000000280000-0x000000680000 : "Kernel"
[  197.063781] 0x000000680000-0x000010000000 : "File System"
[  197.161712] OneNAND driver initializing
[  197.170745] UBI: attaching mtd4 to ubi0
[  197.174621] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[  197.181274] UBI: logical eraseblock size:    129024 bytes
[  197.186706] UBI: smallest flash I/O unit:    2048
[  197.191528] UBI: sub-page size:              512
[  197.196166] UBI: VID header offset:          512 (aligned 512)
[  197.202453] UBI: data offset:                2048
[  197.311676] UBI error: ubi_io_read: error -74 while reading 64 bytes
from PEB 277:0, read 64 bytes
[  197.321197] UBI error: ubi_io_read: error -74 while reading 64 bytes
from PEB 278:0, read 64 bytes
[  197.330718] UBI error: ubi_io_read: error -74 while reading 64 bytes
from PEB 279:0, read 64 bytes
[  197.341644] UBI error: ubi_io_read: error -74 while reading 64 bytes
from PEB 284:0, read 64 bytes
[  197.983612] UBI error: ubi_read_volume_table: the layout volume was
not found
[  197.994171] UBI error: ubi_init: cannot attach mtd4
[  198.001983] UBI error: ubi_init: UBI error: cannot initialize UBI,
error -22

Note that I've run Angstrom linux on this board before, with the same
kernel; it worked fine.

I am using these commands to create the image:
mkfs.ubifs -r /mnt/storage/hc-build/output/fs -o
/mnt/storage/hc-build/build/fs/root.ubifs -m 2048 -e 129024 -c 2047 -U=20
ubinize -o /mnt/storage/hc-build/output/boot/root.ubi -m 2048 -p 131072
-s 512 /mnt/storage/hc-build/build/fs/ubinize.conf

and my ubinize.conf is:
[ubifs]
mode=3Dubi
image=3D/mnt/storage/hc-build/build/fs/root.ubifs
vol_id=3D0
vol_size=3D128MiB
vol_type=3Ddynamic
vol_name=3Drootfs
vol_flags=3Dautoresize

Thank you very much for any insight you can provide.

-Woodrow Douglass
