Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SIISv-0004NW-QM
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2012 11:45:38 +0000
Received: by pbcun4 with SMTP id un4so2502373pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 12 Apr 2012 04:45:28 -0700 (PDT)
Message-ID: <4F86C039.8050603@gmail.com>
Date: Thu, 12 Apr 2012 19:44:57 +0800
From: Mark <xiaoming1981.zhang@gmail.com>
MIME-Version: 1.0
To: zxm927@163.com
Subject: UBIFS mount failed with "Invalid argument" after power cut
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

During FS stability test I get mount failures after power cut, all logs
and info listed below. Any suggestion?

Thank you very much.

# uname -a
Linux (none) 2.6.31-3.3 #10 SMP Wed Apr 11 09:18:13 CST 2012 mips GNU/Linux


# ls -l /usr/local/platform/f2
-rw-rw-r--    1 506      506        1048576 Apr 11  2012
/usr/local/platform/f2

# xxd f2
0000000: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
0000010: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
0000020: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
0000030: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................


# mount
rootfs on / type rootfs (rw)
...
ubi12:platform on /usr/local/platform type ubifs (rw,relatime)
ubi13_0 on /usr/local/appdata type ubifs (rw,sync,relatime)
ubi14_0 on /usr/local/.appmid type ubifs (rw,relatime)



# while :; do cp -a /usr/local/platform/f2 /usr/local/appdata/ && sync; done


--------------  power cut, and reboot -------------------------

......
UBI: attaching mtd12 to ubi12
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd12 to ubi12
UBI: MTD device name:            "platform"
UBI: MTD device size:            20 MiB
UBI: number of good PEBs:        160
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 160
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 4/1
UBI: image sequence number: 151810075
UBI: background thread "ubi_bgt12d" started, PID 454
UBI device number 12, total 160 LEBs (20316160 bytes, 19.4 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 12, volume 0, name "platform"
UBIFS: file system size:   17776640 bytes (17360 KiB, 16 MiB, 140 LEBs)
UBIFS: journal size:       2666496 bytes (2604 KiB, 2 MiB, 21 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBI: attaching mtd13 to ubi13
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd13 to ubi13
UBI: MTD device name:            "app_data"
UBI: MTD device size:            4 MiB
UBI: number of good PEBs:        32
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 32
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 21/16
UBI: image sequence number: 1719381099
UBI: background thread "ubi_bgt13d" started, PID 469
UBI device number 13, total 32 LEBs (4063232 bytes, 3.9 MiB), available
0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBI: attaching mtd14 to ubi14
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd14 to ubi14
UBI: MTD device name:            "mid_app"
UBI: MTD device size:            57 MiB
UBI: number of good PEBs:        457
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 457
UBI: number of PEBs reserved for bad PEB handling: 4
UBI: max/mean erase counter: 3/0
UBI: image sequence number: 1747526811
UBI: background thread "ubi_bgt14d" started, PID 476
UBI device number 14, total 457 LEBs (58028032 bytes, 55.3 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
p8[9]=05
brcmnand_handle_false_read_ecc_unc_errors: Uncorrectable error at offset
3a29000
Data:

0000: 31181006 b1c3074d 376f0000 00000000 a0300000 00020000 85000000
00000000
0020: 08000000 00001000 906e0000 02002001 00100500 00000000 1f000000
00000000
0040: 1f000000 00000000 1f000000 00200000 00000800 00000000 00000004
01000000
0060: 00000000 00000000 a4810000 01000000 04000400 00000000 00000004
00000000
0080: 00000000 01000000 00000000 02000000 00000018 00000000 00000000
00020000
00a0: 31181006 8413e1a0 00000000 00000001 1e100000 05200000 44070000
00000000
00c0: 00000008 00020000 00010000 00005400 00000800 40080000 00000000
00000000
00e0: 00000000 00000000 00000100 00000000 00200000 00800000 00000000
00000000
0100: 00000000 00400000 00000000 00000000 00000080 00000000 00000804
00000000
0120: 00000000 00000000 00010000 00000000 00000000 00000000 00000080
00000000
0140: 00400000 00000000 00050020 00000008 00004000 00000002 00000000
00000000
0160: 00000000 20000000 00014000 00000002 00000082 00000000 00000000
00400000
0180: 80000008 00000000 00000000 00000000 00100000 00000000 00000000
00000100
01a0: 00000000 00000000 00004000 04000008 00000000 00000000 00000004
00000000
01c0: 00000000 00000000 00000000 00000000 00000000 08000000 00000000
00000248
01e0: 10000040 00000000 00200000 00000000 00000000 00000000 00000000
08000000
Spare Area
 ffffffff ffffffff ff059201 92404bbe
brcmnand_post_mortem_dump at offset 3a29000
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<8030c8ac>] brcmnand_post_mortem_dump+0x54/0x128
[<803104d4>] brcmnand_ctrl_posted_read_cache+0x6f4/0x96c
[<80309d24>] brcmnand_read_page+0xd8/0x220
[<8030b1d0>] brcmnand_do_read_ops+0xe4/0x2a8
[<8030c1b0>] brcmnand_read+0xd0/0x144
[<802e7e34>] part_read+0x7c/0x124
[<8031db28>] ubi_io_read+0x8c/0x1a4
[<8031d4dc>] ubi_eba_read_leb+0x130/0x2e8
[<8031ae94>] ubi_leb_read+0xf0/0x150
[<801e7b94>] ubifs_start_scan+0x80/0x124
[<801f6d78>] ubifs_recover_leb+0x58/0x888
[<801e88f8>] ubifs_replay_journal+0x514/0x1274
[<801df36c>] ubifs_get_sb+0xe38/0x13e4
[<800cdc94>] vfs_kern_mount+0x50/0xbc
[<800cdd54>] do_kern_mount+0x44/0x128
[<800ed250>] do_mount+0x2d8/0x8d4
[<800ed8d0>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03a29000
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ff059201  92404bbe
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03a29000
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03a29000  00000000  03460600
004428a0:  00000000  00000000  00000000  03460000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3a29000, ret=-77
UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
2:4096, read 126976 bytes
UBIFS error (pid 481): insert_node: duplicate sqnum in replay
mount: mounting ubi13_0 on /usr/local/hmt/appdata failed: Invalid argument




========================== another failure, same test case
======================================


....
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd12 to ubi12
UBI: MTD device name:            "platform"
UBI: MTD device size:            20 MiB
UBI: number of good PEBs:        160
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 160
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 151810075
UBI: background thread "ubi_bgt12d" started, PID 453
UBI device number 12, total 160 LEBs (20316160 bytes, 19.4 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 12, volume 0, name "platform"
UBIFS: file system size:   17776640 bytes (17360 KiB, 16 MiB, 140 LEBs)
UBIFS: journal size:       2666496 bytes (2604 KiB, 2 MiB, 21 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBI: attaching mtd13 to ubi13
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd13 to ubi13
UBI: MTD device name:            "app_data"
UBI: MTD device size:            4 MiB
UBI: number of good PEBs:        32
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 32
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 16/11
UBI: image sequence number: 1719381099
UBI: background thread "ubi_bgt13d" started, PID 467
UBI device number 13, total 32 LEBs (4063232 bytes, 3.9 MiB), available
0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBI: attaching mtd14 to ubi14
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd14 to ubi14
UBI: MTD device name:            "mid_app"
UBI: MTD device size:            57 MiB
UBI: number of good PEBs:        457
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 457
UBI: number of PEBs reserved for bad PEB handling: 4
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 1747526811
UBI: background thread "ubi_bgt14d" started, PID 474
UBI device number 14, total 457 LEBs (58028032 bytes, 55.3 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
p8[9]=09
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3b6e200
Data:

0000: 00040010 00000000 00000000 00880000 00000000 00000000 00000080
00000000
0020: 00000004 40000400 00000000 08000081 00000000 00200000 00000000
00000000
0040: 00000000 00000000 00000000 00000800 00040000 04000000 00110000
00000000
0060: 00000000 00000800 00000200 00800000 00000000 04000000 00000020
00100000
0080: 00000020 00000440 000000a4 00000002 00000000 00000000 00000804
80000000
00a0: 00000000 00040200 00088080 00000000 00000000 00400020 00000000
00000200
00c0: 40000000 00000000 00000000 00000000 00000040 00000000 00001000
00000000
00e0: 00000000 000c0000 00000000 00800000 00000000 00000000 00000000
00000040
0100: 00000000 04000000 00000000 00000000 00000000 00000000 00000000
00000000
0120: 10000000 00000002 00180000 00000000 01800000 00000000 00000080
00000000
0140: 00000000 00000000 00080000 00080000 00000000 00000000 00000000
00400000
0160: 00000000 00000000 00000000 00000000 00000000 00000000 00000040
00000000
0180: 00000000 00000000 00000000 00000000 00000000 00002010 40080000
00000000
01a0: 00080000 00000000 00000000 00010010 00000100 00828000 00000000
00000000
01c0: 00000000 00000000 00000000 00000000 00000000 00000000 00000008
08000000
01e0: 00020000 00000000 00004000 00000000 00000000 00000000 00000000
00000000
Spare Area
 ffffffff ffffffff ff092f23 d917cef6
brcmnand_post_mortem_dump at offset 3b6e200
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293a0>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cfc8>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327cf0>] brcmnand_do_read_ops+0xdc/0x274
[<80328ca4>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a618>] ubi_io_read+0x8c/0x1a4
[<80339fcc>] ubi_eba_read_leb+0x130/0x2e8
[<80337984>] ubi_leb_read+0xf0/0x150
[<801efa48>] ubifs_start_scan+0x8c/0x18c
[<8020a830>] ubifs_recover_leb+0x78/0xc88
[<801f0d10>] ubifs_replay_journal+0x580/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03b6e200
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ff092f23  d917cef6
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03b6e200
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03b6e200  00000000  03880600
004428a0:  00000000  00000000  00000000  03880000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3b6e200, ret=-77
p8[9]=09
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3b6e200
Data:

0000: 00040010 00000000 00000000 00880000 00000000 00000000 00000080
00000000
0020: 00000004 40000400 00000000 08000081 00000000 00200000 00000000
00000000
0040: 00000000 00000000 00000000 00000800 00040000 04000000 00110000
00000000
0060: 00000000 00000000 00000200 00800000 00000000 04000000 00000000
00100000
0080: 00000020 00000440 000000a4 00000002 00000000 00000000 00000804
80000000
00a0: 00000000 00040200 00088080 00000000 00000000 00400020 00000000
00000200
00c0: 40000000 00000000 00000000 00000000 00000040 00000000 00001000
00000000
00e0: 00000000 000c0000 00000000 00800000 00000000 00000000 00000000
00000040
0100: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
0120: 10000000 00000002 00180000 00000000 01800000 00000000 00000080
00000000
0140: 00000000 00000000 00080000 00080000 00000000 00000000 00000000
00400000
0160: 00000000 00000000 00000000 00000000 00000000 00000000 00000040
00000000
0180: 00000000 00000000 00000000 00000000 00000000 00002010 00080000
00000000
01a0: 00080000 00000000 00000000 00010010 00000100 00808000 00000000
00000000
01c0: 00000000 00000000 00000000 00000000 00000000 00000000 00000008
08000000
01e0: 00020000 00000000 00004000 00000000 00000000 00000000 00000000
00000000
Spare Area
 ffffffff ffffffff ff092f23 d917cef6
brcmnand_post_mortem_dump at offset 3b6e200
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293a0>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cfc8>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327d78>] brcmnand_do_read_ops+0x164/0x274
[<80328ca4>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a618>] ubi_io_read+0x8c/0x1a4
[<80339fcc>] ubi_eba_read_leb+0x130/0x2e8
[<80337984>] ubi_leb_read+0xf0/0x150
[<801ecc84>] fallible_read_node+0x88/0x330
[<801ed000>] fallible_matches_name+0xd4/0x16c
[<801ed104>] fallible_resolve_collision+0x6c/0x4b4
[<801ed6e4>] ubifs_tnc_remove_nm+0x198/0x2a8
[<801edc90>] ubifs_tnc_add_nm+0x244/0x374
[<801f1814>] ubifs_replay_journal+0x1084/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03b6e200
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ff092f23  d917cef6
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03b6e200
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03b6e200  00000000  03880600
004428a0:  00000000  00000000  00000000  03880000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3b6e200, ret=-77
UBIFS: recovery completed
UBIFS: mounted UBI device 13, volume 0, name "appdata"
UBIFS: file system size:   2031616 bytes (1984 KiB, 1 MiB, 16 LEBs)
UBIFS: journal size:       1904640 bytes (1860 KiB, 1 MiB, 15 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
p8[9]=09
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3b6e200
Data:

0000: 00040010 00000000 00000000 00880000 00000000 00000000 00000080
00000000
0020: 00000004 40000400 00000000 08000081 00000000 00200000 00000000
00000000
0040: 00000000 00000000 00000000 00000800 00040000 04000000 00110000
00000000
0060: 00000000 00000000 00000200 00800000 00000000 04000000 00000020
00100000
0080: 00000020 00000440 000000a4 00000002 00000000 00000000 00000804
80000000
00a0: 00000000 00040200 00088080 00000000 00000000 00400020 00000000
00000200
00c0: 40000000 00000000 00000000 00000000 00000040 00000000 00001000
00000000
00e0: 00000000 000c0000 00000000 00800000 00000000 00000000 00000000
00000040
0100: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
0120: 10000000 00000002 00180000 00000000 01800000 00000000 00000080
00000000
0140: 00000000 00000000 00080000 00080000 00000000 00000000 00000000
00400000
0160: 00000000 00000000 00000000 00000000 00000000 00000000 00000040
00000000
0180: 00000000 00000000 00000000 00000000 00000000 00002010 00080000
00000000
01a0: 00080000 00000000 00000000 00010010 00000100 00808000 00000000
00000000
01c0: 00000000 00000000 00000000 00000000 00000000 00000000 00000008
08000000
01e0: 00020000 00000000 00004000 00000000 00000000 00000000 00000000
00000000
Spare Area
 ffffffff ffffffff ff092f23 d917cef6
brcmnand_post_mortem_dump at offset 3b6e200
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293a0>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cfc8>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327d78>] brcmnand_do_read_ops+0x164/0x274
[<80328ca4>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a618>] ubi_io_read+0x8c/0x1a4
[<80339fcc>] ubi_eba_read_leb+0x130/0x2e8
[<80337984>] ubi_leb_read+0xf0/0x150
[<801e64b4>] ubifs_read_node+0xcc/0x3bc
[<80211274>] ubifs_tnc_read_node+0x64/0x220
[<801ee00c>] ubifs_tnc_locate+0x24c/0x27c
[<801e140c>] ubifs_iget+0xa4/0x734
[<801e2350>] ubifs_fill_super+0x8b4/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03b6e200
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ff092f23  d917cef6
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03b6e200
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03b6e200  00000000  03a40600
004428a0:  00000000  00000000  00000000  03a40000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3b6e200, ret=-77
UBIFS error (pid 479): ubifs_check_node: bad magic 0x86861338, expected
0x6101831
UBIFS error (pid 479): ubifs_check_node: bad node at LEB 21:53472
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<801e627c>] ubifs_check_node+0x1b4/0x320
[<801e64ec>] ubifs_read_node+0x104/0x3bc
[<80211274>] ubifs_tnc_read_node+0x64/0x220
[<801ee00c>] ubifs_tnc_locate+0x24c/0x27c
[<801e140c>] ubifs_iget+0xa4/0x734
[<801e2350>] ubifs_fill_super+0x8b4/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

UBIFS error (pid 479): ubifs_read_node: expected node type 0
UBIFS error (pid 479): ubifs_iget: failed to read inode 1, error -135
mount: mounting ubi13_0 on /usr/local/hmt/appdata failed: Structure
needs cleaning
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 14, volume 0, name "app_mid"
UBIFS: file system size:   55615488 bytes (54312 KiB, 53 MiB, 438 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
Initializing broadcom driver...
bcmscbeth: module license 'Proprietary' taints kernel.
Disabling lock debugging due to kernel taint
bcm0: MBOX_SHM_ADDR at init!
bcm0: Broadcom BCM7019(E0) Virtual Ethernet Driver v1.18 Apr 12 2012
10:46:23
bcm1: Broadcom BCM7019(E0) Virtual Ethernet Driver v1.18 Apr 12 2012
10:46:23
bcm0: MBOX_DMA_READY!
device bcm1 entered promiscuous mode
device eth0 entered promiscuous mode
br0: port 1(eth0) entering learning state
br0: port 2(bcm1) entering learning state
br0: starting userspace STP failed, starting kernel STP
Internet Systems Consortium DHCP Server V3.0.5
Copyright 2004-2006 Internet Systems Consortium.
All rights reserved.
For info, please visit http://www.isc.org/sw/dhcp/
Wrote 0 deleted host decls to leases file.
Wrote 0 new dynamic host decls to leases file.
Wrote 0 leases to leases file.
Listening on LPF/br0/00:22:11:44:33:72/193.1.254/24
Sending on   LPF/br0/00:22:11:44:33:72/193.1.254/24
Sending on   Socket/fallback/fallback-net
udhcpc (v1.16.1) started
Sending discover...
mtdocap: Broadcom MTDOCAP driver v1.10 Apr 12 2012 10:46:24
insmod nexus ko...
main
Could not find ecm_prog_storage.  Setting up symbolic link to new eCM
Image Storage Path mtd_block3...
Could not find mtd_block3.  Creating...
Sending discover...
Sending select for 192.168.100.10...
nexus: module_layout: kernel tainted.
nexus driver initialized
platform_main_init_todo
open log data error!
DRV_Flash_SetModuleInitParam entry
DRV_Flash_SetModuleInitParam finished
*** 00:00:00.651 nexus_platform: Release 97125 7.5
*** 00:00:00.651 BCHP_PWR: BCHP_PWR power management disabled
UBIFS DBG (pid 651): do_readpage: ino 84, pg 275, i_size 3258056, flags 0x1
UBIFS DBG (pid 651): ubifs_lookup_level0: search key (84, data, 275)
UBIFS DBG (pid 651): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 651): fallible_read_node: LEB 29:105096, key (84, data, 275)
UBIFS DBG (pid 651): try_read_node: LEB 29:105096, data node, length 1940
### 00:00:00.653 nexus_platform_config:
*****************************************************
### 00:00:00.653 nexus_platform_config: GISB Timeout writing addr
0x10310000 by core BSP
### 00:00:00.653 nexus_platform_config: This GISB timeout occured before
nexus started.
### 00:00:00.653 nexus_platform_config:
*****************************************************
*** 00:00:00.656 BMRC_MONITOR: ARC0 is protecting low memory for range
0x0...0x6e00040 (110 MB)
*** 00:00:00.665 nexus_audio_module: FW download used
UBIFS DBG (pid 652): do_readpage: ino 84, pg 243, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 243)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 652): fallible_read_node: LEB 29:54008, key (84, data, 243)
UBIFS DBG (pid 652): try_read_node: LEB 29:54008, data node, length 2292
UBIFS DBG (pid 652): do_readpage: ino 84, pg 478, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 478)
UBIFS DBG (pid 652): ubifs_read_node: LEB 110:28776, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 110:28776, level 1, 8 branch
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:33216, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:33216, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 652): fallible_read_node: LEB 33:3064, key (84, data, 478)
UBIFS DBG (pid 652): try_read_node: LEB 33:3064, data node, length 2909
UBIFS DBG (pid 652): do_readpage: ino 84, pg 558, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 558)
UBIFS DBG (pid 652): ubifs_read_node: LEB 110:28968, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 110:28968, level 1, 8 branch
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:34944, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:34944, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 34:91416, key (84, data, 558)
UBIFS DBG (pid 652): try_read_node: LEB 34:91416, data node, length 2684
UBIFS DBG (pid 652): do_readpage: ino 84, pg 566, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 566)
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:35136, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:35136, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 34:113240, key (84, data, 566)
UBIFS DBG (pid 652): try_read_node: LEB 34:113240, data node, length 2517
UBIFS DBG (pid 652): do_readpage: ino 84, pg 567, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 567)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 34:115760, key (84, data, 567)
UBIFS DBG (pid 652): try_read_node: LEB 34:115760, data node, length 3381
UBIFS DBG (pid 652): do_readpage: ino 84, pg 428, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 428)
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:32256, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:32256, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 652): fallible_read_node: LEB 32:20152, key (84, data, 428)
UBIFS DBG (pid 652): try_read_node: LEB 32:20152, data node, length 3002
UBIFS DBG (pid 652): do_readpage: ino 84, pg 424, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 424)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 652): fallible_read_node: LEB 32:9552, key (84, data, 424)
UBIFS DBG (pid 652): try_read_node: LEB 32:9552, data node, length 2891
UBIFS DBG (pid 652): do_readpage: ino 84, pg 425, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 425)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 652): fallible_read_node: LEB 32:12448, key (84, data, 425)
UBIFS DBG (pid 652): try_read_node: LEB 32:12448, data node, length 1793
UBIFS DBG (pid 652): do_readpage: ino 84, pg 476, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 476)
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:33024, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:33024, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 32:125208, key (84, data, 476)
UBIFS DBG (pid 652): try_read_node: LEB 32:125208, data node, length 1715
, data node, length 2868
UBIFS DBG (pid 652): do_readpage: ino 84, pg 678, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 678)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 37:2872, key (84, data, 678)
UBIFS DBG (pid 652): try_read_node: LEB 37:2872, data node, length 2759
UBIFS DBG (pid 652): do_readpage: ino 84, pg 679, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 679)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 37:5632, key (84, data, 679)
UBIFS DBG (pid 652): try_read_node: LEB 37:5632, data node, length 2600
UBIFS DBG (pid 652): do_readpage: ino 84, pg 680, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 680)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 652): fallible_read_node: LEB 37:8232, key (84, data, 680)
UBIFS DBG (pid 652): try_read_node: LEB 37:8232, data node, length 2658
UBIFS DBG (pid 652): do_readpage: ino 84, pg 681, i_size 3258056, flags 0x21
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 681)
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:37824, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:37824, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 652): fallible_read_node: LEB 37:10896, key (84, data, 681)
UBIFS DBG (pid 652): try_read_node: LEB 37:10896, data node, length 2606
UBIFS DBG (pid 652): do_readpage: ino 84, pg 682, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 682)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 652): fallible_read_node: LEB 37:13504, key (84, data, 682)
UBIFS DBG (pid 652): try_read_node: LEB 37:13504, data node, length 2691
UBIFS DBG (pid 652): do_readpage: ino 84, pg 683, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 683)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 652): fallible_read_node: LEB 37:16200, key (84, data, 683)
UBIFS DBG (pid 652): try_read_node: LEB 37:16200, data node, length 2795
UBIFS DBG (pid 652): do_readpage: ino 84, pg 684, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 684)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 652): fallible_read_node: LEB 37:19000, key (84, data, 684)
UBIFS DBG (pid 652): try_read_node: LEB 37:19000, data node, length 2830
UBIFS DBG (pid 652): do_readpage: ino 84, pg 685, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 685)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 652): fallible_read_node: LEB 37:21832, key (84, data, 685)
UBIFS DBG (pid 652): try_read_node: LEB 37:21832, data node, length 2708
UBIFS DBG (pid 652): do_readpage: ino 84, pg 686, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 686)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 37:24544, key (84, data, 686)
UBIFS DBG (pid 652): try_read_node: LEB 37:24544, data node, length 2629
UBIFS DBG (pid 652): do_readpage: ino 84, pg 687, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 687)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 37:27176, key (84, data, 687)
UBIFS DBG (pid 652): try_read_node: LEB 37:27176, data node, length 2833
UBIFS DBG (pid 652): do_readpage: ino 84, pg 688, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 688)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS pg 724, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 724)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 37:80016, key (84, data, 724)
UBIFS DBG (pid 652): try_read_node: LEB 37:80016, data node, length 800
UBIFS DBG (pid 652): do_readpage: ino 84, pg 725, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 725)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 37:80816, key (84, data, 725)
UBIFS DBG (pid 652): try_read_node: LEB 37:80816, data node, length 1304
UBIFS DBG (pid 652): do_readpage: ino 84, pg 726, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 726)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 652): fallible_read_node: LEB 37:82120, key (84, data, 726)
UBIFS DBG (pid 652): try_read_node: LEB 37:82120, data node, length 2108
UBIFS DBG (pid 652): do_readpage: ino 84, pg 727, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 727)
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:38784, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:38784, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 652): fallible_read_node: LEB 37:84232, key (84, data, 727)
UBIFS DBG (pid 652): try_read_node: LEB 37:84232, data node, length 1416
UBIFS DBG (pid 652): do_readpage: ino 84, pg 728, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 728)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 652): fallible_read_node: LEB 37:85648, key (84, data, 728)
UBIFS DBG (pid 652): try_read_node: LEB 37:85648, data node, length 2480
UBIFS DBG (pid 652): do_readpage: ino 84, pg 729, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 729)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 652): fallible_read_node: LEB 37:88128, key (84, data, 729)
UBIFS DBG (pid 652): try_read_node: LEB 37:88128, data node, length 1696
UBIFS DBG (pid 652): do_readpage: ino 84, pg 730, i_size 3258056, flags 0x21
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 730)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 652): fallible_read_node: LEB 37:89824, key (84, data, 730)
UBIFS DBG (pid 652): try_read_node: LEB 37:89824, data node, length 2366
UBIFS DBG (pid 652): do_readpage: ino 84, pg 731, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 731)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 652): fallible_read_node: LEB 37:92192, key (84, data, 731)
UBIFS DBG (pid 652): try_read_node: LEB 37:92192, data node, length 2682
UBIFS DBG (pid 652): do_readpage: ino 84, pg 732, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 732)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 37:94880, key (84, data, 732)
UBIFS DBG (pid 652): try_read_node: LEB 37:94880, data node, length 2659
UBIFS DBG (pid 652): do_readpage: ino 84, pg 733, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 733)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 37:97544, key (84, data, 733)
UBIFS DBG (pid 652): try_read_node: LEB 37:97544, data node, length 2979
UBIFS DBG (pid 652): do_readpage: ino 84, pg 734, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 734)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 652): fallible_read_node: LEB 37:100528, key (84, data, 734)
UBIFS DBG (pid 652): try_read_node: LEB 37:100528, data node, length 2812
UBIFS DBG (pid 652): do_readpage: ino 84, pg 735, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 735)
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:38976, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:38976, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 652): fallible_read_node: LEB 37:103344, key (84, data, 735)
UBIFS DBG (pid 652): try_read_node: LEB 37:103344, data node, length 2637
UBIFS DBG (pid 652): do_readpage: ino 84, pg 736, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 736)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 1
Lease of 192.168.100.10 obtained, lease time 30
UBIFS DBG (pid 652): fallible_read_node: LEB 37:105984, key (84, data, 736)
UBIFS DBG (pid 652): try_read_node: LEB 37:105984, data node, length 2948
UBIFS DBG (pid 652): do_readpage: ino 84, pg 737, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 737)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 652): fallible_read_node: LEB 37:108936, key (84, data, 737)
UBIFS DBG (pid 652): try_read_node: LEB 37:108936, data node, length 2816
UBIFS DBG (pid 652): do_readpage: ino 84, pg 738, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 738)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 652): fallible_read_node: LEB 37:111752, key (84, data, 738)
UBIFS DBG (pid 652): try_read_node: LEB 37:111752, data node, length 2521
UBIFS DBG (pid 652): do_readpage: ino 84, pg 739, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 739)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 652): fallible_read_node: LEB 37:114280, key (84, data, 739)
UBIFS DBG (pid 652): try_read_node: LEB 37:114280, data node, length 2829
UBIFS DBG (pid 652): do_readpage: ino 84, pg 740, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 740)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 37:117112, key (84, data, 740)
UBIFS DBG (pid 652): try_read_node: LEB 37:117112, data node, length 2661
UBIFS DBG (pid 652): do_readpage: ino 84, pg 741, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 741)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 37:119776, key (84, data, 741)
UBIFS DBG (pid 652): try_read_node: LEB 37:119776, data node, length 2580
UBIFS DBG (pid 652): do_readpage: ino 84, pg 742, i_size 3258056, flags 0x1
deleting routers
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 742)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 652): fallible_read_node: LEB 37:122360, key (84, data, 742)
UBIFS DBG (pid 652): try_read_node: LEB 37:122360, data node, length 2349
UBIFS DBG (pid 652): do_readpage: ino 84, pg 743, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 743)
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:39168, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:39168, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 652): fallible_read_node: LEB 38:0, key (84, data, 743)
UBIFS DBG (pid 652): try_read_node: LEB 38:0, data node, length 2674
UBIFS DBG (pid 652): do_readpage: ino 84, pg 744, i_size 3258056, flags 0x21
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 744)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 652): fallible_read_node: LEB 38:2680, key (84, data, 744)
UBIFS DBG (pid 652): try_read_node: LEB 38:2680, data node, length 2942
UBIFS DBG (pid 652): do_readpage: ino 84, pg 745, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 745)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 652): fallible_read_node: LEB 38:5624, key (84, data, 745)
UBIFS DBG (pid 652): try_read_node: LEB 38:5624, data node, length 2913
UBIFS DBG (pid 652): do_readpage: ino 84, pg 746, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 746)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 652): fallible_read_node: LEB 38:8544, key (84, data, 746)
UBIFS DBG (pid 652): try_read_node: LEB 38:8544, data node, length 2718
UBIFS DBG (pid 652): do_readpage: ino 84, pg 747, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 747)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 652): fallible_read_node: LEB 38:11264, key (84, data, 747)
UBIFS DBG (pid 652): try_read_node: LEB 38:11264, data node, length 2900
UBIFS DBG (pid 652): do_readpage: ino 84, pg 748, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 748)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 38:14168, key (84, data, 748)
UBIFS DBG (pid 652): try_read_node: LEB 38:14168, data node, length 2850
UBIFS DBG (pid 652): do_readpage: ino 84, pg 749, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 749)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 38:17024, key (84, data, 749)
UBIFS DBG (pid 652): try_read_node: LEB 38:17024, data node, length 2876
UBIFS DBG (pid 652): do_readpage: ino 84, pg 750, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 750)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 652): fallible_read_node: LEB 38:19904, key (84, data, 750)
UBIFS DBG (pid 652): try_read_node: LEB 38:19904, data node, length 2857
UBIFS DBG (pid 652): do_readpage: ino 84, pg 751, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 751)
UBIFS DBG (pid 652): ubifs_read_node: LEB 109:39360, indexing node,
length 188
UBIFS DBG (pid 652): read_znode: LEB 109:39360, level 0, 8 branch
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 652): fallible_read_node: LEB 38:22768, key (84, data, 751)
UBIFS DBG (pid 652): try_read_node: LEB 38:22768, data node, length 1932
UBIFS DBG (pid 652): do_readpage: ino 84, pg 752, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 752)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 652): fallible_read_node: LEB 38:24704, key (84, data, 752)
UBIFS DBG (pid 652): try_read_node: LEB 38:24704, data node, length 1987
UBIFS DBG (pid 652): do_readpage: ino 84, pg 753, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 753)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 652): fallible_read_node: LEB 38:26696, key (84, data, 753)
UBIFS DBG (pid 652): try_read_node: LEB 38:26696, data node, length 1910
UBIFS DBG (pid 652): do_readpage: ino 84, pg 754, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 754)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 652): fallible_read_node: LEB 38:28608, key (84, data, 754)
UBIFS DBG (pid 652): try_read_node: LEB 38:28608, data node, length 1924
UBIFS DBG (pid 652): do_readpage: ino 84, pg 755, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 755)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 652): fallible_read_node: LEB 38:30536, key (84, data, 755)
UBIFS DBG (pid 652): try_read_node: LEB 38:30536, data node, length 1981
UBIFS DBG (pid 652): do_readpage: ino 84, pg 756, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 756)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 38:32520, key (84, data, 756)
UBIFS DBG (pid 652): try_read_node: LEB 38:32520, data node, length 1840
UBIFS DBG (pid 652): do_readpage: ino 84, pg 757, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 757)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 38:34360, key (84, data, 757)
UBIFS DBG (pid 652): try_read_node: LEB 38:34360, data node, length 1839
UBIFS DBG (pid 652): do_readpage: ino 84, pg 758, i_size 3258056, flags 0x21
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 758)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 652): fallible_read_node: LEB 38:36200, key (84, data, 758)
UBIFS DBG (pid 652): try_read_node: LEB 38:36200, data node, length 2072
UBIFS DBG (pid 652): do_readpage: ino 84, pg 759, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 759)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 652): fallible_read_node: LEB 38:38272, key (84, data, 759)
UBIFS DBG (pid 652): try_read_node: LEB 38:38272, data node, length 2169
UBIFS DBG (pid 652): do_readpage: ino 84, pg 760, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 760)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 652): fallible_read_node: LEB 38:40448, key (84, data, 760)
UBIFS DBG (pid 652): try_read_node: LEB 38:40448, data node, length 1869
UBIFS DBG (pid 652): do_readpage: ino 84, pg 761, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 761)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 652): fallible_read_node: LEB 38:42320, key (84, data, 761)
UBIFS DBG (pid 652): try_read_node: LEB 38:42320, data node, length 1819
UBIFS DBG (pid 652): do_readpage: ino 84, pg 762, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 762)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 652): fallible_read_node: LEB 38:44144, key (84, data, 762)
UBIFS DBG (pid 652): try_read_node: LEB 38:44144, data node, length 1829
UBIFS DBG (pid 652): do_readpage: ino 84, pg 763, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 763)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 652): fallible_read_node: LEB 38:45976, key (84, data, 763)
UBIFS DBG (pid 652): try_read_node: LEB 38:45976, data node, length 1877
UBIFS DBG (pid 652): do_readpage: ino 84, pg 764, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 764)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 652): fallible_read_node: LEB 38:47856, key (84, data, 764)
UBIFS DBG (pid 652): try_read_node: LEB 38:47856, data node, length 1404
UBIFS DBG (pid 652): do_readpage: ino 84, pg 765, i_size 3258056, flags 0x1
UBIFS DBG (pid 652): ubifs_lookup_level0: search key (84, data, 765)
UBIFS DBG (pid 652): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 652): fallible_read_node: LEB 38:49264, key (84, data, 765)
UBIFS DBG (pid 652): try_read_node: LEB 38:49264, data node, length 1401
*** 00:00:01.152 BXVD: BXVD_Open() - Firmware revision: 150336
*** 00:00:01.172 nexus_platform_config: softI2c = false
*** 00:00:01.177 nexus_frontend_3255:  waiting for 3255 booting up!
*** 00:00:01.181 nexus_frontend_3255:  RPC is initialized between 3255
and 740x
UBIFS DBG (pid 656): ubifs_lookup: 'route' in dir ino 152
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (152, direntry,
0x134b8ec9)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 0, lvl 0, n 1
UBIFS DBG (pid 656): ubifs_lookup: not found
!!!Error BRPC_CallProc(h3255ObDev->hRpc, BRPC_ProcId_TNR_Oob_Open,
(const uint32_t *)&Param, (sizeof(Param)/sizeof(long)), ((void *)0), 0,
&retVal)(0x9) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/../magnum/portinginterface/tnr/3255ob/btnr_3255ob.c:250
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1155
UBIFS DBG (pid 606): do_readpage: ino 169, pg 143, i_size 1172304, flags 0x1
UBIFS DBG (pid 606): ubifs_lookup_level0: search key (169, data, 143)
UBIFS DBG (pid 606): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 606): fallible_read_node: LEB 94:104064, key (169, data, 143)
UBIFS DBG (pid 606): try_read_node: LEB 94:104064, data node, length 1491
cm_reachable.sh: ping 192.168.100.1 succeed. reset FAIL_CNT to 0
*** 00:00:04.889 nexus_frontend_3255:  waiting for 3255 booting up!
*** 00:00:04.891 nexus_frontend_3255:  RPC is initialized between 3255
and 740x
!!!Error BRPC_CallProc(h3255ObDev->hRpc, BRPC_ProcId_TNR_Oob_Open,
(const uint32_t *)&Param, (sizeof(Param)/sizeof(long)), ((void *)0), 0,
&retVal)(0x9) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/../magnum/portinginterface/tnr/3255ob/btnr_3255ob.c:250
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1155
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1164
*** 00:00:07.899 nexus_platform: initialized
UBIFS DBG (pid 649): do_readpage: ino 84, pg 81, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 81)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:25152, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:25152, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 26:49976, key (84, data, 81)
UBIFS DBG (pid 649): try_read_node: LEB 26:49976, data node, length 951
UBIFS DBG (pid 649): do_readpage: ino 84, pg 80, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 80)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 26:49040, key (84, data, 80)
UBIFS DBG (pid 649): try_read_node: LEB 26:49040, data node, length 934
UBIFS DBG (pid 649): do_readpage: ino 84, pg 78, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 78)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 26:47232, key (84, data, 78)
UBIFS DBG (pid 649): try_read_node: LEB 26:47232, data node, length 1029
UBIFS DBG (pid 649): do_readpage: ino 84, pg 71, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 71)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:24960, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:24960, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 26:41248, key (84, data, 71)
UBIFS DBG (pid 649): try_read_node: LEB 26:41248, data node, length 1217
UBIFS DBG (pid 649): do_readpage: ino 84, pg 70, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 70)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 26:40088, key (84, data, 70)
UBIFS DBG (pid 649): try_read_node: LEB 26:40088, data node, length 1157
UBIFS DBG (pid 649): do_readpage: ino 84, pg 69, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 69)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 26:39080, key (84, data, 69)
UBIFS DBG (pid 649): try_read_node: LEB 26:39080, data node, length 1002
UBIFS DBG (pid 649): do_readpage: ino 84, pg 62, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 62)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:24768, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:24768, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 26:33528, key (84, data, 62)
UBIFS DBG (pid 649): try_read_node: LEB 26:33528, data node, length 904
UBIFS DBG (pid 649): do_readpage: ino 84, pg 59, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 59)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 26:30576, key (84, data, 59)
UBIFS DBG (pid 649): try_read_node: LEB 26:30576, data node, length 1234
UBIFS DBG (pid 649): do_readpage: ino 84, pg 54, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 54)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:24576, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:24576, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 26:26336, key (84, data, 54)
UBIFS DBG (pid 649): try_read_node: LEB 26:26336, data node, length 931
UBIFS DBG (pid 649): do_readpage: ino 84, pg 53, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 53)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 26:25064, key (84, data, 53)
UBIFS DBG (pid 649): try_read_node: LEB 26:25064, data node, length 1266
UBIFS DBG (pid 649): do_readpage: ino 84, pg 52, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 52)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 26:24080, key (84, data, 52)
UBIFS DBG (pid 649): try_read_node: LEB 26:24080, data node, length 977
UBIFS DBG (pid 649): do_readpage: ino 84, pg 47, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 47)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 26:19976, key (84, data, 47)
UBIFS DBG (pid 649): try_read_node: LEB 26:19976, data node, length 1003
UBIFS DBG (pid 649): do_readpage: ino 84, pg 46, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 46)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 26:18952, key (84, data, 46)
UBIFS DBG (pid 649): try_read_node: LEB 26:18952, data node, length 1024
UBIFS DBG (pid 649): do_readpage: ino 84, pg 265, i_size 3258056, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 265)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 29:88200, key (84, data, 265)
UBIFS DBG (pid 649): try_read_node: LEB 29:88200, data node, length 1809
UBIFS DBG (pid 649): do_readpage: ino 84, pg 45, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 45)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 26:17968, key (84, data, 45)
UBIFS DBG (pid 649): try_read_node: LEB 26:17968, data node, length 984
UBIFS DBG (pid 649): do_readpage: ino 84, pg 44, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 44)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 26:16952, key (84, data, 44)
UBIFS DBG (pid 649): try_read_node: LEB 26:16952, data node, length 1010
UBIFS DBG (pid 649): do_readpage: ino 84, pg 43, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 43)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 26:15696, key (84, data, 43)
UBIFS DBG (pid 649): try_read_node: LEB 26:15696, data node, length 1250
UBIFS DBG (pid 649): do_readpage: ino 84, pg 39, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 39)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 26:8032, key (84, data, 39)
UBIFS DBG (pid 649): try_read_node: LEB 26:8032, data node, length 2322
UBIFS DBG (pid 675): do_readpage: ino 84, pg 88, i_size 3258056, flags 0x1
UBIFS DBG (pid 675): ubifs_lookup_level0: search key (84, data, 88)
UBIFS DBG (pid 675): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 675): fallible_read_node: LEB 26:62384, key (84, data, 88)
UBIFS DBG (pid 675): try_read_node: LEB 26:62384, data node, length 2495
UBIFS DBG (pid 649): do_readpage: ino 84, pg 241, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 241)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 29:48992, key (84, data, 241)
UBIFS DBG (pid 649): try_read_node: LEB 29:48992, data node, length 2498
UBIFS DBG (pid 649): do_readpage: ino 84, pg 239, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 239)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 29:44664, key (84, data, 239)
UBIFS DBG (pid 649): try_read_node: LEB 29:44664, data node, length 2112
UBIFS DBG (pid 649): do_readpage: ino 84, pg 242, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 242)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 29:51496, key (84, data, 242)
UBIFS DBG (pid 649): try_read_node: LEB 29:51496, data node, length 2505
UBIFS DBG (pid 649): do_readpage: ino 84, pg 254, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 254)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:29376, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:29376, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 29:75504, key (84, data, 254)
UBIFS DBG (pid 649): try_read_node: LEB 29:75504, data node, length 1627
UBIFS DBG (pid 649): do_readpage: ino 84, pg 91, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 91)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 26:69472, key (84, data, 91)
UBIFS DBG (pid 649): try_read_node: LEB 26:69472, data node, length 1853
UBIFS DBG (pid 682): do_readpage: ino 84, pg 92, i_size 3258056, flags 0x1
UBIFS DBG (pid 682): ubifs_lookup_level0: search key (84, data, 92)
UBIFS DBG (pid 682): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 682): fallible_read_node: LEB 26:71328, key (84, data, 92)
UBIFS DBG (pid 682): try_read_node: LEB 26:71328, data node, length 2103
UBIFS DBG (pid 649): do_readpage: ino 84, pg 113, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 113)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:25920, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:25920, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 26:119520, key (84, data, 113)
UBIFS DBG (pid 649): try_read_node: LEB 26:119520, data node, length 2227
UBIFS DBG (pid 649): do_readpage: ino 84, pg 251, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 251)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 29:69424, key (84, data, 251)
UBIFS DBG (pid 649): try_read_node: LEB 29:69424, data node, length 1989
UBIFS DBG (pid 649): do_readpage: ino 84, pg 118, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 118)
UBIFS DBG (pid 649): ubifs_read_node: LEB 110:28008, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 110:28008, level 1, 8 branch
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:26112, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:26112, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 27:4512, key (84, data, 118)
UBIFS DBG (pid 649): try_read_node: LEB 27:4512, data node, length 1787
UBIFS DBG (pid 649): do_readpage: ino 163, pg 47, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 47)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:125184, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:125184, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 91:115144, key (163, data, 47)
UBIFS DBG (pid 649): try_read_node: LEB 91:115144, data node, length 1610
UBIFS DBG (pid 649): do_readpage: ino 163, pg 46, i_size 515924, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 46)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 91:113352, key (163, data, 46)
UBIFS DBG (pid 649): try_read_node: LEB 91:113352, data node, length 1786
UBIFS DBG (pid 649): do_readpage: ino 163, pg 70, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 70)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:125760, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:125760, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 92:21920, key (163, data, 70)
UBIFS DBG (pid 649): try_read_node: LEB 92:21920, data node, length 1552
DRV_Mem_Init heapinit 0 [0][1048576][sys]
DRV_Mem_Init heapinit 1 [0][1048576][browser]
DRV_Flash_Init entry====================1
UBIFS DBG (pid 649): do_readpage: ino 163, pg 87, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 87)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 92:47112, key (163, data, 87)
UBIFS DBG (pid 649): try_read_node: LEB 92:47112, data node, length 1220
UBIFS DBG (pid 649): do_readpage: ino 163, pg 83, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 83)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 92:40552, key (163, data, 83)
UBIFS DBG (pid 649): try_read_node: LEB 92:40552, data node, length 1743
UBIFS DBG (pid 649): do_readpage: ino 70, pg 4, i_size 97860, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (70, data, 4)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 12:123096, key (70, data, 4)
UBIFS DBG (pid 649): try_read_node: LEB 12:123096, data node, length 1194
UBIFS DBG (pid 649): do_readpage: ino 70, pg 14, i_size 97860, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (70, data, 14)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 13:11664, key (70, data, 14)
UBIFS DBG (pid 649): try_read_node: LEB 13:11664, data node, length 1484
UBIFS DBG (pid 649): do_readpage: ino 163, pg 110, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 110)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 92:92808, key (163, data, 110)
UBIFS DBG (pid 649): try_read_node: LEB 92:92808, data node, length 1963
UBIFS DBG (pid 649): do_readpage: ino 163, pg 112, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 112)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 92:96296, key (163, data, 112)
UBIFS DBG (pid 649): try_read_node: LEB 92:96296, data node, length 2296
[flash_init] mtd_write_size = 0x800

UBIFS DBG (pid 649): do_readpage: ino 163, pg 84, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 84)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 92:42296, key (163, data, 84)
UBIFS DBG (pid 649): try_read_node: LEB 92:42296, data node, length 1679
UBIFS DBG (pid 649): do_readpage: ino 163, pg 82, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 82)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 92:39024, key (163, data, 82)
UBIFS DBG (pid 649): try_read_node: LEB 92:39024, data node, length 1521
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=14680064, seek offset=14680064
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=7340032, seek offset=7340032
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=524288, seek offset=524288
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=524288, seek offset=524288
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=59899904, seek offset=59899904
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=7340032, seek offset=7340032
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=2097152, seek offset=2097152
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=1048576, seek offset=1048576
!
UBIFS DBG (pid 649): do_readpage: ino 163, pg 88, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 88)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 92:48336, key (163, data, 88)
UBIFS DBG (pid 649): try_read_node: LEB 92:48336, data node, length 1260
UBIFS DBG (pid 649): do_readpage: ino 163, pg 17, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 17)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 91:72320, key (163, data, 17)
UBIFS DBG (pid 649): try_read_node: LEB 91:72320, data node, length 1392
UBIFS DBG (pid 649): do_readpage: ino 70, pg 11, i_size 97860, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (70, data, 11)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 13:7944, key (70, data, 11)
UBIFS DBG (pid 649): try_read_node: LEB 13:7944, data node, length 1733
UBIFS DBG (pid 649): do_readpage: ino 163, pg 103, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 103)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 92:78408, key (163, data, 103)
UBIFS DBG (pid 649): try_read_node: LEB 92:78408, data node, length 1979
UBIFS DBG (pid 649): do_readpage: ino 78, pg 38, i_size 1441440, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 38)
UBIFS DBG (pid 649): ubifs_read_node: LEB 110:26280, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 110:26280, level 1, 8 branch
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:12288, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:12288, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 17:110904, key (78, data, 38)
UBIFS DBG (pid 649): try_read_node: LEB 17:110904, data node, length 2169
UBIFS DBG (pid 649): do_readpage: ino 78, pg 171, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 171)
UBIFS DBG (pid 649): ubifs_read_node: LEB 110:26664, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 110:26664, level 1, 8 branch
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:15552, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:15552, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 20:42328, key (78, data, 171)
UBIFS DBG (pid 649): try_read_node: LEB 20:42328, data node, length 1541
UBIFS DBG (pid 649): do_readpage: ino 78, pg 30, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 30)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 17:92600, key (78, data, 30)
UBIFS DBG (pid 649): try_read_node: LEB 17:92600, data node, length 2554
read_node: LEB 18:116664, data node, length 2024
UBIFS DBG (pid 649): do_readpage: ino 78, pg 51, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 51)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:12672, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:12672, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 18:15760, key (78, data, 51)
UBIFS DBG (pid 649): try_read_node: LEB 18:15760, data node, length 2672
UBIFS DBG (pid 649): do_readpage: ino 78, pg 56, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 56)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:12864, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:12864, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 18:29000, key (78, data, 56)
UBIFS DBG (pid 649): try_read_node: LEB 18:29000, data node, length 2528
UBIFS DBG (pid 649): do_readpage: ino 78, pg 54, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 54)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 18:23592, key (78, data, 54)
UBIFS DBG (pid 649): try_read_node: LEB 18:23592, data node, length 2801
UBIFS DBG (pid 649): do_readpage: ino 78, pg 44, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 44)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 18:0, key (78, data, 44)
UBIFS DBG (pid 649): try_read_node: LEB 18:0, data node, length 2566
UBIFS DBG (pid 649): do_readpage: ino 78, pg 41, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 41)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 17:117640, key (78, data, 41)
UBIFS DBG (pid 649): try_read_node: LEB 17:117640, data node, length 2705
UBIFS DBG (pid 649): do_readpage: ino 78, pg 55, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 55)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 18:26400, key (78, data, 55)
UBIFS DBG (pid 649): try_read_node: LEB 18:26400, data node, length 2596
UBIFS DBG (pid 649): do_readpage: ino 78, pg 269, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 269)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 22:19224, key (78, data, 269)
UBIFS DBG (pid 649): try_read_node: LEB 22:19224, data node, length 2278
UBIFS DBG (pid 649): do_readpage: ino 78, pg 270, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 270)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 22:21504, key (78, data, 270)
UBIFS DBG (pid 649): try_read_node: LEB 22:21504, data node, length 2580
UBIFS DBG (pid 649): do_readpage: ino 78, pg 75, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 75)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:13248, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:13248, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 18:73208, key (78, data, 75)
UBIFS DBG (pid 649): try_read_node: LEB 18:73208, data node, length 2301
UBIFS DBG (pid 649): do_readpage: ino 78, pg 76, i_size 1441440, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 76)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 18:75512, key (78, data, 76)
UBIFS DBG (pid 649): try_read_node: LEB 18:75512, data node, length 2213
UBIFS DBG (pid 649): do_readpage: ino 78, pg 74, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 74)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 18:71104, key (78, data, 74)
UBIFS DBG (pid 649): try_read_node: LEB 18:71104, data node, length 2104
UBIFS DBG (pid 649): do_readpage: ino 78, pg 40, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 40)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 17:115184, key (78, data, 40)
UBIFS DBG (pid 649): try_read_node: LEB 17:115184, data node, length 2449
UBIFS DBG (pid 649): do_readpage: ino 78, pg 98, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 98)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:13824, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:13824, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 19:0, key (78, data, 98)
UBIFS DBG (pid 649): try_read_node: LEB 19:0, data node, length 2326
UBIFS DBG (pid 649): do_readpage: ino 78, pg 66, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 66)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 18:53560, key (78, data, 66)
UBIFS DBG (pid 649): try_read_node: LEB 18:53560, data node, length 2075
UBIFS DBG (pid 649): do_readpage: ino 78, pg 46, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 46)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 18:4880, key (78, data, 46)
UBIFS DBG (pid 649): try_read_node: LEB 18:4880, data node, length 2212
UBIFS DBG (pid 649): do_readpage: ino 78, pg 176, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 176)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:15744, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:15744, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 20:53112, key (78, data, 176)
UBIFS DBG (pid 649): try_read_node: LEB 20:53112, data node, length 2333
UBIFS DBG (pid 649): do_readpage: ino 78, pg 42, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 42)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 17:120352, key (78, data, 42)
UBIFS DBG (pid 649): try_read_node: LEB 17:120352, data node, length 2475
UBIFS DBG (pid 649): do_readpage: ino 78, pg 53, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 53)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 18:20928, key (78, data, 53)
UBIFS DBG (pid 649): try_read_node: LEB 18:20928, data node, length 2661
UBIFS DBG (pid 649): do_readpage: ino 78, pg 71, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 71)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 18:64488, key (78, data, 71)
UBIFS DBG (pid 649): try_read_node: LEB 18:64488, data node, length 2220
UBIFS DBG (pid 649): do_readpage: ino 78, pg 97, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 97)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 18:122976, key (78, data, 97)
UBIFS DBG (pid 649): try_read_node: LEB 18:122976, data node, length 2438
UBIFS DBG (pid 649): do_readpage: ino 78, pg 70, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 70)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 18:62160, key (78, data, 70)
UBIFS DBG (pid 649): try_read_node: LEB 18:62160, data node, length 2321
UBIFS DBG (pid 649): do_readpage: ino 1018, pg 1, i_size 9800, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (1018, data, 1)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 119:17448, key (1018, data, 1)
UBIFS DBG (pid 649): try_read_node: LEB 119:17448, data node, length 1241
UBIFS DBG (pid 649): do_readpage: ino 1018, pg 2, i_size 9800, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (1018, data, 2)
UBIFS DBG (pid 649): ubifs_read_node: LEB 362:59712, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 362:59712, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 119:18696, key (1018, data, 2)
UBIFS DBG (pid 649): try_read_node: LEB 119:18696, data node, length 829
UBIFS DBG (pid 649): do_readpage: ino 78, pg 296, i_size 1441440, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 296)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 22:76984, key (78, data, 296)
UBIFS DBG (pid 649): try_read_node: LEB 22:76984, data node, length 1806
UBIFS DBG (pid 649): do_readpage: ino 78, pg 137, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 137)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:14784, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:14784, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 19:89952, key (78, data, 137)
UBIFS DBG (pid 649): try_read_node: LEB 19:89952, data node, length 2111
UBIFS DBG (pid 649): do_readpage: ino 78, pg 83, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 83)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 18:91744, key (78, data, 83)
UBIFS DBG (pid 649): try_read_node: LEB 18:91744, data node, length 2013
UBIFS DBG (pid 649): do_readpage: ino 78, pg 136, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 136)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 19:88024, key (78, data, 136)
UBIFS DBG (pid 649): try_read_node: LEB 19:88024, data node, length 1924
UBIFS DBG (pid 649): do_readpage: ino 78, pg 82, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 82)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 18:89480, key (78, data, 82)
UBIFS DBG (pid 649): try_read_node: LEB 18:89480, data node, length 2263
UBIFS DBG (pid 649): do_readpage: ino 78, pg 81, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 81)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 18:86864, key (78, data, 81)
UBIFS DBG (pid 649): try_read_node: LEB 18:86864, data node, length 2612
UBIFS DBG (pid 649): do_readpage: ino 78, pg 306, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 306)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 22:95360, key (78, data, 306)
UBIFS DBG (pid 649): try_read_node: LEB 22:95360, data node, length 2172
UBIFS DBG (pid 649): do_readpage: ino 78, pg 324, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 324)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 23:6088, key (78, data, 324)
UBIFS DBG (pid 649): try_read_node: LEB 23:6088, data node, length 1578
UBIFS DBG (pid 649): do_readpage: ino 78, pg 305, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 305)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 22:93368, key (78, data, 305)
UBIFS DBG (pid 649): try_read_node: LEB 22:93368, data node, length 1987
UBIFS DBG (pid 649): do_readpage: ino 78, pg 300, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 300)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 22:84312, key (78, data, 300)
UBIFS DBG (pid 649): try_read_node: LEB 22:84312, data node, length 1843
UBIFS DBG (pid 649): do_readpage: ino 78, pg 298, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 298)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 22:80912, key (78, data, 298)
UBIFS DBG (pid 649): try_read_node: LEB 22:80912, data node, length 1502
UBIFS DBG (pid 649): do_readpage: ino 78, pg 303, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 303)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 22:89056, key (78, data, 303)
UBIFS DBG (pid 649): try_read_node: LEB 22:89056, data node, length 2146
UBIFS DBG (pid 649): do_readpage: ino 78, pg 169, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 169)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 20:38024, key (78, data, 169)
UBIFS DBG (pid 649): try_read_node: LEB 20:38024, data node, length 2081
UBIFS DBG (pid 649): do_readpage: ino 78, pg 166, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 166)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 20:30920, key (78, data, 166)
UBIFS DBG (pid 649): try_read_node: LEB 20:30920, data node, length 2399
UBIFS DBG (pid 649): do_readpage: ino 78, pg 165, i_size 1441440, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 165)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 20:28472, key (78, data, 165)
UBIFS DBG (pid 649): try_read_node: LEB 20:28472, data node, length 2448
UBIFS DBG (pid 649): do_readpage: ino 78, pg 168, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 168)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 20:35576, key (78, data, 168)
UBIFS DBG (pid 649): try_read_node: LEB 20:35576, data node, length 2448
UBIFS DBG (pid 649): do_readpage: ino 78, pg 170, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 170)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 20:40112, key (78, data, 170)
UBIFS DBG (pid 649): try_read_node: LEB 20:40112, data node, length 2212
UBIFS DBG (pid 649): do_readpage: ino 78, pg 31, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 31)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 17:95160, key (78, data, 31)
UBIFS DBG (pid 649): try_read_node: LEB 17:95160, data node, length 1924
br0: topology change detected, propagating
br0: port 1(eth0) entering forwarding state
br0: topology change detected, propagating
br0: port 2(bcm1) entering forwarding state
I/O warning : UBIFS DBG (pid 649): do_readpage: ino 78, pg 304, i_size
1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 304)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 22:91208, key (78, data, 304)
UBIFS DBG (pid 649): try_read_node: LEB 22:91208, data node, length 2155
failed to load external entity
"/usr/local/hmt/appdata/configd/swcfg_runtime.xml"
[649]:ERR:000000025:[pstore_open] load xml file
/usr/local/hmt/appdata/configd/swcfg_runtime.xml failed, copy it from
/usr/local/hmt/app/config/syscfg/swcfg_default.xml
UBIFS DBG (pid 649): do_readpage: ino 163, pg 11, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 11)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 91:64872, key (163, data, 11)
UBIFS DBG (pid 649): try_read_node: LEB 91:64872, data node, length 1436
UBIFS DBG (pid 649): do_readpage: ino 71, pg 2, i_size 19184, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (71, data, 2)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 13:29328, key (71, data, 2)
UBIFS DBG (pid 649): try_read_node: LEB 13:29328, data node, length 950
UBIFS DBG (pid 649): do_readpage: ino 78, pg 147, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 147)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:14976, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:14976, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 19:112024, key (78, data, 147)
UBIFS DBG (pid 649): try_read_node: LEB 19:112024, data node, length 2169
UBIFS DBG (pid 649): do_readpage: ino 78, pg 128, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 128)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:14592, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:14592, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 19:69024, key (78, data, 128)
UBIFS DBG (pid 649): try_read_node: LEB 19:69024, data node, length 2351
UBIFS DBG (pid 649): do_readpage: ino 78, pg 126, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 126)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 19:65016, key (78, data, 126)
UBIFS DBG (pid 649): try_read_node: LEB 19:65016, data node, length 2343
UBIFS DBG (pid 649): do_readpage: ino 78, pg 146, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 146)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 19:109584, key (78, data, 146)
UBIFS DBG (pid 649): try_read_node: LEB 19:109584, data node, length 2440
UBIFS DBG (pid 649): do_readpage: ino 78, pg 284, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 284)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:18240, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:18240, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 22:49784, key (78, data, 284)
UBIFS DBG (pid 649): try_read_node: LEB 22:49784, data node, length 2131
UBIFS DBG (pid 649): do_readpage: ino 78, pg 282, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 282)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 22:45328, key (78, data, 282)
UBIFS DBG (pid 649): try_read_node: LEB 22:45328, data node, length 2346
UBIFS DBG (pid 649): do_readpage: ino 78, pg 285, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 285)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 22:51920, key (78, data, 285)
UBIFS DBG (pid 649): try_read_node: LEB 22:51920, data node, length 2523
UBIFS DBG (pid 649): do_readpage: ino 78, pg 281, i_size 1441440, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 281)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 22:43608, key (78, data, 281)
UBIFS DBG (pid 649): try_read_node: LEB 22:43608, data node, length 1715
UBIFS DBG (pid 649): do_readpage: ino 78, pg 283, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 283)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 22:47680, key (78, data, 283)
UBIFS DBG (pid 649): try_read_node: LEB 22:47680, data node, length 2104
UBIFS DBG (pid 649): do_readpage: ino 78, pg 325, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 325)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 23:7672, key (78, data, 325)
UBIFS DBG (pid 649): try_read_node: LEB 23:7672, data node, length 2540
UBIFS DBG (pid 649): do_readpage: ino 78, pg 138, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 138)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 19:92064, key (78, data, 138)
UBIFS DBG (pid 649): try_read_node: LEB 19:92064, data node, length 2223
UBIFS DBG (pid 649): do_readpage: ino 78, pg 130, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 130)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 19:73568, key (78, data, 130)
UBIFS DBG (pid 649): try_read_node: LEB 19:73568, data node, length 2641
UBIFS DBG (pid 649): do_readpage: ino 78, pg 127, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 127)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 19:67360, key (78, data, 127)
UBIFS DBG (pid 649): try_read_node: LEB 19:67360, data node, length 1663
UBIFS DBG (pid 649): do_readpage: ino 78, pg 125, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 125)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 19:62488, key (78, data, 125)
UBIFS DBG (pid 649): try_read_node: LEB 19:62488, data node, length 2528
UBIFS DBG (pid 649): do_readpage: ino 78, pg 73, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 73)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 18:69000, key (78, data, 73)
UBIFS DBG (pid 649): try_read_node: LEB 18:69000, data node, length 2097
UBIFS DBG (pid 649): do_readpage: ino 78, pg 133, i_size 1441440, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (78, data, 133)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 19:81256, key (78, data, 133)
UBIFS DBG (pid 649): try_read_node: LEB 19:81256, data node, length 2061
UBIFS DBG (pid 649): do_readpage: ino 163, pg 13, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 13)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 91:67624, key (163, data, 13)
UBIFS DBG (pid 649): try_read_node: LEB 91:67624, data node, length 1210
UBIFS DBG (pid 649): do_readpage: ino 163, pg 14, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 14)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 91:68840, key (163, data, 14)
UBIFS DBG (pid 649): try_read_node: LEB 91:68840, data node, length 1301
UBIFS DBG (pid 649): do_readpage: ino 163, pg 26, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 26)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:124800, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:124800, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 91:85648, key (163, data, 26)
UBIFS DBG (pid 649): try_read_node: LEB 91:85648, data node, length 1344
UBIFS DBG (pid 649): do_readpage: ino 163, pg 24, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 24)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 91:83056, key (163, data, 24)
UBIFS DBG (pid 649): try_read_node: LEB 91:83056, data node, length 1352
UBIFS DBG (pid 649): do_readpage: ino 163, pg 81, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 81)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 92:37848, key (163, data, 81)
UBIFS DBG (pid 649): try_read_node: LEB 92:37848, data node, length 1172
UBIFS DBG (pid 649): do_readpage: ino 163, pg 115, i_size 515924, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 115)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 92:100880, key (163, data, 115)
UBIFS DBG (pid 649): try_read_node: LEB 92:100880, data node, length 728
UBIFS DBG (pid 649): do_readpage: ino 163, pg 25, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 25)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 91:84408, key (163, data, 25)
UBIFS DBG (pid 649): try_read_node: LEB 91:84408, data node, length 1236
UBIFS DBG (pid 649): do_readpage: ino 163, pg 104, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 104)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 92:80392, key (163, data, 104)
UBIFS DBG (pid 649): try_read_node: LEB 92:80392, data node, length 2031
====FACTORY_PARAID_END:68
UBIFS DBG (pid 649): do_readpage: ino 163, pg 105, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 105)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 92:82424, key (163, data, 105)
UBIFS DBG (pid 649): try_read_node: LEB 92:82424, data node, length 1975
[649]:ERR:000000025:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(0)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(1)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(2)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(4)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(5)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(6)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(7)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(50)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(51)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(52)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(53)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(54)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(55)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(56)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(57)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(58)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(59)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(60)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(61)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(62)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(63)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(64)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(65)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(66)  status(0)is invalid or space not enough!
[649]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(67)  status(0)is invalid or space not enough!
UBIFS DBG (pid 649): do_readpage: ino 163, pg 38, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 38)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 91:101912, key (163, data, 38)
UBIFS DBG (pid 649): try_read_node: LEB 91:101912, data node, length 1614
UBIFS DBG (pid 649): do_readpage: ino 70, pg 10, i_size 97860, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (70, data, 10)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 13:6536, key (70, data, 10)
UBIFS DBG (pid 649): try_read_node: LEB 13:6536, data node, length 1405
UBIFS DBG (pid 649): do_readpage: ino 70, pg 12, i_size 97860, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (70, data, 12)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 13:9680, key (70, data, 12)
UBIFS DBG (pid 649): try_read_node: LEB 13:9680, data node, length 998
UBIFS DBG (pid 690): do_readpage: ino 163, pg 16, i_size 515924, flags 0x1
UBIFS DBG (pid 690): ubifs_lookup_level0: search key (163, data, 16)
UBIFS DBG (pid 690): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 690): fallible_read_node: LEB 91:71232, key (163, data, 16)
UBIFS DBG (pid 690): try_read_node: LEB 91:71232, data node, length 1086
UBIFS DBG (pid 649): do_readpage: ino 163, pg 15, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 15)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 91:70144, key (163, data, 15)
UBIFS DBG (pid 649): try_read_node: LEB 91:70144, data node, length 1082
UBIFS DBG (pid 649): do_readpage: ino 163, pg 42, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 42)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 91:107672, key (163, data, 42)
UBIFS DBG (pid 649): try_read_node: LEB 91:107672, data node, length 1243
UBIFS DBG (pid 649): do_readpage: ino 163, pg 63, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 63)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:125568, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:125568, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 92:12144, key (163, data, 63)
UBIFS DBG (pid 649): try_read_node: LEB 92:12144, data node, length 1386
UBIFS DBG (pid 649): do_readpage: ino 163, pg 45, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 45)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 91:111520, key (163, data, 45)
UBIFS DBG (pid 649): try_read_node: LEB 91:111520, data node, length 1831
UBIFS DBG (pid 649): do_readpage: ino 163, pg 52, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 52)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 91:123080, key (163, data, 52)
UBIFS DBG (pid 649): try_read_node: LEB 91:123080, data node, length 1478
UBIFS DBG (pid 649): do_readpage: ino 163, pg 67, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 67)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 92:17736, key (163, data, 67)
UBIFS DBG (pid 649): try_read_node: LEB 92:17736, data node, length 1331
UBIFS DBG (pid 649): do_readpage: ino 163, pg 68, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 68)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 92:19072, key (163, data, 68)
UBIFS DBG (pid 649): try_read_node: LEB 92:19072, data node, length 1419
UBIFS DBG (pid 649): do_readpage: ino 163, pg 71, i_size 515924, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 71)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 92:23472, key (163, data, 71)
UBIFS DBG (pid 649): try_read_node: LEB 92:23472, data node, length 1553
UBIFS DBG (pid 649): do_readpage: ino 163, pg 77, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 77)
UBIFS DBG (pid 649): ubifs_read_node: LEB 109:125952, indexing node,
length 188
UBIFS DBG (pid 649): read_znode: LEB 109:125952, level 0, 8 branch
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 92:32712, key (163, data, 77)
UBIFS DBG (pid 649): try_read_node: LEB 92:32712, data node, length 1572
[HAL1_0_Init_Step2] configured vout mode: 720P50
UBIFS DBG (pid 649): do_readpage: ino 84, pg 37, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 37)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 26:5112, key (84, data, 37)
UBIFS DBG (pid 649): try_read_node: LEB 26:5112, data node, length 816
UBIFS DBG (pid 649): do_readpage: ino 84, pg 76, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 76)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 26:45632, key (84, data, 76)
UBIFS DBG (pid 649): try_read_node: LEB 26:45632, data node, length 788
UBIFS DBG (pid 649): do_readpage: ino 84, pg 72, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 72)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 26:42472, key (84, data, 72)
UBIFS DBG (pid 649): try_read_node: LEB 26:42472, data node, length 793
UBIFS DBG (pid 649): do_readpage: ino 84, pg 60, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 60)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 26:31816, key (84, data, 60)
UBIFS DBG (pid 649): try_read_node: LEB 26:31816, data node, length 782
UBIFS DBG (pid 649): do_readpage: ino 87, pg 2, i_size 28872, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (87, data, 2)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 38:84880, key (87, data, 2)
UBIFS DBG (pid 649): try_read_node: LEB 38:84880, data node, length 1952
UBIFS DBG (pid 649): do_readpage: ino 84, pg 65, i_size 3258056, flags 0x1
UBIFS DBG (pid 693): do_readpage: ino 163, pg 75, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 65)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 693): ubifs_lookup_level0: search key (163, data, 75)
UBIFS DBG (pid 649): fallible_read_node: LEB 26:35960, key (84, data, 65)
UBIFS DBG (pid 693): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): try_read_node: LEB 26:35960, data node, length 771
UBIFS DBG (pid 693): fallible_read_node: LEB 92:29568, key (163, data, 75)
UBIFS DBG (pid 693): try_read_node: LEB 92:29568, data node, length 1455
UBIFS DBG (pid 649): do_readpage: ino 84, pg 66, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 66)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 26:36736, key (84, data, 66)
UBIFS DBG (pid 649): try_read_node: LEB 26:36736, data node, length 781
UBIFS DBG (pid 649): do_readpage: ino 84, pg 67, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 67)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 26:37520, key (84, data, 67)
UBIFS DBG (pid 649): try_read_node: LEB 26:37520, data node, length 763
UBIFS DBG (pid 649): do_readpage: ino 84, pg 63, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 63)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 26:34432, key (84, data, 63)
UBIFS DBG (pid 649): try_read_node: LEB 26:34432, data node, length 767
UBIFS DBG (pid 649): do_readpage: ino 84, pg 79, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 79)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 26:48264, key (84, data, 79)
UBIFS DBG (pid 649): try_read_node: LEB 26:48264, data node, length 773
UBIFS DBG (pid 649): do_readpage: ino 163, pg 78, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 78)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 92:34288, key (163, data, 78)
UBIFS DBG (pid 649): try_read_node: LEB 92:34288, data node, length 1157
UBIFS DBG (pid 649): do_readpage: ino 163, pg 76, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 76)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 92:31024, key (163, data, 76)
UBIFS DBG (pid 649): try_read_node: LEB 92:31024, data node, length 1688
UBIFS DBG (pid 649): do_readpage: ino 84, pg 77, i_size 3258056, flags 0x21
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 77)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 26:46424, key (84, data, 77)
UBIFS DBG (pid 649): try_read_node: LEB 26:46424, data node, length 806
UBIFS DBG (pid 649): do_readpage: ino 163, pg 109, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 109)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 92:90600, key (163, data, 109)
UBIFS DBG (pid 649): try_read_node: LEB 92:90600, data node, length 2207
Check Tuner Type: DRV_TunerBCM7125
Check Tuner Type: DRV_TunerBCM7125
UBIFS DBG (pid 649): do_readpage: ino 163, pg 94, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 94)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 92:56576, key (163, data, 94)
UBIFS DBG (pid 649): try_read_node: LEB 92:56576, data node, length 1361
UBIFS DBG (pid 649): do_readpage: ino 84, pg 51, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 51)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 26:23304, key (84, data, 51)
UBIFS DBG (pid 649): try_read_node: LEB 26:23304, data node, length 770
UBIFS DBG (pid 649): do_readpage: ino 84, pg 58, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 58)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 26:29624, key (84, data, 58)
UBIFS DBG (pid 649): try_read_node: LEB 26:29624, data node, length 946
UBIFS DBG (pid 649): do_readpage: ino 84, pg 57, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 57)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 26:28848, key (84, data, 57)
UBIFS DBG (pid 649): try_read_node: LEB 26:28848, data node, length 774
UBIFS DBG (pid 649): do_readpage: ino 163, pg 108, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 108)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 92:88440, key (163, data, 108)
UBIFS DBG (pid 649): try_read_node: LEB 92:88440, data node, length 2156
SYS_MsgQCreate id=1 pmsg=0x2427208
SYS_MsgQCreate id=2 pmsg=0x24276c8
SYS_TaskCreate StackSize =30720
tuner process ready
UBIFS DBG (pid 649): do_readpage: ino 163, pg 50, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 50)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 91:120128, key (163, data, 50)
UBIFS DBG (pid 649): try_read_node: LEB 91:120128, data node, length 1312
TASK CREATE NAME   ==    <TUNER>
UBIFS DBG (pid 649): do_readpage: ino 70, pg 18, i_size 97860, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (70, data, 18)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 13:16576, key (70, data, 18)
UBIFS DBG (pid 649): try_read_node: LEB 13:16576, data node, length 1509
UBIFS DBG (pid 697): do_readpage: ino 70, pg 17, i_size 97860, flags 0x1
UBIFS DBG (pid 697): ubifs_lookup_level0: search key (70, data, 17)
UBIFS DBG (pid 697): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 697): fallible_read_node: LEB 13:15360, key (70, data, 17)
UBIFS DBG (pid 697): try_read_node: LEB 13:15360, data node, length 1209
UBIFS DBG (pid 697): do_readpage: ino 70, pg 13, i_size 97860, flags 0x1
UBIFS DBG (pid 697): ubifs_lookup_level0: search key (70, data, 13)
UBIFS DBG (pid 697): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 697): fallible_read_node: LEB 13:10680, key (70, data, 13)
UBIFS DBG (pid 697): try_read_node: LEB 13:10680, data node, length 978
ir enter mtc mode@@@@@@@@@@@@@@

UBIFS DBG (pid 649): do_readpage: ino 163, pg 35, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 35)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 91:97424, key (163, data, 35)
UBIFS DBG (pid 649): try_read_node: LEB 91:97424, data node, length 1523
UBIFS DBG (pid 649): do_readpage: ino 163, pg 92, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 92)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 92:53776, key (163, data, 92)
UBIFS DBG (pid 649): try_read_node: LEB 92:53776, data node, length 1545
createSettings.width[720] createSettings.height[576]
createSettings.width[720] createSettings.height[576]
UBIFS DBG (pid 649): do_readpage: ino 103, pg 3, i_size 41876, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (103, data, 3)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 83:45864, key (103, data, 3)
UBIFS DBG (pid 649): try_read_node: LEB 83:45864, data node, length 1250
UBIFS DBG (pid 649): do_readpage: ino 103, pg 5, i_size 41876, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (103, data, 5)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): fallible_read_node: LEB 83:48616, key (103, data, 5)
UBIFS DBG (pid 649): try_read_node: LEB 83:48616, data node, length 1169
UBIFS DBG (pid 649): do_readpage: ino 103, pg 7, i_size 41876, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (103, data, 7)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 83:51248, key (103, data, 7)
UBIFS DBG (pid 649): try_read_node: LEB 83:51248, data node, length 1470
UBIFS DBG (pid 649): do_readpage: ino 103, pg 6, i_size 41876, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (103, data, 6)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 83:49792, key (103, data, 6)
UBIFS DBG (pid 649): try_read_node: LEB 83:49792, data node, length 1456
UBIFS DBG (pid 649): do_readpage: ino 103, pg 4, i_size 41876, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (103, data, 4)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 83:47120, key (103, data, 4)
UBIFS DBG (pid 649): try_read_node: LEB 83:47120, data node, length 1491
UBIFS DBG (pid 649): do_readpage: ino 163, pg 62, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 62)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 649): fallible_read_node: LEB 92:10552, key (163, data, 62)
UBIFS DBG (pid 649): try_read_node: LEB 92:10552, data node, length 1588
SYS_MsgQCreate id=3 pmsg=0x2427cf8
UBIFS DBG (pid 649): do_readpage: ino 163, pg 59, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 59)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 649): fallible_read_node: LEB 92:7304, key (163, data, 59)
UBIFS DBG (pid 649): try_read_node: LEB 92:7304, data node, length 1682
UBIFS DBG (pid 649): do_readpage: ino 163, pg 64, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 64)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 92:13536, key (163, data, 64)
UBIFS DBG (pid 649): try_read_node: LEB 92:13536, data node, length 1421
UBIFS DBG (pid 649): do_readpage: ino 163, pg 58, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 58)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 92:5600, key (163, data, 58)
UBIFS DBG (pid 649): try_read_node: LEB 92:5600, data node, length 1697
SYS_TaskCreate StackSize =8192
TASK CREATE NAME   ==    <LedScanKeyTask>
SYS_MsgQCreate id=4 pmsg=0x242aa48

DRV_PanelKeyListInit1543: KeyListInitPortFun=0x43ba3c
DRV_PanelKeyListInit1544:
KeyListInitPortFun=0x43ba3c,KeyTable=0x482c2c,DrvFpKeySize=0x7SYS_TaskCreate
StackSize =1024
TASK CREATE NAME   ==    <DispanelProcess>
UBIFS DBG (pid 703): do_readpage: ino 163, pg 60, i_size 515924, flags 0x1
UBIFS DBG (pid 649): do_readpage: ino 163, pg 32, i_size 515924, flags 0x1
UBIFS DBG (pid 703): ubifs_lookup_level0: search key (163, data, 60)
UBIFS DBG (pid 703): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 32)
UBIFS DBG (pid 703): fallible_read_node: LEB 92:8992, key (163, data, 60)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 703): try_read_node: LEB 92:8992, data node, length 862
UBIFS DBG (pid 649): fallible_read_node: LEB 91:93472, key (163, data, 32)
UBIFS DBG (pid 649): try_read_node: LEB 91:93472, data node, length 1318
UBIFS DBG (pid 703): do_readpage: ino 163, pg 61, i_size 515924, flags 0x1
UBIFS DBG (pid 703): ubifs_lookup_level0: search key (163, data, 61)
UBIFS DBG (pid 703): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 703): fallible_read_node: LEB 92:9856, key (163, data, 61)
UBIFS DBG (pid 703): try_read_node: LEB 92:9856, data node, length 689
UBIFS DBG (pid 649): do_readpage: ino 163, pg 21, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 21)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 91:78528, key (163, data, 21)
UBIFS DBG (pid 649): try_read_node: LEB 91:78528, data node, length 1456
UBIFS DBG (pid 705): do_readpage: ino 163, pg 20, i_size 515924, flags 0x21
UBIFS DBG (pid 705): ubifs_lookup_level0: search key (163, data, 20)
UBIFS DBG (pid 705): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 705): fallible_read_node: LEB 91:76912, key (163, data, 20)
UBIFS DBG (pid 705): try_read_node: LEB 91:76912, data node, length 1610
UBIFS DBG (pid 649): do_readpage: ino 163, pg 40, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 40)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 649): fallible_read_node: LEB 91:104504, key (163, data, 40)
UBIFS DBG (pid 649): try_read_node: LEB 91:104504, data node, length 1655
process_tuner_msg ready
 UBIFS DBG (pid 649): do_readpage: ino 163, pg 29, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 29)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 649): fallible_read_node: LEB 91:89240, key (163, data, 29)
UBIFS DBG (pid 649): try_read_node: LEB 91:89240, data node, length 1705
UBIFS DBG (pid 649): do_readpage: ino 163, pg 18, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 18)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 91:73712, key (163, data, 18)
UBIFS DBG (pid 649): try_read_node: LEB 91:73712, data node, length 1398
_XML_GetNodeSet No result: Config.DigitalAudio.Spdif.OnOff
No element is found
UBIFS DBG (pid 707): do_readpage: ino 163, pg 28, i_size 515924, flags 0x1
UBIFS DBG (pid 707): ubifs_lookup_level0: search key (163, data, 28)
UBIFS DBG (pid 707): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 707): fallible_read_node: LEB 91:87664, key (163, data, 28)
UBIFS DBG (pid 707): try_read_node: LEB 91:87664, data node, length 1576
UBIFS DBG (pid 649): do_readpage: ino 163, pg 41, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 41)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 91:106160, key (163, data, 41)
UBIFS DBG (pid 649): try_read_node: LEB 91:106160, data node, length 1506
UBIFS DBG (pid 649): do_readpage: ino 84, pg 75, i_size 3258056, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (84, data, 75)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 26:44840, key (84, data, 75)
UBIFS DBG (pid 649): try_read_node: LEB 26:44840, data node, length 790
UBIFS DBG (pid 649): do_readpage: ino 163, pg 79, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 79)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 92:35448, key (163, data, 79)
UBIFS DBG (pid 649): try_read_node: LEB 92:35448, data node, length 1176
_XML_GetNodeSet No result: Config.Video.Conversion
No element is found
UBIFS DBG (pid 649): do_readpage: ino 163, pg 74, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 74)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 92:27824, key (163, data, 74)
UBIFS DBG (pid 649): try_read_node: LEB 92:27824, data node, length 1743
_XML_GetNodeSet No result: Config.Video.Ratio
No element is found
[set_vout_param] unknown configured screen ration: , use default value 4:3
UBIFS DBG (pid 649): do_readpage: ino 163, pg 39, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 39)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 649): fallible_read_node: LEB 91:103528, key (163, data, 39)
UBIFS DBG (pid 649): try_read_node: LEB 91:103528, data node, length 971
UBIFS DBG (pid 649): do_readpage: ino 163, pg 65, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 65)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 649): fallible_read_node: LEB 92:14960, key (163, data, 65)
UBIFS DBG (pid 649): try_read_node: LEB 92:14960, data node, length 1312
*** 00:00:00.699 nexus_smartcard: Open smart card slot:0
KBD initializing...
KBD successully initialized !
@@@@@@@@@@@@@@@@@@@@@@@@@@DRV_KeySetCallBack :0x41e0b0
UBIFS DBG (pid 712): do_readpage: ino 163, pg 30, i_size 515924, flags 0x1
UBIFS DBG (pid 712): ubifs_lookup_level0: search key (163, data, 30)
UBIFS DBG (pid 712): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 712): fallible_read_node: LEB 91:90952, key (163, data, 30)
UBIFS DBG (pid 712): try_read_node: LEB 91:90952, data node, length 1212
UBIFS DBG (pid 712): do_readpage: ino 163, pg 31, i_size 515924, flags 0x1
UBIFS DBG (pid 714): do_readpage: ino 163, pg 22, i_size 515924, flags 0x1
UBIFS DBG (pid 712): ubifs_lookup_level0: search key (163, data, 31)
UBIFS DBG (pid 712): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 714): ubifs_lookup_level0: search key (163, data, 22)
UBIFS DBG (pid 712): fallible_read_node: LEB 91:92168, key (163, data, 31)
UBIFS DBG (pid 714): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 712): try_read_node: LEB 91:92168, data node, length 1300
UBIFS DBG (pid 714): fallible_read_node: LEB 91:79984, key (163, data, 22)
UBIFS DBG (pid 714): try_read_node: LEB 91:79984, data node, length 1501
_XML_GetNodeSet No result: platform_main
No element is found
UBIFS DBG (pid 649): do_readpage: ino 163, pg 34, i_size 515924, flags 0x1
UBIFS DBG (pid 649): ubifs_lookup_level0: search key (163, data, 34)
UBIFS DBG (pid 649): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 649): fallible_read_node: LEB 91:95968, key (163, data, 34)
UBIFS DBG (pid 649): try_read_node: LEB 91:95968, data node, length 1449
platform_main_init_ok
bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
oof === 0
UBIFS DBG (pid 444): ubifs_lookup: 'mtc.sh' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0xc21e3e0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 444): ubifs_read_node: LEB 105:52176, direntry node,
length 63
UBIFS DBG (pid 444): ubifs_iget: inode 183
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (183, inode)
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:19392, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:19392, level 0, 8 branch
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): fallible_read_node: LEB 105:52016, key (183, inode)
UBIFS DBG (pid 444): try_read_node: LEB 105:52016, inode node, length 160
UBIFS DBG (pid 444): do_readpage: ino 183, pg 0, i_size 339, flags 0x1
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (183, data, 0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 444): fallible_read_node: LEB 105:51752, key (183, data, 0)
UBIFS DBG (pid 444): try_read_node: LEB 105:51752, data node, length 258
UBIFS DBG (pid 444): ubifs_lookup: 'application.env' in dir ino 65
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (65, direntry,
0x5b87476)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 444): ubifs_read_node: LEB 119:10648, direntry node,
length 72
UBIFS DBG (pid 444): ubifs_iget: inode 1007
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (1007, inode)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): fallible_read_node: LEB 119:10488, key (1007, inode)
UBIFS DBG (pid 444): try_read_node: LEB 119:10488, inode node, length 160
UBIFS DBG (pid 444): do_readpage: ino 1007, pg 0, i_size 3158, flags 0x1
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (1007, data, 0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 444): fallible_read_node: LEB 119:9648, key (1007, data, 0)
UBIFS DBG (pid 444): try_read_node: LEB 119:9648, data node, length 834
UBIFS DBG (pid 444): ubifs_lookup: 'sed' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0x28c69d)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 0, lvl 0, n 3
UBIFS DBG (pid 444): ubifs_lookup: not found
UBIFS DBG (pid 444): ubifs_lookup: 'mtcenable' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0x10cf5113)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): ubifs_read_node: LEB 106:33968, direntry node,
length 66
UBIFS DBG (pid 444): ubifs_iget: inode 202
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (202, inode)
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:55368, indexing node,
length 168
UBIFS DBG (pid 444): read_znode: LEB 110:55368, level 2, 7 branch
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:43176, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:43176, level 1, 8 branch
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:21504, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:21504, level 0, 8 branch
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 444): fallible_read_node: LEB 106:33808, key (202, inode)
UBIFS DBG (pid 444): try_read_node: LEB 106:33808, inode node, length 160
wait for manually start mtc by executing mtc_start.sh.
oof End ------------------------->
starting pid 1, tty '/dev/ttyS0': '/bin/login -f root'
Jan  1 00:00:28 login[723]: root login on 'ttyS0'
#
#
#
#
# mount
rootfs on / type rootfs (rw)
proc on /proc type proc (rw,relatime)
none on /proc/bus/usb type usbfs (rw,relatime)
debugfs on /proc/sys/debug type debugfs (rw,relatime)
sys on /sys type sysfs (rw,relatime)
tmpfs on /dev type tmpfs (rw,relatime,size=64k,mode=755)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
tmpfs on /tmp type tmpfs (rw,relatime)
ubi12:platform on /usr/local/hmt/platform type ubifs (rw,relatime)
ubi14_0 on /usr/local/hmt/.appmid type ubifs (rw,relatime)
#
#
#
# mount
rootfs on / type rootfs (rw)
proc on /proc type proc (rw,relatime)
none on /proc/bus/usb type usbfs (rw,relatime)
debugfs on /proc/sys/debug type debugfs (rw,relatime)
sys on /sys type sysfs (rw,relatime)
tmpfs on /dev type tmpfs (rw,relatime,size=64k,mode=755)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
tmpfs on /tmp type tmpfs (rw,relatime)
ubi12:platform on /usr/local/hmt/platform type ubifs (rw,relatime)
ubi14_0 on /usr/local/hmt/.appmid type ubifs (rw,relatime)
# mount mount -t ubifs ubi13_0 /usr/local/hmt/appdata/
BusyBox v1.16.1 (2012-02-16 13:29:31 CST) multi-call binary.

Usage: mount [OPTIONS] [-o OPTS] DEVICE NODE

Mount a filesystem. Filesystem autodetection requires /proc.

Options:
        -a              Mount all filesystems in fstab
        -r              Read-only mount
        -w              Read-write mount (default)
        -t FSTYPE       Filesystem type
        -O OPT          Mount only filesystems with option OPT (-a only)
-o OPT:
        loop            Ignored (loop devices are autodetected)
        [a]sync         Writes are [a]synchronous
        [no]atime       Disable/enable updates to inode access times
        [no]diratime    Disable/enable atime updates to directories
        [no]relatime    Disable/enable atime updates relative to
modification time
        [no]dev         (Dis)allow use of special device files
        [no]exec        (Dis)allow use of executable files
        [no]suid        (Dis)allow set-user-id-root programs
        [r]shared       Convert [recursively] to a shared subtree
        [r]slave        Convert [recursively] to a slave subtree
        [r]private      Convert [recursively] to a private subtree
        [un]bindable    Make mount point [un]able to be bind mounted
        bind            Bind a file or directory to another location
        move            Relocate an existing mount point
        remount         Remount a mounted filesystem, changing flags
        ro/rw           Same as -r/-w

There are filesystem-specific -o flags.

#
# mount -t ubifs ubi13_0 /usr/local/hmt/appdata/
UBIFS DBG (pid 1021): ubifs_get_sb: name ubi13_0, flags 0x8000
UBIFS DBG (pid 1021): ubifs_get_sb: opened ubi13_0
UBIFS DBG (pid 1021): ubifs_read_node: LEB 0:0, superblock node, length 4096
UBIFS DBG (pid 1021): ubifs_start_scan: scan LEB 1:0
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:0 (126976 bytes left)
UBIFS DBG (pid 1023): ubifs_bg_thread: background thread "ubifs_bgt13_0"
started, PID 1023
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:512 (126464 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 2048
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:2048 (124928 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:2560 (124416 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 4096
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:4096 (122880 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:4608 (122368 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 6144
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:6144 (120832 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:6656 (120320 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 8192
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:8192 (118784 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:8704 (118272 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 10240
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:10240 (116736 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:10752 (116224 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 12288
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 1:12288 (114688 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1021): ubifs_end_scan: stop scanning LEB 1 at offset 12288
UBIFS DBG (pid 1021): ubifs_start_scan: scan LEB 2:0
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:0 (126976 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:512 (126464 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 2048
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:2048 (124928 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:2560 (124416 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 4096
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:4096 (122880 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:4608 (122368 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 6144
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:6144 (120832 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:6656 (120320 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 8192
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:8192 (118784 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:8704 (118272 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 10240
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:10240 (116736 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:10752 (116224 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1508 bytes padded, offset now 12288
mount: mounting ubi13_0 on /usr/local/hmt/appdata/ failed: Invalid argument
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 2:12288 (114688 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1021): ubifs_end_scan: stop scanning LEB 2 at offset 12288
it_rd: nnode_sz 12
UBIFS DBG (pid 1021): lpt_init_rd: ltab_sz 11
UBIFS DBG (pid 1021): lpt_init_rd: lsave_sz 227
UBIFS DBG (pid 1021): lpt_init_rd: lsave_cnt 256
UBIFS DBG (pid 1021): lpt_init_rd: lpt_hght 3
UBIFS DBG (pid 1021): lpt_init_rd: big_lpt 0
UBIFS DBG (pid 1021): lpt_init_rd: LPT root is at 7:122983
UBIFS DBG (pid 1021): lpt_init_rd: LPT head is at 7:124928
UBIFS DBG (pid 1021): lpt_init_rd: LPT ltab is at 7:122880
UBIFS DBG (pid 1021): ubifs_add_lpt_dirt: LEB 7 add 12 to 124813
UBIFS DBG (pid 1021): ubifs_add_lpt_dirt: LEB 7 add 11 to 124825
UBIFS DBG (pid 1021): ubifs_add_lpt_dirt: LEB 7 add 12 to 124836
UBIFS DBG (pid 1021): ubifs_add_lpt_dirt: LEB 7 add 12 to 124848
UBIFS DBG (pid 1021): ubifs_add_lpt_dirt: LEB 7 add 17 to 124860
UBIFS DBG (pid 1021): ubifs_lpt_lookup_dirty: LEB 20, free 49152, dirty
77376, flags 34
UBIFS DBG (pid 1021): ubifs_change_lp: LEB 20, free -2147483647, dirty
-2147483647, flags 50
UBIFS DBG (pid 1021): ubifs_lpt_lookup_dirty: LEB 20, free 49152, dirty
77376, flags 34
UBIFS DBG (pid 1021): ubifs_replay_journal: start replaying the journal
UBIFS DBG (pid 1021): replay_log_leb: replay log LEB 6:0
UBIFS DBG (pid 1021): ubifs_start_scan: scan LEB 6:0
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 6:0 (126976 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning commit start node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 6:32 (126944 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 6:96 (126880 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 6:160 (126816 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 6:224 (126752 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1021): ubifs_scan_a_node: 1796 bytes padded, offset now 2048
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 6:2048 (124928 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1021): ubifs_end_scan: stop scanning LEB 6 at offset 2048
UBIFS DBG (pid 1021): replay_log_leb: commit start sqnum 20009
UBIFS DBG (pid 1021): add_replay_bud: add replay bud LEB 11:28672, head 0
UBIFS DBG (pid 1021): ubifs_add_bud: LEB 11:28672, jhead 0, bud_bytes 98304
UBIFS DBG (pid 1021): add_replay_bud: add replay bud LEB 21:55296, head 1
UBIFS DBG (pid 1021): ubifs_add_bud: LEB 21:55296, jhead 1, bud_bytes 169984
UBIFS DBG (pid 1021): add_replay_bud: add replay bud LEB 14:51200, head 2
UBIFS DBG (pid 1021): ubifs_add_bud: LEB 14:51200, jhead 2, bud_bytes 245760
UBIFS DBG (pid 1021): replay_log_leb: replay log LEB 3:0
UBIFS DBG (pid 1021): ubifs_start_scan: scan LEB 3:0
UBIFS DBG (pid 1021): ubifs_scan: look at LEB 3:0 (126976 bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1021): ubifs_end_scan: stop scanning LEB 3 at offset 0
UBIFS DBG (pid 1021): replay_bud: replay bud LEB 11, head 0
UBIFS DBG (pid 1021): ubifs_recover_leb: 11:28672
UBIFS DBG (pid 1021): ubifs_start_scan: scan LEB 11:28672
UBIFS DBG (pid 1021): ubifs_recover_leb: look at LEB 11:28672 (98304
bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1021): ubifs_end_scan: stop scanning LEB 11 at offset 28672
UBIFS DBG (pid 1021): ubifs_wbuf_seek_nolock: LEB 11:28672, jhead 0
UBIFS DBG (pid 1021): insert_ref_node: add ref LEB 11:28672
UBIFS DBG (pid 1021): replay_bud: replay bud LEB 21, head 1
UBIFS DBG (pid 1021): ubifs_recover_leb: 21:55296
UBIFS DBG (pid 1021): ubifs_start_scan: scan LEB 21:55296
UBIFS DBG (pid 1021): ubifs_recover_leb: look at LEB 21:55296 (71680
bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1021): ubifs_end_scan: stop scanning LEB 21 at offset 55296
UBIFS DBG (pid 1021): ubifs_wbuf_seek_nolock: LEB 21:55296, jhead 1
UBIFS DBG (pid 1021): insert_ref_node: add ref LEB 21:55296
UBIFS DBG (pid 1021): replay_bud: replay bud LEB 14, head 2
UBIFS DBG (pid 1021): ubifs_recover_leb: 14:51200
UBIFS DBG (pid 1021): ubifs_start_scan: scan LEB 14:51200
UBIFS DBG (pid 1021): ubifs_recover_leb: look at LEB 14:51200 (75776
bytes left)
UBIFS DBG (pid 1021): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1021): ubifs_end_scan: stop scanning LEB 14 at offset 51200
UBIFS DBG (pid 1021): ubifs_wbuf_seek_nolock: LEB 14:51200, jhead 2
UBIFS DBG (pid 1021): insert_ref_node: add ref LEB 14:51200
UBIFS DBG (pid 1021): apply_replay_entry: LEB 11:28672 len 0 flgs 2
sqnum 20010 (0, inode)
UBIFS DBG (pid 1021): ubifs_add_lpt_dirt: LEB 7 add 17 to 124877
UBIFS DBG (pid 1021): ubifs_lpt_lookup_dirty: LEB 11, free 98304, dirty
23232, flags 3
UBIFS DBG (pid 1021): ubifs_change_lp: LEB 11, free 98304, dirty 23232,
flags 19
UBIFS DBG (pid 1021): ubifs_lpt_lookup_dirty: LEB 11, free 98304, dirty
23232, flags 3
UBIFS DBG (pid 1021): apply_replay_entry: LEB 21:55296 len 0 flgs 2
sqnum 20011 (0, inode)
UBIFS DBG (pid 1021): ubifs_lpt_lookup_dirty: LEB 21, free 71680, dirty
54976, flags 3
UBIFS DBG (pid 1021): ubifs_change_lp: LEB 21, free 71680, dirty 54976,
flags 19
UBIFS DBG (pid 1021): ubifs_lpt_lookup_dirty: LEB 21, free 71680, dirty
54976, flags 3
UBIFS DBG (pid 1021): apply_replay_entry: LEB 14:51200 len 0 flgs 2
sqnum 20012 (0, inode)
UBIFS DBG (pid 1021): ubifs_add_lpt_dirt: LEB 7 add 17 to 124894
UBIFS DBG (pid 1021): ubifs_lpt_lookup_dirty: LEB 14, free 75776, dirty
51200, flags 5
UBIFS DBG (pid 1021): ubifs_change_lp: LEB 14, free 75776, dirty 51200,
flags 21
UBIFS DBG (pid 1021): ubifs_lpt_lookup_dirty: LEB 14, free 75776, dirty
51200, flags 5
UBIFS DBG (pid 1021): ubifs_replay_journal: finished, log head LEB
6:2048, max_sqnum 20016, highest_inum 109
UBIFS DBG (pid 1021): kill_orphans: no orphans
UBIFS DBG (pid 1021): ubifs_find_dirty_leb: found LEB 17, free 126976,
dirty 0, flags 0x4
UBIFS DBG (pid 1021): ubifs_change_lp: LEB 17, free -2147483647, dirty
-2147483647, flags 20
UBIFS DBG (pid 1021): ubifs_lpt_lookup_dirty: LEB 17, free 126976, dirty
0, flags 4
UBIFS DBG (pid 1021): ubifs_rcvry_gc_commit: allocated LEB 17 for GC
UBIFS DBG (pid 1021): ubifs_rcvry_gc_commit: committing
UBIFS DBG (pid 1021): do_commit: start
UBIFS DBG (pid 1021): ubifs_log_start_commit: add ref to LEB 11:28672
for jhead 0
UBIFS DBG (pid 1021): ubifs_log_start_commit: add ref to LEB 21:55296
for jhead 1
UBIFS DBG (pid 1021): ubifs_log_start_commit: add ref to LEB 14:51200
for jhead 2
UBIFS DBG (pid 1021): ubifs_log_start_commit: writing commit start at
LEB 3:0, len 2048
UBIFS DBG (pid 1021): remove_buds: preserve 11:28672, jhead 0, bud bytes
0, cmt_bud_bytes 0
UBIFS DBG (pid 1021): remove_buds: preserve 14:51200, jhead 2, bud bytes
0, cmt_bud_bytes 0
UBIFS DBG (pid 1021): remove_buds: preserve 21:55296, jhead 1, bud bytes
0, cmt_bud_bytes 0
UBIFS DBG (pid 1021): get_znodes_to_commit: no znodes to commit
UBIFS DBG (pid 1021): ubifs_save_dirty_idx_lnums: found 1 dirty index LEBs
UBIFS DBG (pid 1021): ubifs_save_dirty_idx_lnums: dirtiest index LEB is
12 with dirty 126864 and free 0
UBIFS DBG (pid 1021): ubifs_tnc_start_commit: number of index LEBs 2
UBIFS DBG (pid 1021): ubifs_tnc_start_commit: size of index 560
UBIFS DBG (pid 1021): ubifs_lpt_start_commit:
UBIFS DBG (pid 1021): get_cnodes_to_commit: committing 6 cnodes
UBIFS DBG (pid 1021): get_cnodes_to_commit: committing 6 cnodes
UBIFS DBG (pid 1021): upd_ltab: LEB 7 free 2048 dirty 124911 to 0 +1950
UBIFS DBG (pid 1021): ubifs_orphan_start_commit: 0 orphans to commit
UBIFS DBG (pid 1021): ubifs_lpt_end_commit:
UBIFS DBG (pid 1021): write_cnodes: LPT root is at 7:125014
UBIFS DBG (pid 1021): write_cnodes: LPT head is at 7:126976
UBIFS DBG (pid 1021): write_cnodes: LPT ltab is at 7:124928
UBIFS DBG (pid 1021): ubifs_log_end_commit: old tail was LEB 6:0, new
tail is LEB 3:0
UBIFS DBG (pid 1021): ubifs_read_node: LEB 20:76000, indexing node,
length 108
UBIFS DBG (pid 1021): ubifs_write_node: LEB 1:12288, master node, length
512 (aligned 2048)
UBIFS DBG (pid 1021): ubifs_write_node: LEB 2:12288, master node, length
512 (aligned 2048)
UBIFS DBG (pid 1021): ubifs_log_post_commit: unmap log LEB 6
UBIFS DBG (pid 1021): do_commit: commit end
UBIFS: recovery completed
UBIFS: mounted UBI device 13, volume 0, name "appdata"
UBIFS: file system size:   2031616 bytes (1984 KiB, 1 MiB, 16 LEBs)
UBIFS: journal size:       1904640 bytes (1860 KiB, 1 MiB, 15 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS DBG (pid 1021): mount_ubifs: compiled on:         Apr 11 2012 at
09:17:42
UBIFS DBG (pid 1021): mount_ubifs: min. I/O unit size:  2048 bytes
UBIFS DBG (pid 1021): mount_ubifs: LEB size:            126976 bytes
(124 KiB)
UBIFS DBG (pid 1021): mount_ubifs: data journal heads:  1
UBIFS DBG (pid 1021): mount_ubifs: UUID:
02688B40-6466-4AA6-A0DD-C720B3AE678B
UBIFS DBG (pid 1021): mount_ubifs: big_lpt              0
UBIFS DBG (pid 1021): mount_ubifs: log LEBs:            4 (3 - 6)
UBIFS DBG (pid 1021): mount_ubifs: LPT area LEBs:       2 (7 - 8)
UBIFS DBG (pid 1021): mount_ubifs: orphan area LEBs:    1 (9 - 9)
UBIFS DBG (pid 1021): mount_ubifs: main area LEBs:      16 (10 - 25)
UBIFS DBG (pid 1021): mount_ubifs: index LEBs:          2
UBIFS DBG (pid 1021): mount_ubifs: total index bytes:   560 (0 KiB, 0 MiB)
UBIFS DBG (pid 1021): mount_ubifs: key hash type:       0
UBIFS DBG (pid 1021): mount_ubifs: tree fanout:         8
UBIFS DBG (pid 1021): mount_ubifs: reserved GC LEB:     17
UBIFS DBG (pid 1021): mount_ubifs: first main LEB:      10
UBIFS DBG (pid 1021): mount_ubifs: max. znode size      240
UBIFS DBG (pid 1021): mount_ubifs: max. index node size 192
UBIFS DBG (pid 1021): mount_ubifs: node sizes:          data 48, inode
160, dentry 56
UBIFS DBG (pid 1021): mount_ubifs: node sizes:          trun 56, sb
4096, master 512
UBIFS DBG (pid 1021): mount_ubifs: node sizes:          ref 64, cmt.
start 32, orph 32
UBIFS DBG (pid 1021): mount_ubifs: max. node sizes:     data 4144, inode
4256 dentry 312
UBIFS DBG (pid 1021): mount_ubifs: dead watermark:      2048
UBIFS DBG (pid 1021): mount_ubifs: dark watermark:      6144
UBIFS DBG (pid 1021): mount_ubifs: LEB overhead:        2656
UBIFS DBG (pid 1021): mount_ubifs: max. dark space:     98304 (96 KiB, 0
MiB)
UBIFS DBG (pid 1021): mount_ubifs: maximum bud bytes:   1396736 (1364
KiB, 1 MiB)
UBIFS DBG (pid 1021): mount_ubifs: BG commit bud bytes: 1134848 (1108
KiB, 1 MiB)
UBIFS DBG (pid 1021): mount_ubifs: current bud bytes    245760 (240 KiB,
0 MiB)
UBIFS DBG (pid 1021): mount_ubifs: max. seq. number:    20022
UBIFS DBG (pid 1021): mount_ubifs: commit number:       63
UBIFS DBG (pid 1021): ubifs_iget: inode 1
UBIFS DBG (pid 1021): ubifs_lookup_level0: search key (1, inode)
UBIFS DBG (pid 1021): ubifs_read_node: LEB 20:76000, indexing node,
length 108
UBIFS DBG (pid 1021): read_znode: LEB 20:76000, level 1, 4 branch
UBIFS DBG (pid 1021): ubifs_read_node: LEB 20:75776, indexing node,
length 108
UBIFS DBG (pid 1021): read_znode: LEB 20:75776, level 0, 4 branch
UBIFS DBG (pid 1021): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 1021): ubifs_read_node_wbuf: LEB 21:53472, inode node,
length 160, jhead 1
UBIFS DBG (pid 1021): ubifs_read_node: LEB 21:53472, inode node, length 160
p8[9]=09
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3b6e200
Data:

0000: 00040010 00000000 00000000 00880000 00000000 00000000 00000080
00000000
0020: 00000004 40000400 00000000 08000081 00000000 00200000 00000000
00000000
0040: 00000000 00000000 00000000 00000800 00040000 04000000 00110000
00000000
0060: 00000000 00000000 00000200 00800000 00000000 04000000 00000000
00100000
0080: 00000020 00000440 000000a4 00000002 00000000 00000000 00000804
80000000
00a0: 00000000 00040200 00088080 00000000 00000000 00400020 00000000
00000200
00c0: 40000000 00000000 00000000 00000000 00000040 00000000 00001000
00000000
00e0: 00000000 000c0000 00000000 00800000 00000000 00000000 00000000
00000040
0100: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
0120: 10000000 00000002 00180000 00000000 01800000 00000000 00000080
00000000
0140: 00000000 00000000 00080000 00080000 00000000 00000000 00000000
00400000
0160: 00000000 00000000 00000000 00000000 00000000 00000000 00000040
00000000
0180: 00000000 00000000 00000000 00000000 00000000 00002010 00080000
00000000
01a0: 00080000 00000000 00000000 00010010 00000100 00808000 00000000
00000000
01c0: 00000000 00000000 00000000 00000000 00000000 00000000 00000008
08000000
01e0: 00020000 00000000 00004000 00000000 00000000 00000000 00000000
00000000
Spare Area
 ffffffff ffffffff ff092f23 d917cef6
brcmnand_post_mortem_dump at offset 3b6e200
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293a0>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cfc8>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327d78>] brcmnand_do_read_ops+0x164/0x274
[<80328ca4>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a618>] ubi_io_read+0x8c/0x1a4
[<80339fcc>] ubi_eba_read_leb+0x130/0x2e8
[<80337984>] ubi_leb_read+0xf0/0x150
[<801e64b4>] ubifs_read_node+0xcc/0x3bc
[<80211274>] ubifs_tnc_read_node+0x64/0x220
[<801ee00c>] ubifs_tnc_locate+0x24c/0x27c
[<801e140c>] ubifs_iget+0xa4/0x734
[<801e2350>] ubifs_fill_super+0x8b4/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03b6e200
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ff092f23  d917cef6
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03b6e200
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03b6e200  00000000  03c64600
004428a0:  00000000  00000000  00000000  07020000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3b6e200, ret=-77
UBIFS error (pid 1021): ubifs_read_node: bad node type (170 but expected 0)
UBIFS error (pid 1021): ubifs_read_node: bad node at LEB 21:53472
Not a node, first 24 bytes:
00000000: aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
aa aa aa                          ........................
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<801e6794>] ubifs_read_node+0x3ac/0x3bc
[<80211274>] ubifs_tnc_read_node+0x64/0x220
[<801ee00c>] ubifs_tnc_locate+0x24c/0x27c
[<801e140c>] ubifs_iget+0xa4/0x734
[<801e2350>] ubifs_fill_super+0x8b4/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

UBIFS DBG (pid 1021): ubifs_tnc_read_node: key (1, inode)
UBIFS error (pid 1021): ubifs_iget: failed to read inode 1, error -22
UBIFS DBG (pid 1021): ubifs_umount: un-mounting UBI device 13, volume 0
UBIFS DBG (pid 1023): ubifs_bg_thread: background thread "ubifs_bgt13_0"
stops
#
# mount
rootfs on / type rootfs (rw)
proc on /proc type proc (rw,relatime)
none on /proc/bus/usb type usbfs (rw,relatime)
debugfs on /proc/sys/debug type debugfs (rw,relatime)
sys on /sys type sysfs (rw,relatime)
tmpfs on /dev type tmpfs (rw,relatime,size=64k,mode=755)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
tmpfs on /tmp type tmpfs (rw,relatime)
ubi12:platform on /usr/local/hmt/platform type ubifs (rw,relatime)
ubi14_0 on /usr/local/hmt/.appmid type ubifs (rw,relatime)
#

-- 
Have fun,
Mark Zhang
