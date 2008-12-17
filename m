Received: from aibo.runbox.com ([87.238.52.70])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCySa-0008TM-Hl
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 15:37:17 +0000
Received: from [10.9.9.161] (helo=patch.runbox.com)
	by greyhound.runbox.com with esmtp (Exim 4.50) id 1LCySb-0004lF-PJ
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 16:37:17 +0100
Received: from [74.94.155.203] (helo=[192.168.12.139])
	by patch.runbox.com with esmtpsa (uid:263104 )
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63) id 1LCySX-0000yO-OC
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 16:37:14 +0100
Message-ID: <49491CA7.5020200@runbox.com>
Date: Wed, 17 Dec 2008 10:37:11 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: ubifs <linux-mtd@lists.infradead.org>
Subject: ubifs backtrace for - BUG: scheduling while atomic - when runs out
	of space
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is backtrace.

Can you see the problem?

Thanks,
Cal Page

!!! Note: BUG() placed at kernel/sched.c schedule() at 'scheduling while atomic'

Backtrace: 

[<c0e1e640>] (schedule+0x0/0x6dc) from [<c0d2245c>] (wait_op_done+0xb0/0x150)
[<c0d223ac>] (wait_op_done+0x0/0x150) from [<c0d22740>] (send_prog_page+0x64/0x74)
 r5 = C0F2ABE0  r4 = C661FAC0 
[<c0d226dc>] (send_prog_page+0x0/0x74) from [<c0d22934>] (mxc_nand_command+0x16c/0x3ec)
[<c0d227c8>] (mxc_nand_command+0x0/0x3ec) from [<c0d1ddd8>] (nand_write_page+0x80/0xd4)
[<c0d1dd58>] (nand_write_page+0x0/0xd4) from [<c0d1e83c>] (nand_do_write_ops+0x2b0/0x340)
 r7 = 0004AA60  r6 = C4B07000  r5 = 00000000  r4 = 00000800
[<c0d1e58c>] (nand_do_write_ops+0x0/0x340) from [<c0d1f71c>] (nand_write+0xa0/0xc0)
[<c0d1f67c>] (nand_write+0x0/0xc0) from [<c0d153e8>] (part_write+0xb0/0xec)
[<c0d15338>] (part_write+0x0/0xec) from [<c0d2a6b0>] (ubi_io_write+0x78/0xb4)
 r7 = FFFFFFE2  r6 = C4B07000  r5 = 00000000  r4 = 00010000
[<c0d2a638>] (ubi_io_write+0x0/0xb4) from [<c0d28af0>] (ubi_eba_write_leb+0x94/0x83c)
[<c0d28a5c>] (ubi_eba_write_leb+0x0/0x83c) from [<c0d27d9c>] (ubi_leb_write+0xec/0x104)
[<c0d27cb0>] (ubi_leb_write+0x0/0x104) from [<c0c77fac>] (dbg_leb_write+0x9c/0xb8)
 r8 = C4B07000  r7 = 0000003C  r6 = C509BB00  r5 = 00000800  r4 = C44DE000 
[<c0c77f10>] (dbg_leb_write+0x0/0xb8) from [<c0c542ac>] (ubifs_wbuf_write_nolock+0x444/0x6f4)
[<c0c53e68>] (ubifs_wbuf_write_nolock+0x0/0x6f4) from [<c0c46f30>] (write_head+0x10c/0x150)
[<c0c46e24>] (write_head+0x0/0x150) from [<c0c470d0>] (ubifs_jnl_write_inode+0x12c/0x25c)
[<c0c46fa4>] (ubifs_jnl_write_inode+0x0/0x25c) from [<c0c50c38>] (ubifs_write_inode+0x118/0x18c)
[<c0c50b20>] (ubifs_write_inode+0x0/0x18c) from [<c0bf2e68>] (__writeback_single_inode+0x200/0x384)
 r7 = C405C5EC  r6 = C459EC00  r5 = C405C554  r4 = 00000001
[<c0bf2c68>] (__writeback_single_inode+0x0/0x384) from [<c0bf32a0>] (sync_sb_inodes+0x1d8/0x2c8)
[<c0bf30c8>] (sync_sb_inodes+0x0/0x2c8) from [<c0bf35a4>] (generic_sync_sb_inodes+0x10/0x14)
[<c0bf3594>] (generic_sync_sb_inodes+0x0/0x14) from [<c0c65534>] (ubifs_budget_space+0x98c/0xe98)
[<c0c64ba8>] (ubifs_budget_space+0x0/0xe98) from [<c0c4a578>] (ubifs_prepare_write+0x18c/0x1a4)
[<c0c4a3ec>] (ubifs_prepare_write+0x0/0x1a4) from [<c0bb22f4>] (generic_file_buffered_write+0x2a0/0x694)
[<c0bb2058>] (generic_file_buffered_write+0x4/0x694) from [<c0bb2c24>] (__generic_file_aio_write_nolock+0x53c/0x5bc)
[<c0bb26e8>] (__generic_file_aio_write_nolock+0x0/0x5bc) from [<c0bb2d20>] (generic_file_aio_write+0x7c/0xf0)
[<c0bb2ca8>] (generic_file_aio_write+0x4/0xf0) from [<c0c49220>] (ubifs_aio_write+0x1b4/0x244)
[<c0c49070>] (ubifs_aio_write+0x4/0x244) from [<c0bd2718>] (do_sync_write+0xc0/0x114)
[<c0bd2658>] (do_sync_write+0x0/0x114) from [<c0bd30d8>] (vfs_write+0xb8/0x194)
 r6 = C44DFF80  r5 = BEF15AF8  r4 = C5183CA0 
[<c0bd3020>] (vfs_write+0x0/0x194) from [<c0bd37f0>] (sys_write+0x4c/0x80)
 r7 = 00000004  r6 = 00000000  r5 = 0006E000  r4 = C5183CA0
[<c0bd37a4>] (sys_write+0x0/0x80) from [<c0b6fde0>] (ret_fast_syscall+0x0/0x2c)
 r6 = 4001D660  r5 = BEF15AF8  r4 = 00002000 
Code: e59f0650 ebf5b444 ebf554f6 e3a03000 (e5833000) 

!!! More Info
UBI: attaching mtd12 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd12 to ubi0
UBI: MTD device name:            "nand_part2"
UBI: MTD device size:            512 MiB
UBI: number of good PEBs:        4095
UBI: number of bad PEBs:         1
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     2
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 4095
UBI: number of PEBs reserved for bad PEB handling: 40
UBI: max/mean erase counter: 8/4
UBI: background thread "ubi_bgt0d" started, PID 2066
UBI device number 0, total 4095 LEBs (519966720 bytes, 495.9 MiB), available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)

UBIFS: background thread "ubifs_bgt0_0" started, PID 2255
UBIFS: mounted UBI device 0, volume 0, name "config_data"
UBIFS: file system size: 19935232 bytes (19468 KiB, 19 MiB, 157 LEBs)
UBIFS: journal size: 1015809 bytes (992 KiB, 0 MiB, 8 LEBs)
UBIFS: default compressor: LZO
UBIFS: media format 4, latest format 4
UBIFS DBG (pid 2254): mount_ubifs: compiled on:         Dec 17 2008 at 07:07:21
UBIFS DBG (pid 2254): mount_ubifs: min. I/O unit size:  2048 bytes
UBIFS DBG (pid 2254): mount_ubifs: LEB size:            126976 bytes (124 KiB)
UBIFS DBG (pid 2254): mount_ubifs: data journal heads:  1
UBIFS DBG (pid 2254): mount_ubifs: UUID:                884BA528-F897-45BF-8F93-65BB2FAD7541
UBIFS DBG (pid 2254): mount_ubifs: fast unmount:        0
UBIFS DBG (pid 2254): mount_ubifs: big_lpt              0
UBIFS DBG (pid 2254): mount_ubifs: log LEBs:            3 (3 - 5)
UBIFS DBG (pid 2254): mount_ubifs: LPT area LEBs:       2 (6 - 7)
UBIFS DBG (pid 2254): mount_ubifs: orphan area LEBs:    1 (8 - 8)
UBIFS DBG (pid 2254): mount_ubifs: main area LEBs:      157 (9 - 165)
UBIFS DBG (pid 2254): mount_ubifs: index LEBs:          1
UBIFS DBG (pid 2254): mount_ubifs: total index bytes:   17152 (16 KiB, 0 MiB)
UBIFS DBG (pid 2254): mount_ubifs: key hash type:       0
UBIFS DBG (pid 2254): mount_ubifs: tree fanout:         8
UBIFS DBG (pid 2254): mount_ubifs: reserved GC LEB:     20
UBIFS DBG (pid 2254): mount_ubifs: first main LEB:      9
UBIFS DBG (pid 2254): mount_ubifs: dead watermark:      2048
UBIFS DBG (pid 2254): mount_ubifs: dark watermark:      6144
UBIFS DBG (pid 2254): mount_ubifs: max. dark space:     964608 (942 KiB, 0 MiB)
UBIFS DBG (pid 2254): mount_ubifs: maximum bud bytes:   634881 (620 KiB, 0 MiB)
UBIFS DBG (pid 2254): mount_ubifs: BG commit bud bytes: 515840 (503 KiB, 0 MiB)
UBIFS DBG (pid 2254): mount_ubifs: current bud bytes    112640 (110 KiB, 0 MiB)
UBIFS DBG (pid 2254): mount_ubifs: max. seq. number:    30143
UBIFS DBG (pid 2254): mount_ubifs: commit number:       59

Note: after mount, FILL DISK PARTITION HERE !!!

BUG: scheduling while atomic: tar/0xffffffff/2256
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c4220000
[00000000] *pgd=a420e031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at schedule+0x64/0x6dc
LR is at schedule+0x60/0x6dc
pc : [<c0e1e6a4>]    lr : [<c0e1e6a0>]    Not tainted
sp : c44df834  ip : c44df834  fp : c44df86c
r10: c661fa00  r9 : c661fba8  r8 : ffffffff
r7 : ffffffff  r6 : 00000010  r5 : c0d2245c  r4 : c44df870
r3 : 00000000  r2 : ffffffff  r1 : 00000001  r0 : 00000035
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 5317F
Table: A4220000  DAC: 00000015
Process tar (pid: 2256, stack limit = 0xc44de250)
Stack: (0xc44df834 to 0xc44e0000)
f820:                                              c44de000 c44df870 00000004 
f840: 00000080 c44df870 00000000 00000010 ffffffff ffffffff c661fba8 c661fa00 
f860: c44df898 c44df870 c0d2245c c0e1e650 00000000 c44cc580 c0ba16f0 c0f2abec 
f880: c0f2abec c661fac0 c0f2abe0 c44df8a8 c44df89c c0d22740 c0d223bc c44df8d0 
f8a0: c44df8ac c0d22934 c0d226ec c661fac0 c661fa00 c4b07000 0004aa60 00000000 
f8c0: c661fac0 c44df8f4 c44df8d4 c0d1ddd8 c0d227d8 c44df8e0 00000800 00000000 
f8e0: c4b07000 0004aa60 c44df948 c44df8f8 c0d1e83c c0d1dd68 00000000 00000000 
f900: c661fa00 00000000 0004aa60 0000003f 00000000 00000800 00000000 c4b07000 
f920: c661fac0 00000800 c661fa00 00000800 25530000 00000000 c661fba8 c44df974 
f940: c44df94c c0d1f71c c0d1e59c 00000000 05530000 00000000 ffffc7d7 000002a9 
f960: 00000800 00010000 c44df99c c44df978 c0d153e8 c0d1f68c c44df9ac c4b07000 
f980: 00010000 00000000 c4b07000 ffffffe2 c44df9d8 c44df9a0 c0d2a6b0 c0d15348 
f9a0: c44df9ac c4b07000 c0e20a50 c44df9c8 c509bb00 0000003c 00000800 c4b07000 
f9c0: 000002a9 0000f000 00000000 c44dfa44 c44df9dc c0d28af0 c0d2a648 00000800 
f9e0: 000002db 00000000 c0f285d8 c44dfa08 c44df9fc c0d08718 c0b84e10 c4b07000 
fa00: 0000003c c66a1000 c603c800 000000f0 00000000 00000038 00000000 c509bb00 
fa20: 0000003c 00000800 c4b07000 00000002 0000f000 00000000 c44dfa74 c44dfa48 
fa40: c0d27d9c c0d28a6c 0000f000 00000800 00000002 c44de000 00000800 c509bb00 
fa60: 0000003c c4b07000 c44dfaa8 c44dfa78 c0c77fac c0d27cc0 00000800 00000002 
fa80: c44de000 c4b07800 c459ee60 000000a0 000000a0 c44dfb40 c4b07800 c44dfae8 
faa0: c44dfaac c0c542ac c0c77f20 00000800 00000002 000000a0 000000a0 c60cc3e0 
fac0: c44de000 c4b07800 00000060 00000001 000000a0 c44dfb40 c459ee60 c44dfb24 
fae0: c44dfaec c0c46f30 c0c53e78 c0c46e1c c0c53b1c 00000001 c60cc3e0 00000000 
fb00: c4b07800 c405c554 c60cc3e0 000000a0 00000000 00000000 c44dfb6c c44dfb28 
fb20: c0c470d0 c0c46e34 c44dfb40 c44dfb3c 00000000 c44dfb40 c0cfd888 0000f780 
fb40: 0000003c 00000001 c405c554 c405c698 c4b07800 00000000 00000000 c44dfc60 
fb60: c44dfb94 c44dfb70 c0c50c38 c0c46fb4 c44dfc60 c44dfb94 00000001 c405c554 
fb80: c459ec00 c405c5ec c44dfbdc c44dfb98 c0bf2e68 c0c50b30 0000001e 00000102 
fba0: c44de000 00000000 c44dfbd4 c44de000 c0e88780 c459ec00 c405c554 c4b07804 
fbc0: c44dfc60 c44de000 ffffc7d7 00000000 c44dfc08 c44dfbe0 c0bf32a0 c0bf2c78 
fbe0: 00000010 c44dfc60 00000000 c44de000 00f3bc70 00000000 c4b07800 c44dfc18 
fc00: c44dfc0c c0bf35a4 c0bf30d8 c44dfcc0 c44dfc1c c0c65534 c0bf35a4 0000000a 
fc20: c44dfc3c c44dfc30 00e8e290 00000000 00000fa0 00000000 c44dfcc4 000000c0 
fc40: 00000000 00001030 00000000 000000a0 00000000 000000c0 00001030 000000a0 
fc60: 00000000 00000000 00000000 00000010 00000000 00000000 00000000 ffffffff 
fc80: 7fffffff 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
fca0: 00001000 c43fe444 c4b07800 bef16af8 0000006f c44dfcfc c44dfcc4 c0c4a578 
fcc0: c0c64bb8 00200008 00000000 00000000 00000000 00000000 00001000 00001000 
fce0: c0f84500 00001000 00000000 00000000 c44dfd9c c44dfd00 c0bb22f4 c0c4a3fc 
fd00: 00000001 c44dfeb4 00000001 00001000 c5183ca0 c43fe4dc c0e9893c c43fe444 
fd20: 00001000 c44de000 c44dff38 00000000 00000002 00000000 c0f844e0 c0f84500 
fd40: c0b6f9d8 c0b707b4 bef163d8 c26b6900 000006a0 706f7264 676e6970 20707520 
fd60: 33206f74 72662033 73656d61 c5183164 20000e47 00000000 ffffffff c43fe444 
fd80: c44dfefc 0006e000 00000000 00002000 c44dfe10 c44dfda4 c0bb2c24 c0bb2068 
fda0: 0006f000 00000000 c44dfefc 00001000 00001000 c44dfefc c44dff38 c44dfeb4 
fdc0: c5183ca0 c43fe4dc 00002000 00000000 00000001 c0be9494 00000002 c44dfefc 
fde0: c5183120 c4f0b174 c43fe4b0 c44dfeb4 c43fe444 0006e000 00000000 00000001 
fe00: c44dff38 c44dfe4c c44dfe14 c0bb2d20 c0bb26f8 00000000 00000e5a c5183ca0 
fe20: c43fe4dc 00000000 c43fe444 c44dff80 c0f22208 c4b07800 00000001 c44dfeb4 
fe40: c44dfea8 c44dfe54 c0c49220 c0bb2cb8 0006e000 00000000 c44dff38 c44dfe70 
fe60: c0bb0604 c44dff38 00000001 c44dfefc 00002000 00000000 bef17af8 00000000 
fe80: c44dfeb4 c5183ca0 c44dff80 00002000 c0b6ff84 c44de000 ffffffff c44dff58 
fea0: c44dfeb0 c0bd2718 c0c49080 0006e000 00000000 c44dfee8 c44dfec4 00000000 
fec0: 00000001 ffffffff c5183ca0 00000000 00000000 00000000 00000000 c44cc580 
fee0: 00000000 00000000 c0bd0cd4 c44cc580 c0ba16f0 c44dfef4 c44dfef4 0006e000 
ff00: 00000000 c44dff08 c517e914 c7c0caa0 5e692e1f 00002000 c51cd006 00000300 
ff20: 00000000 00000000 00000000 c4f0b1d8 00000001 c5182134 bef15af8 00002000 
ff40: c5183ca0 bef15af8 c44dff80 c44dff7c c44dff5c c0bd30d8 c0bd2668 00000000 
ff60: c5183ca0 0006e000 00000000 00000004 c44dffa4 c44dff80 c0bd37f0 c0bd3030 
ff80: 0006e000 00000000 00000000 00002000 bef15af8 4001d660 00000000 c44dffa8 
ffa0: c0b6fde0 c0bd37b4 00002000 bef15af8 00000004 bef15af8 00002000 00071604 
ffc0: 00002000 bef15af8 4001d660 00000004 00000000 00000004 ffffffff 00000003 
ffe0: 00000000 bef15ad0 0000d9d4 40103e74 60000010 00000004 00000000 00000000 

Backtrace: (see above)

Kernel panic - not syncing: Aiee, killing interrupt handler!
