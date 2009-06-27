Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MKSG8-0001HI-7r
	for linux-mtd@lists.infradead.org; Sat, 27 Jun 2009 07:23:43 +0000
Subject: about ubifs and ubifs_get_sb
From: tommy <jiujin.hong@mid-fun.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sat, 27 Jun 2009 15:23:31 +0800
Message-Id: <1246087411.28080.2.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI,dear all !

i have pathed my 2.6.24 BSP with ubifs-2.6.24-git!
It work ok ,but when kernel booting  ,it also say error:


0x00000000-0x00040000 : "Bootloader"
0x00040000-0x00840000 : "Kernel"
0x00840000-0x13440000 : "ubi"
0x13440000-0x40000000 : "data"
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    258048 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "ubi"
UBI: MTD device size:            300 MiB
UBI: number of good PEBs:        1200
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             5
UBI: total number of reserved PEBs: 1195
UBI: number of PEBs reserved for bad PEB handling: 12
UBI: max/mean erase counter: 2/1
UBI: background thread "ubi_bgt0d" started, PID 229

name ubi0:rootfs, flags 0x8000
open_ubi name ubi0:rootfs    hjj--------opened ubi0_0
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: file system size:   301916160 bytes (294840 KiB, 287 MiB, 1170
LEBs)
UBIFS: journal size:       14966784 bytes (14616 KiB, 14 MiB, 58 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  4952683 bytes (4836 KiB)
VFS: Mounted root (ubifs filesystem).
Freeing init memory: 108K
UBI: attaching mtd3 to ubi1
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    258048 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd3 to ubi1
UBI: MTD device name:            "data"
UBI: MTD device size:            715 MiB
UBI: number of good PEBs:        2863
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             27
UBI: total number of reserved PEBs: 2836
UBI: number of PEBs reserved for bad PEB handling: 28
UBI: max/mean erase counter: 2/1
UBI: background thread "ubi_bgt1d" started, PID 650
name ubi1_0, flags 0x8000
open_ubi name ubi1_0hjj--------opened ubi1_0
UBIFS: mounted UBI device 1, volume 0, name "data"
UBIFS: file system size:   720728064 bytes (703836 KiB, 687 MiB, 2793
LEBs)
UBIFS: journal size:       33546240 bytes (32760 KiB, 31 MiB, 130 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  4952683 bytes (4836 KiB)
name rootfs, flags 0x8000
open_ubi name rootfs<3>UBIFS error (pid 664): ubifs_get_sb: cannot open
"rootfs", error -22 

My kernel command_line is "set bootargs root=ubi0:rootfs
rootfstype=ubifs ubi.mtd=2 console=ttySAC0,115200 "

can you help me ? thanks !
