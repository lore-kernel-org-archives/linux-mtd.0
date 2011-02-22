Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ps0cU-0003uM-J8
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2011 22:22:12 +0000
From: "Marco Cesarano" <mcesaran@broadcom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 22 Feb 2011 14:21:55 -0800
Subject: UBI power cut
Message-ID: <2B8D104E6375C044820294EF730F789F582C219247@IRVEXCHCCR01.corp.ad.broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I tested UBI/UBIFS on Linux 2.6.31 and I experienced some issues in case of=
 power cut. I've pasted some logs below. You can see that the driver return=
s a code that means that a page is partially written on the flash, and at t=
he boot phase the driver detects corrupted data.

LOG 1:

...
[09/21 09:31:30]UBIFS: recovery needed
[09/21 09:31:30]UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated =
0xbdb34226, read

0xbd330226
[09/21 09:31:30]UBIFS error (pid 1): ubifs_check_node: bad node at LEB 51:2=
4576
[09/21 09:31:30]UBIFS error (pid 1): ubifs_scanned_corruption: corruption a=
t LEB 51:24576
[09/21 09:31:30]UBIFS error (pid 1): ubifs_recover_leb: LEB 51 scanning fai=
led
[09/21 09:31:30]VFS: Cannot open root device "ubi0:rootfs" or unknown-block=
(8,1)
[09/21 09:31:30]Please append a correct "root=3D" boot option; here are the=
 available

partitions:
[09/21 09:31:30]0800       156290904 sda driver: sd
[09/21 09:31:30]  0801         4112639 sda1
[09/21 09:31:30]  0802          514080 sda2
[09/21 09:31:30]  0803         8225280 sda3
[09/21 09:31:31]  0804       143436352 sda4
[09/21 09:31:31]1f00          122880 mtdblock0 (driver?)
[09/21 09:31:31]1f01          130048 mtdblock1 (driver?)
[09/21 09:31:31]1f02            4096 mtdblock2 (driver?)
[09/21 09:31:31]1f03           32768 mtdblock3 (driver?)
[09/21 09:31:31]1f04          117428 mtdblock4 (driver?)
[09/21 09:31:31]Kernel panic - not syncing: VFS: Unable to mount root fs on

unknown-block(8,1)


LOG 2:

...
physmap-flash.0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
usb 1-2: new high speed USB device using ehci-brcm and address 2
RedBoot partition parsing not available
UBI: attaching mtd0 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
usb 1-2: configuration #1 chosen from 1 choice
UBI: attached mtd0 to ubi0
UBI: MTD device name:            "rootfs"
UBI: MTD device size:            120 MiB
UBI: number of good PEBs:        960
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 960
UBI: number of PEBs reserved for bad PEB handling: 9
UBI: max/mean erase counter: 3/1
UBI: image sequence number: 0
UBI: background thread "ubi_bgt0d" started, PID 294
eth0: register 'asix' at usb-ehci_hcd-2, ASIX AX88772 USB 2.0 Ethernet, 00:=
50:b6:00:a4:e1
UBIFS: recovery needed
brcmnand_handle_false_read_ecc_unc_errors: Uncorrectable error at offset 48=
b1e00
Data:

0000: 31181006 575593c9 4f330f00 00004000 40004000 02010000 01000000 0c036b=
5c
0020: 04000000 00000000 34260200 00000000 00000700 00000000 7736392e 676172=
00
0040: 31181006 41eceb6d 10330f00 00000000 a0000000 00010000 30270200 000000=
02
0060: 00000000 00000000 0e330f00 00000000 00000000 00000000 0a000000 000000=
00
0080: 2a000000 01000000 0b000000 00000000 00000100 00000000 00000100 090010=
41
00a0: 00000000 00000000 a4810000 01000000 00000000 00000003 00000000 000040=
00
00c0: 00000000 89000002 00100000 08000000 00000008 00000000 04000000 000000=
08
00e0: 31181006 eee62377 11330f00 00000000 a0000200 00820000 01000000 000000=
00
0100: 00000000 00000000 01000000 00000000 e0060000 00000000 78164d4c 000100=
00
0120: 0a000000 00008000 2a000000 01010400 00000000 00000000 00000000 0f0000=
00
0140: 00010000 00000000 ff410000 01000000 01000000 00010000 00010000 000000=
00
0160: 00000200 01000400 00000208 00000800 00000000 01000000 00000000 000080=
00
0180: 31181006 32698d78 12330f00 00000100 40040000 03010000 01020000 dca307=
5b
01a0: 00002000 00800000 00000300 00000000 00000700 00040000 3336302e 676172=
00
01c0: 31181006 15f2f3d4 13338f00 00000100 a0000000 00010000 27260300 000000=
00
01e0: 00000000 00000000 cf320f00 00000000 61230000 00000000 0a040080 000000=
00
Spare Area
 ffffffff ffff3103 03ffffff ffffffff
brcmnand_post_mortem_dump at offset 48b1e00
Call Trace:
[<80016808>] dump_stack+0x8/0x34
[<802f93ec>] brcmnand_post_mortem_dump+0x48/0x11c
[<802fb0dc>] brcmnand_ctrl_posted_read_cache+0x71c/0x8d0
[<802f5824>] brcmnand_read_page+0xdc/0x228
[<802f6cbc>] brcmnand_do_read_ops+0xe4/0x2a8
[<802fa144>] brcmnand_read+0xd8/0x14c
[<802d3a44>] part_read+0x7c/0x124
[<803088b0>] ubi_io_read+0x8c/0x1a4
[<80308264>] ubi_eba_read_leb+0x130/0x2e8
[<80305c1c>] ubi_leb_read+0xf0/0x150
[<801e5dd4>] ubifs_start_scan+0x80/0x124
[<801f4f50>] ubifs_recover_leb+0x58/0x888
[<801e6c0c>] ubifs_replay_journal+0x5e4/0x1230
[<801dd5bc>] ubifs_get_sb+0xe14/0x13f0
[<800ccdcc>] vfs_kern_mount+0x50/0xbc
[<800cce8c>] do_kern_mount+0x44/0x128
[<800ec1c0>] do_mount+0x2d8/0x8d4
[<800ec840>] sys_mount+0x84/0xf8
[<804cef28>] do_mount_root+0x2c/0xc8
[<804cf204>] mount_block_root+0x12c/0x274
[<804cf584>] prepare_namespace+0xf4/0x240
[<804ce4d8>] kernel_init+0x208/0x234
[<80020cfc>] kernel_thread_helper+0x10/0x18

NAND registers snapshot

00442800:  00000303  01000000  00010000  048b1e00
00442810:  00000000  50000200  00000000  00000000
00442820:  ffffffff  ffff3103  03ffffff  ffffffff
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  d7ff1010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  20f1001d  20f1001d  00000000  f0000000
00442870:  00000000  00000000  00010000  048b1e00
00442880:  00000000  00000001  00000000  00000000
00442890:  00010000  048b1e00  00000000  00000000
004428a0:  00000000  00000000  00000000  00000000
004428b0:  00000000  00000000  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  d70f0010  15142200  5363444f  00000fc6
004428e0:  d7ff1010  15142200  5363444f  00000fc6
004428f0:  d7ff1010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at offset=3D48b1e0=
0, ret=3D-77
brcmnand_handle_false_read_ecc_unc_errors: Uncorrectable error at offset 48=
b1e00
Data:

0000: 31181006 575593c9 4f330f00 00004000 40004000 02010000 01000000 0c036b=
5c
0020: 04000000 00000000 34260200 00000000 00000700 00000000 7736392e 676172=
00
0040: 31181006 41eceb6d 10330f00 00000000 a0000000 00014000 30270200 000000=
02
0060: 00000000 00000000 0e330f00 00000000 00000000 00000000 0a000000 000000=
00
0080: 2a000000 01000000 0b000000 00000000 00000100 00000000 00000100 090010=
41
00a0: 00000000 00000000 a4810000 01000000 00000000 00000003 00000000 000040=
00
00c0: 00000000 89000102 00100000 08000000 00000008 00000000 04000000 000000=
08
00e0: 31181006 eee62377 11330f00 00000000 a0000200 00820000 01000000 000000=
00
0100: 00000000 00000000 01000000 00000000 e0060000 00000000 78164d4c 000100=
00
0120: 0a000000 00008000 2a000000 01010400 00000000 00000000 00000000 0f0000=
00
0140: 00010000 00000000 ff410000 01000000 01000000 00010000 00010000 000010=
00
0160: 00000200 01000400 00000208 00000800 00000000 01000000 00000000 000080=
00
0180: 31181006 32698d78 12330f00 00000100 40040000 03010000 01020000 dca307=
5b
01a0: 00002000 00800000 00000300 00000000 00000700 00040000 3336302e 676172=
00
01c0: 31181006 15f2f3d4 13338f00 00000100 a0000000 00010000 27260300 000000=
00
01e0: 00000000 00000000 cf320f00 00000000 61230000 00000000 0a040080 000000=
00
Spare Area
 ffffffff ffff3103 03ffffff ffffffff
brcmnand_post_mortem_dump at offset 48b1e00
Call Trace:
[<80016808>] dump_stack+0x8/0x34
[<802f93ec>] brcmnand_post_mortem_dump+0x48/0x11c
[<802fb0dc>] brcmnand_ctrl_posted_read_cache+0x71c/0x8d0
[<802f5824>] brcmnand_read_page+0xdc/0x228
[<802f6cbc>] brcmnand_do_read_ops+0xe4/0x2a8
[<802fa144>] brcmnand_read+0xd8/0x14c
[<802d3a44>] part_read+0x7c/0x124
[<8030890c>] ubi_io_read+0xe8/0x1a4
[<80308264>] ubi_eba_read_leb+0x130/0x2e8
[<80305c1c>] ubi_leb_read+0xf0/0x150
[<801e5dd4>] ubifs_start_scan+0x80/0x124
[<801f4f50>] ubifs_recover_leb+0x58/0x888
[<801e6c0c>] ubifs_replay_journal+0x5e4/0x1230
[<801dd5bc>] ubifs_get_sb+0xe14/0x13f0
[<800ccdcc>] vfs_kern_mount+0x50/0xbc
[<800cce8c>] do_kern_mount+0x44/0x128
[<800ec1c0>] do_mount+0x2d8/0x8d4
[<800ec840>] sys_mount+0x84/0xf8
[<804cef28>] do_mount_root+0x2c/0xc8
[<804cf204>] mount_block_root+0x12c/0x274
[<804cf584>] prepare_namespace+0xf4/0x240
[<804ce4d8>] kernel_init+0x208/0x234
[<80020cfc>] kernel_thread_helper+0x10/0x18

NAND registers snapshot

00442800:  00000303  01000000  00010000  048b1e00
00442810:  00000000  50000200  00000000  00000000
00442820:  ffffffff  ffff3103  03ffffff  ffffffff
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  d7ff1010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  20f1001d  20f1001d  00000000  f0000000
00442870:  00000000  00000000  00010000  048b1e00
00442880:  00000000  00000001  00000000  00000000
00442890:  00010000  048b1e00  00000000  00000000
004428a0:  00000000  00000000  00000000  00000000
004428b0:  00000000  00000000  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  d70f0010  15142200  5363444f  00000fc6
004428e0:  d7ff1010  15142200  5363444f  00000fc6
004428f0:  d7ff1010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at offset=3D48b1e0=
0, ret=3D-77
brcmnand_handle_false_read_ecc_unc_errors: Uncorrectable error at offset 48=
b1e00
Data:

0000: 31181006 575593c9 4f330f00 00004000 40004000 02010000 01000000 0c036b=
5c
0020: 04000000 00000000 34260200 00000000 00000700 00000000 7736392e 676172=
00
0040: 31181006 41eceb6d 10330f00 00000000 a0000000 00014000 30270200 000000=
02
0060: 00000000 00000000 0e330f00 00000000 00000000 00000000 0a000000 000000=
00
0080: 2a000000 01008000 0b000000 00000000 00000100 00000000 00000100 090010=
41
00a0: 00000000 00000000 a4810000 01000000 00000000 00000003 00000000 000040=
00
00c0: 00010000 89000102 00100000 08000000 00000008 00000000 04000000 000000=
08
00e0: 31181006 eee62377 19330f00 00000000 a0000200 00820000 01000000 000000=
00
0100: 00000000 00000000 01000000 00000000 e0060000 00000000 78164d4c 000100=
01
0120: 0a000000 00008000 2a000000 01010400 00000000 00000000 00000000 0f0000=
00
0140: 00010000 00000000 ff410000 01000000 01000000 00010000 00010000 000010=
00
0160: 00000200 01000400 00000208 00000800 00000000 01000000 00000000 000080=
00
0180: 31181006 32698d78 12330f00 00000100 40040000 03010000 01020000 dca307=
5b
01a0: 00002000 00800000 00000300 00000000 00000700 00040000 3336302e 676172=
00
01c0: 31181006 15f2f3d4 13338f00 00000100 a0000000 00010000 27260300 000000=
00
01e0: 00000000 00000000 cf320f00 00000000 61230000 00000000 0a040080 000000=
00
Spare Area
 ffffffff ffff3103 03ffffff ffffffff
brcmnand_post_mortem_dump at offset 48b1e00
Call Trace:
[<80016808>] dump_stack+0x8/0x34
[<802f93ec>] brcmnand_post_mortem_dump+0x48/0x11c
[<802fb0dc>] brcmnand_ctrl_posted_read_cache+0x71c/0x8d0
[<802f5824>] brcmnand_read_page+0xdc/0x228
[<802f6cbc>] brcmnand_do_read_ops+0xe4/0x2a8
[<802fa144>] brcmnand_read+0xd8/0x14c
[<802d3a44>] part_read+0x7c/0x124
[<8030890c>] ubi_io_read+0xe8/0x1a4
[<80308264>] ubi_eba_read_leb+0x130/0x2e8
[<80305c1c>] ubi_leb_read+0xf0/0x150
[<801e5dd4>] ubifs_start_scan+0x80/0x124
[<801f4f50>] ubifs_recover_leb+0x58/0x888
[<801e6c0c>] ubifs_replay_journal+0x5e4/0x1230
[<801dd5bc>] ubifs_get_sb+0xe14/0x13f0
[<800ccdcc>] vfs_kern_mount+0x50/0xbc
[<800cce8c>] do_kern_mount+0x44/0x128
[<800ec1c0>] do_mount+0x2d8/0x8d4
[<800ec840>] sys_mount+0x84/0xf8
[<804cef28>] do_mount_root+0x2c/0xc8
[<804cf204>] mount_block_root+0x12c/0x274
[<804cf584>] prepare_namespace+0xf4/0x240
[<804ce4d8>] kernel_init+0x208/0x234
[<80020cfc>] kernel_thread_helper+0x10/0x18

NAND registers snapshot

00442800:  00000303  01000000  00010000  048b1e00
00442810:  00000000  50000200  00000000  00000000
00442820:  ffffffff  ffff3103  03ffffff  ffffffff
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  d7ff1010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  20f1001d  20f1001d  00000000  f0000000
00442870:  00000000  00000000  00010000  048b1e00
00442880:  00000000  00000001  00000000  00000000
00442890:  00010000  048b1e00  00000000  00000000
004428a0:  00000000  00000000  00000000  00000000
004428b0:  00000000  00000000  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  d70f0010  15142200  5363444f  00000fc6
004428e0:  d7ff1010  15142200  5363444f  00000fc6
004428f0:  d7ff1010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at offset=3D48b1e0=
0, ret=3D-77
brcmnand_handle_false_read_ecc_unc_errors: Uncorrectable error at offset 48=
b1e00
Data:

0000: 31181006 575593c9 4f330f00 00004000 40004000 02010000 01000000 0c036b=
5c
0020: 04000000 00000000 34260200 00000000 00000700 00000000 7736392e 676172=
00
0040: 31181006 41e8eb6d 10330f00 00000000 a0000000 00010000 30270200 000000=
02
0060: 00000000 00000000 0e330f00 00000000 00000000 00000000 0a000000 000000=
00
0080: 2a000000 01000000 0b000000 00000000 00000000 00000000 00000100 090010=
41
00a0: 00000000 00000000 a4810000 01000000 00000000 00000003 00000000 000040=
00
00c0: 00000000 09000002 00100000 08000000 00000008 00000000 04000000 000000=
08
00e0: 31181006 eee62377 11330f00 00000000 a0000200 00820000 01000000 000000=
00
0100: 00000000 00000000 01000000 00000000 e0060000 00000000 78164d4c 000100=
00
0120: 0a000000 00008000 2a000000 01010400 00000000 00000000 00000000 0f0000=
00
0140: 00010000 00000000 ff410000 01000000 01000000 00010000 00010000 000000=
00
0160: 00000200 01000400 00000208 00000800 00000000 01000000 00000000 000080=
00
0180: 31181006 32698d78 12330f00 00000100 40040000 03010000 01020000 dca307=
5b
01a0: 00002000 00800000 00000300 00000000 00000700 00040000 3336302e 676172=
00
01c0: 31181006 15f2f3d4 13338f00 00000100 a0000000 00010000 27260300 000000=
00
01e0: 00000000 00000000 cf320f00 00000000 61230000 00000000 0a000000 000000=
00
Spare Area
 ffffffff ffff3103 03ffffff ffffffff
brcmnand_post_mortem_dump at offset 48b1e00
Call Trace:
[<80016808>] dump_stack+0x8/0x34
[<802f93ec>] brcmnand_post_mortem_dump+0x48/0x11c
[<802fb0dc>] brcmnand_ctrl_posted_read_cache+0x71c/0x8d0
[<802f5824>] brcmnand_read_page+0xdc/0x228
[<802f6cbc>] brcmnand_do_read_ops+0xe4/0x2a8
[<802fa144>] brcmnand_read+0xd8/0x14c
[<802d3a44>] part_read+0x7c/0x124
[<8030890c>] ubi_io_read+0xe8/0x1a4
[<80308264>] ubi_eba_read_leb+0x130/0x2e8
[<80305c1c>] ubi_leb_read+0xf0/0x150
[<801e5dd4>] ubifs_start_scan+0x80/0x124
[<801f4f50>] ubifs_recover_leb+0x58/0x888
[<801e6c0c>] ubifs_replay_journal+0x5e4/0x1230
[<801dd5bc>] ubifs_get_sb+0xe14/0x13f0
[<800ccdcc>] vfs_kern_mount+0x50/0xbc
[<800cce8c>] do_kern_mount+0x44/0x128
[<800ec1c0>] do_mount+0x2d8/0x8d4
[<800ec840>] sys_mount+0x84/0xf8
[<804cef28>] do_mount_root+0x2c/0xc8
[<804cf204>] mount_block_root+0x12c/0x274
[<804cf584>] prepare_namespace+0xf4/0x240
[<804ce4d8>] kernel_init+0x208/0x234
[<80020cfc>] kernel_thread_helper+0x10/0x18

NAND registers snapshot

00442800:  00000303  01000000  00010000  048b1e00
00442810:  00000000  50000200  00000000  00000000
00442820:  ffffffff  ffff3103  03ffffff  ffffffff
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  d7ff1010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  20f1001d  20f1001d  00000000  f0000000
00442870:  00000000  00000000  00010000  048b1e00
00442880:  00000000  00000001  00000000  00000000
00442890:  00010000  048b1e00  00000000  00000000
004428a0:  00000000  00000000  00000000  00000000
004428b0:  00000000  00000000  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  d70f0010  15142200  5363444f  00000fc6
004428e0:  d7ff1010  15142200  5363444f  00000fc6
004428f0:  d7ff1010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at offset=3D48b1e0=
0, ret=3D-77
UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB 581:4=
096, read 67584

bytes
UBIFS error (pid 1): ubifs_start_scan: cannot read 126976 bytes from LEB 44=
:0, error -5
VFS: Cannot open root device "ubi0:rootfs" or unknown-block(8,1)
Please append a correct "root=3D" boot option; here are the available parti=
tions:
0800       156290904 sda driver: sd
  0801         4112639 sda1
  0802          514080 sda2
  0803         8225280 sda3
  0804       143436352 sda4
1f00          122880 mtdblock0 (driver?)
1f01          130048 mtdblock1 (driver?)
1f02            4096 mtdblock2 (driver?)
1f03           32768 mtdblock3 (driver?)
1f04          117428 mtdblock4 (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(8=
,1)
Rebooting in 180 seconds..


For thoses cases, I'm working on a patch that esentially replicates each wr=
ite in a PEB, and deletes the backup PEB only if the write is successful. T=
o accomplish this, I'm working on eba.c (UBI layer) where I get for each wr=
ite another PEB with ubi_wl_get_peb(), then I write its VID header (I put i=
n the ubi_vid_hdr data structure an entry that, for each PEB, indicates wha=
t is the backup PEB) and the data, and then deletes the backup PEB only if =
the write of the original PEB returns. Otherwise a power cut could have hap=
pened and the system has been rebooted during the write and when the UBI pe=
rforms the scanning, process_eb() isolates the backup PEB, looking the VID =
header entries, and replaces the corrupted (partially written) PEB with its=
 content. Are there other solutions for the problems that I posted above?

Thanks
