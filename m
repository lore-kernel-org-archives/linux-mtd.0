Received: from brvmst.brv.se ([148.160.26.95])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz4wv-0000Vq-KS
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 14:10:26 +0000
Received: from sbs.brv.local ([192.168.100.20] helo=remote.brv.se)
 by brvmst.brv.se with esmtp (Exim 4.82)
 (envelope-from <Henric.Eriksson@brv.se>) id 1Wz4wN-0005Wz-7m
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 16:09:57 +0200
From: Henric Eriksson <Henric.Eriksson@brv.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Flash corruption when using UBIFS filesystem on m25p80
Date: Mon, 23 Jun 2014 14:09:45 +0000
Message-ID: <53A83529.9050007@brv.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <275A3FA6AAE79149829A9FD50B55582A@brv.se>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We have a board with a Freescale i.MX28 running Linux kernel 3.14.3=20
(Freescale mainline fork). This board has a Spansion S25FL512S Flash=20
memory connected with support for Quad SPI communication. We've been=20
working for a while now trying to use this as the main rootfs storage=20
but have run into problems of Flash corruption when using UBIFS.

We're using the m25p80 driver for this as it has support for this Flash=20
memory and supply the partition table using the command line which is=20
correctly picked up:

m25p80 spi1.0: s25fl512s (65536 Kbytes)
5 cmdlinepart partitions found on MTD device spi1.0
Creating 5 MTD partitions on "spi1.0":
0x000000000000-0x000000080000 : "bootloader"
0x000000080000-0x0000000c0000 : "environment"
0x0000000c0000-0x0000004c0000 : "kernel"
0x0000004c0000-0x000000500000 : "fdt"
0x000000500000-0x000004000000 : "filesystem"

The "fileystem" partitions then shows up at /dev/mtd4. We format the MTD=20
partition using ubiformat and then attach it with ubiattach:

$ ubiformat /dev/mtd4
ubiformat: mtd4 (nor), size 61865984 bytes (59.0 MiB), 236 eraseblocks=20
of 262144 bytes (256.0 KiB), min. I/O size 1 bytes
libscan: scanning eraseblock 235 -- 100 % complete
ubiformat: use erase counter 0 for all eraseblocks
ubiformat: formatting eraseblock 235 -- 100 % complete

$ ubiattach -m 4
UBI: attaching mtd4 to ubi0
UBI: scanning is finished
UBI: attached mtd4 (name "filesystem", size 59 MiB) to ubi0
UBI: PEB size: 262144 bytes (256 KiB), LEB size: 262016 bytes
UBI: min./max. I/O unit sizes: 1/256, sub-page size 1
UBI: VID header offset: 64 (aligned 64), data offset: 128
UBI: good PEBs: 236, bad PEBs: 0, corrupted PEBs: 0
UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence=20
number: 1780967944
UBI: available PEBs: 232, total reserved PEBs: 4, PEBs reserved for bad=20
PEB handling: 0
UBI: background thread "ubi_bgt0d" started, PID 464
UBI device number 0, total 236 LEBs (61835776 bytes, 59.0 MiB),=20
available 232 LEBs (60787712 bytes, 58.0 MiB), LEB size 262016 bytes=20
(255.9 KiB)

Everything looks fine so far. Making a volume and then the UBIFS=20
filesystem also works fine:

$ ubimkvol /dev/ubi0 -m -N "filesystem"
Set volume size to 60787712
Volume ID 0, size 232 LEBs (60787712 bytes, 58.0 MiB), LEB size 262016=20
bytes (255.9 KiB), dynamic, name "filesystem", alignment 1

$ mkfs.ubifs -m 1 -e 262016 -c 232 /dev/ubi0_0

The first mount always succeeds and you can then read and write to the=20
partition:

$ mount -t ubifs /dev/ubi0_0 tmp/
UBIFS: background thread "ubifs_bgt0_0" started, PID 473
UBIFS: mounted UBI device 0, volume 0, name "filesystem"
UBIFS: LEB size: 262016 bytes (255 KiB), min./max. I/O unit sizes: 8=20
bytes/256 bytes
UBIFS: FS size: 58167552 bytes (55 MiB, 222 LEBs), journal size 8384512=20
bytes (7 MiB, 32 LEBs)
UBIFS: reserved for root: 0 bytes (0 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID=20
AC912B03-BC0F-4641-9B0B-337F71D1D2AF, small LPT model

The problems arise after the second mount. The error is similar every time:

$ umount tmp/
UBIFS: un-mount UBI device 0, volume 0
UBIFS: background thread "ubifs_bgt0_0" stops

$ mount -t ubifs /dev/ubi0_0 tmp/
UBIFS: background thread "ubifs_bgt0_0" started, PID 480
UBIFS error (pid 479): ubifs_scan: garbage
UBIFS error (pid 479): ubifs_scanned_corruption: corruption at LEB 4:0
UBIFS error (pid 479): ubifs_scanned_corruption: first 8192 bytes from=20
LEB 4:0
UBIFS error (pid 479): ubifs_scan: LEB 4 scanning failed
UBIFS: background thread "ubifs_bgt0_0" stops
mount: mounting /dev/ubi0_0 on tmp/ failed: Structure needs cleaning

Subsequent mounts cause it to attempt recovery but it always inevitably=20
fails with similar errors.

We've tried to do run the MTD tests on the Flash device and the=20
mtd_readtest works without any problems while the mtd_stresstest causes=20
other underlying frameworks to fail, in this particular case the DMA is=20
overrun. Those particular errors don't appear in the normal use-case=20
though so that's probably not part of the problem.

Any assistance in the matter would be greatly appreciated!

Regards,

Henric Eriksson=
