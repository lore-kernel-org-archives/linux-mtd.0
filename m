Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfNTT-00034w-KQ
 for linux-mtd@lists.infradead.org; Thu, 01 Sep 2016 08:35:53 +0000
Received: by mail-wm0-x243.google.com with SMTP id w207so7286159wmw.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2016 01:35:30 -0700 (PDT)
Received: from [10.0.1.134] (4F7A1758.dsl.pool.telekom.hu. [79.122.23.88])
 by smtp.gmail.com with ESMTPSA id v203sm13125639wmv.2.2016.09.01.01.35.28
 for <linux-mtd@lists.infradead.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 01 Sep 2016 01:35:28 -0700 (PDT)
From: Andras Szemzo <szemzo.andras@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: Micron qspi nor flash and UBIFS
Message-Id: <EB1698FB-FF63-4FC1-A706-A81DB9E655DD@gmail.com>
Date: Thu, 1 Sep 2016 10:35:27 +0200
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I try to use the atmel QSPI controller with a Micron N25Q512 64MB qspi =
flash with 4.8.0-rc2 kernel.
The driver seems working, mtd_tests runs without error.=20

(The QSPI clock is 75MHz, the read speed is not the best btw.)

~ # modprobe mtd_speedtest dev=3D0
[  113.310000] mtd_speedtest: not NAND flash, assume page size is 512 =
bytes.
[  113.320000] mtd_speedtest: MTD device size 4194304, eraseblock size =
65536, page size 512, count of eraseblocks 64, pages per eraseblock 128, =
OOB size 0
[  158.360000] mtd_speedtest: testing eraseblock write speed
[  169.040000] mtd_speedtest: eraseblock write speed is 383 KiB/s
[  169.040000] mtd_speedtest: testing eraseblock read speed
[  169.500000] mtd_speedtest: eraseblock read speed is 9061 KiB/s
[  214.610000] mtd_speedtest: testing page write speed
[  225.420000] mtd_speedtest: page write speed is 378 KiB/s
[  225.430000] mtd_speedtest: testing page read speed
[  225.990000] mtd_speedtest: page read speed is 7380 KiB/s


My problem is I got warning at ubimkvol, and at every reboot.
After boot, read/write works fine without error.

The situation is the same when i try to mount jffs2 formatted partition =
instead of ubifs.=20

 Is there anything what I missed?

Thanks,
Andras


~ # mtdinfo -a
...
mtd2
Name:                           qspi-rootfs
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          958 (62783488 bytes, 59.9 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:4
Bad blocks are allowed:         false
Device is writable:             true

=20
~ # ubiformat /dev/mtd2
ubiformat: mtd2 (nor), size 62783488 bytes (59.9 MiB), 958 eraseblocks =
of 65536 bytes (64.0 KiB), min. I/O size 1 bytes
libscan: scanning eraseblock 957 -- 100 % complete =20
ubiformat: formatting eraseblock 957 -- 100 % complete


~ # ubiattach -m 2 /dev/ubi_ctrl=20
ubi0: default fastmap pool size: 45
ubi0: default fastmap WL pool size: 22
ubi0: attaching mtd2
ubi0: scanning is finished
ubi0: attached mtd2 (name "qspi-rootfs", size 59 MiB)
ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
ubi0: VID header offset: 64 (aligned 64), data offset: 128
ubi0: good PEBs: 958, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence =
number: 581993421
ubi0: available PEBs: 952, total reserved PEBs: 6, PEBs reserved for bad =
PEB handling: 0
ubi0: background thread "ubi_bgt0d" started, PID 96
UBI device number 0, total 958 LEBs (62660864 bytes, 59.8 MiB), =
available 952 LEBs (62268416 bytes, 59.4 MiB), LEB size 65408 bytes =
(63.9 KiB)


~ # ubimkvol -N rootfs -m /dev/ubi0=20
Set volume size to 62268416
------------[ cut here ]------------
WARNING: CPU: 0 PID: 97 at drivers/mtd/spi-nor/spi-nor.c:1177 0x70126acd
Writing at offset 64 into a NOR page. Writing partial pages may decrease =
reliability and increase wear of NOR flash.
Modules linked in:
CPU: 0 PID: 97 Comm: ubimkvol Not tainted 4.8.0-rc2 #46
Hardware name: Atmel SAMx7
Function entered at [<7000c539>] from [<7000b30b>]
Function entered at [<7000b30b>] from [<7000eff5>]
Function entered at [<7000eff5>] from [<7000f03b>]
Function entered at [<7000f03b>] from [<70126acd>]
Function entered at [<70126acd>] from [<701231d3>]
Function entered at [<701231d3>] from [<7012135b>]
Function entered at [<7012135b>] from [<7012ee33>]
Function entered at [<7012ee33>] from [<7012f1b3>]
Function entered at [<7012f1b3>] from [<7012d79f>]
Function entered at [<7012d79f>] from [<70127c73>]
Function entered at [<70127c73>] from [<701280ad>]
Function entered at [<701280ad>] from [<70129123>]
Function entered at [<70129123>] from [<7012b331>]
Function entered at [<7012b331>] from [<7005b733>]
Function entered at [<7005b733>] from [<7005bbed>]
Function entered at [<7005bbed>] from [<7005bc2f>]
Function entered at [<7005bc2f>] from [<70009b01>]
---[ end trace 2135654054bc77cf ]---
Volume ID 0, size 952 LEBs (62268416 bytes, 59.4 MiB), LEB size 65408 =
bytes (63.9 KiB), dynamic, name "rootfs", alignment 1


~ # mount -t ubifs ubi0:rootfs /mnt
UBIFS (ubi0:0): default file-system created
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 99
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS (ubi0:0): LEB size: 65408 bytes (63 KiB), min./max. I/O unit =
sizes: 8 bytes/256 bytes
UBIFS (ubi0:0): FS size: 61614336 bytes (58 MiB, 942 LEBs), journal size =
3074176 bytes (2 MiB, 47 LEBs)
UBIFS (ubi0:0): reserved for root: 2910196 bytes (2841 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID =
C08619AC-1227-4D3B-884F-7E5677BE00AB, small LPT model


Booting Linux on physical CPU 0x0
...
Kernel command line: console=3DttyS1,115200 ubi.mtd=3D2 root=3Dubi0:rootfs=
 rootfstype=3Dubifs rw init=3D/linuxrc
...
atmel_qspi 4007c000.qspi: n25q512ax3 (65536 Kbytes)
3 ofpart partitions found on MTD device 4007c000.qspi
Creating 3 MTD partitions on "4007c000.qspi":
0x000000000000-0x000000400000 : "qspi-linux-kernel"
0x000000400000-0x000000420000 : "qspi-device-tree"
0x000000420000-0x000004000000 : "qspi-rootfs"
...
ubi0: default fastmap WL pool size: 22
ubi0: attaching mtd2
ubi0: scanning is finished
ubi0: attached mtd2 (name "qspi-rootfs", size 59 MiB)
ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
ubi0: VID header offset: 64 (aligned 64), data offset: 128
ubi0: good PEBs: 958, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence =
number: 581993421
ubi0: available PEBs: 0, total reserved PEBs: 958, PEBs reserved for bad =
PEB handling: 0
ubi0: background thread "ubi_bgt0d" started, PID 45
at91_rtc 400e1860.rtc: setting system clock to 2012-01-01 00:04:28 UTC =
(1325376268)
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 46
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/mtd/spi-nor/spi-nor.c:1177 0x70126acd
Writing at offset 128 into a NOR page. Writing partial pages may =
decrease reliability and increase wear of NOR flash.
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.8.0-rc2 #46
Hardware name: Atmel SAMx7
Function entered at [<7000c539>] from [<7000b30b>]
Function entered at [<7000b30b>] from [<7000eff5>]
Function entered at [<7000eff5>] from [<7000f03b>]
Function entered at [<7000f03b>] from [<70126acd>]
Function entered at [<70126acd>] from [<701231d3>]
Function entered at [<701231d3>] from [<7012135b>]
Function entered at [<7012135b>] from [<7012ee33>]
Function entered at [<7012ee33>] from [<7012cd37>]
Function entered at [<7012cd37>] from [<7012c101>]
Function entered at [<7012c101>] from [<7009cacd>]
Function entered at [<7009cacd>] from [<7009db23>]
Function entered at [<7009db23>] from [<700a1675>]
Function entered at [<700a1675>] from [<7009b37b>]
Function entered at [<7009b37b>] from [<700543e9>]
Function entered at [<700543e9>] from [<7006306b>]
Function entered at [<7006306b>] from [<700652b9>]
Function entered at [<700652b9>] from [<7006561b>]
Function entered at [<7006561b>] from [<7025a875>]
Function entered at [<7025a875>] from [<7025aa55>]
Function entered at [<7025aa55>] from [<7025a6d5>]
Function entered at [<7025a6d5>] from [<701c53af>]
Function entered at [<701c53af>] from [<70009bc9>]
---[ end trace 893b280fb022d9bd ]---
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS (ubi0:0): LEB size: 65408 bytes (63 KiB), min./max. I/O unit =
sizes: 8 bytes/256 bytes
UBIFS (ubi0:0): FS size: 61614336 bytes (58 MiB, 942 LEBs), journal size =
3074176 bytes (2 MiB, 47 LEBs)
UBIFS (ubi0:0): reserved for root: 2910196 bytes (2841 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID =
C08619AC-1227-4D3B-884F-7E5677BE00AB, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:12.
