Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXWHK-0001qe-C9
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 08:51:11 +0000
Received: by fxm22 with SMTP id 22so3091434fxm.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jan 2010 00:51:05 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 20 Jan 2010 09:51:05 +0100
Message-ID: <30e5226d1001200051o5cd62e18p7020e6bc8a734032@mail.gmail.com>
Subject: UBIFS bad superblock error
From: dballman <pnetrisk@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

By generating a busybox image with these commands:

mkfs.ubifs -U -x favor_lzo -m 1 -e 130944 -c 100 -r _install/ -o
busybox-ubifs.img
ubinize -o busybox-ubiimg.bin -p 128KiB -m 1 ubinize.ini

ubinize.ini content:

[rootfs-volume]
mode=ubi
image=busybox-ubifs.img
vol_id=0
vol_size=50MiB
vol_type=dynamic
vol_name=rootfs
vol_alignment=1
vol_flags=autoresize

Then I put the .bin file on the address for the second mtd partition
on a custom made board with NOR flash and it gives the following
error:
(Only relevant information is shown)

...
[    0.000000] Kernel command line: mem=64M console=ttyS0,115200 ubi.mtd=1
root=ubi0:rootfs rw rootfstype=ubifs
mtdparts=physmap-flash.0:4096k(boot),-(root_rw)
...
[    0.690000] 2 cmdlinepart partitions found on MTD device physmap-flash.0
[    0.700000] Creating 2 MTD partitions on "physmap-flash.0":
[    0.700000] 0x000000000000-0x000000400000 : "boot"
[    0.710000] 0x000000400000-0x000004000000 : "root_rw"
...
[    0.760000] UBI: attaching mtd1 to ubi0
[    0.760000] UBI: physical eraseblock size:    131072 bytes (128 KiB)
[    0.770000] UBI: logical eraseblock size:    130944 bytes
[    0.770000] UBI: smallest flash I/O unit:    1
[    0.780000] UBI: VID header offset:          64 (aligned 64)
[    0.780000] UBI: data offset:                128
[    0.830000] UBI: attached mtd1 to ubi0
[    0.840000] UBI: MTD device name:            "root_rw"
[    0.840000] UBI: MTD device size:            60 MiB
[    0.850000] UBI: number of good PEBs:        480
[    0.850000] UBI: number of bad PEBs:         0
[    0.860000] UBI: max. allowed volumes:       128
[    0.860000] UBI: wear-leveling threshold:    4096
[    0.870000] UBI: number of internal volumes: 1
[    0.870000] UBI: number of user volumes:     1
[    0.870000] UBI: available PEBs:             0
[    0.880000] UBI: total number of reserved PEBs: 480
[    0.880000] UBI: number of PEBs reserved for bad PEB handling: 0
[    0.890000] UBI: max/mean erase counter: 1/0
...
[    0.900000] UBI: background thread "ubi_bgt0d" started, PID 284
...
[    1.010000] UBIFS error (pid 1): validate_sb: min. I/O unit
mismatch: 64 in superblock, 8 real
[    1.020000] UBIFS error (pid 1): validate_sb: bad superblock, error 1
[    1.030000] List of all partitions:
[    1.030000] 1f00            4096 mtdblock0 driver: physmap-flash
[    1.040000] 1f01           61440 mtdblock1 driver: physmap-flash
[    1.040000] No filesystem could mount root, tried:  ubifs
[    1.050000] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)

I have tried different -m parameter options to change the min I/O unit
size but nothing works. I don't know what the error might be, any clue
about that?

Thanks in advance
