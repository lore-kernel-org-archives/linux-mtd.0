Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqna8-0003d7-I4
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 19:37:26 +0000
Received: by oiad129 with SMTP id d129so106932922oia.0
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 12:37:03 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 26 Oct 2015 12:37:02 -0700
Message-ID: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
Subject: UBIFS corruption after power cut - possibly unstable bits issue?
From: Tim Harvey <tharvey@gateworks.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

I'm looking into a re-producible ubifs corruption issue on an IMX6
based board with a 16Gb MT29F2G08 SLC NAND flash. During boot
reliability tests we can recreate perhaps 1 in 10000 cases of a UBIFS
corruption that results in a permanent failure to mount the rootfs.

In this scenario the U-Boot bootloader first mounts the ubifs to load
the kernel/dtb from the /boot directory, then the kernel is mounting
the rootfs read-only, then later its mounted read/write via /etc/fstab
but is never written to directly by our software. Our software runs
various tests for several minutes then power-cuts the board.

After corruption, U-Boot fails reading the superblock but if I load a
kernel/dtb from the net and boot it I see some more useful info from
the kernel:

[    0.000000] Linux version 4.2.0-00012-gd722238 (tharvey@tharvey)
(gcc version 4.8.3 (OpenWrt/Linaro GCC 4.8-2014.04 r43990) ) #189 SMP
Fri Oct 23 16:24:27 PDT 2015
...
[    2.375663] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd5
[    2.382075] nand: Micron MT29F16G08ADACAH4
[    2.386190] nand: 2048 MiB, SLC, erase size: 256 KiB, page size:
4096, OOB size: 224
[    2.394821] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode 5
[    2.401760] Scanning device for bad blocks
[    4.000436] 3 ofpart partitions found on MTD device gpmi-nand
[    4.006201] Creating 3 MTD partitions on "gpmi-nand":
[    4.011298] 0x000000000000-0x000001000000 : "uboot"
[    4.021174] 0x000001000000-0x000001100000 : "env"
[    4.028287] 0x000001100000-0x000080000000 : "rootfs"
[    4.037134] gpmi-nand 112000.gpmi-nand: driver registered.
...
[    8.678875] ubi0: scanning is finished
[    8.706815] ubi0: attached mtd2 (name "rootfs", size 2031 MiB)
[    8.712710] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
[    8.719598] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
[    8.726415] ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
[    8.733398] ubi0: good PEBs: 8124, bad PEBs: 0, corrupted PEBs: 0
[    8.739501] ubi0: user volume: 1, internal volumes: 1, max. volumes
count: 128
[    8.746748] ubi0: max/mean erase counter: 5/2, WL threshold: 4096,
image sequence number: 36433972
[    8.755747] ubi0: available PEBs: 0, total reserved PEBs: 8124,
PEBs reserved for bad PEB handling: 160
[    8.765357] ubi0: background thread "ubi_bgt0d" started, PID 79
...
[    8.888732] UBIFS (ubi0:0): recovery needed
[    8.916292] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 36
864 bytes from PEB 5195:225280, read only 36864 bytes, retry
[    8.931116] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 36
864 bytes from PEB 5195:225280, read only 36864 bytes, retry
[    8.945869] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 36
864 bytes from PEB 5195:225280, read only 36864 bytes, retry
[    8.960676] ubi0 error: ubi_io_read: error -74 (ECC error) while reading 3686
4 bytes from PEB 5195:225280, read 36864 bytes
[    8.971859] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.2.0-00012-gd722238 #1
89
[    8.979177] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    8.985747] Backtrace:
[    8.988248] [<80013468>] (dump_backtrace) from [<80013654>] (show_stack+0x18/
0x1c)
[    8.995848]  r6:80abf960 r5:80abf960 r4:00000000 r3:00000000
[    9.001649] [<8001363c>] (show_stack) from [<80798948>]
(dump_stack+0x8c/0xa4)
[    9.008894] [<807988bc>] (dump_stack) from [<8045d410>]
(ubi_io_read+0x128/0x304)
[    9.016428]  r6:00000000 r5:00009000 r4:ffffffb6 r3:ee070000
[    9.022201] [<8045d2e8>] (ubi_io_read) from [<8045a650>]
(ubi_eba_read_leb+0x18c/0x430)
[    9.030210]  r10:00000000 r9:f069e000 r8:0000144b r7:00000179
r6:00000000 r5:edab6000
[    9.038189]  r4:edb10000
[    9.040783] [<8045a4c4>] (ubi_eba_read_leb) from [<80459a08>]
(ubi_leb_read+0x7c/0xd4)
[    9.048724]  r10:00000000 r9:00000179 r8:f069e000 r7:edb10000
r6:00035000 r5:00009000
[    9.056677]  r4:edab6000
[    9.059254] [<8045998c>] (ubi_leb_read) from [<80253c2c>]
(ubifs_leb_read+0x30/0x9c)
[    9.067044]  r10:ee034000 r9:edb55e40 r8:00000179 r7:00035000
r6:00009000 r5:ee034000
[    9.074996]  r4:edb55e40
[    9.077563] [<80253bfc>] (ubifs_leb_read) from [<8025bfe0>]
(ubifs_start_scan+0x74/0xf0)
[    9.085697]  r8:f0669000 r7:00000179 r6:ee034000 r5:00035000 r4:edb55e40
[    9.092575] [<8025bf6c>] (ubifs_start_scan) from [<8026e624>]
(ubifs_recover_leb+0x64/0x810)
[    9.101051]  r8:00009000 r7:00000179 r6:ee034000 r5:edb55cc0 r4:00000179
[    9.107850] [<8026e5c0>] (ubifs_recover_leb) from [<8025d890>]
(ubifs_replay_journal+0xed0/0x16a0)
[    9.116846]  r10:ee034000 r9:edb55e40 r8:edb55e48 r7:ee034000
r6:edb55cc0 r5:edb55cc0
[    9.124782]  r4:00000179
[    9.127344] [<8025c9c0>] (ubifs_replay_journal) from [<802515ec>]
(ubifs_mount+0x1234/0x19fc)
[    9.135906]  r10:00000001 r9:ee034008 r8:edb4a300 r7:eda92800
r6:ee034b38 r5:ee034000
[    9.143842]  r4:00000000
[    9.146411] [<802503b8>] (ubifs_mount) from [<80103c6c>] (mount_fs+0x1c/0xb0)
[    9.153578]  r10:00008001 r9:00000000 r8:80abc2e0 r7:801234a8
r6:80abc2e0 r5:edb4a280
[    9.161514]  r4:eda61400
[    9.164084] [<80103c50>] (mount_fs) from [<8011fedc>]
(vfs_kern_mount+0x5c/0x144)
[    9.171602]  r6:00008001 r5:edb4a280 r4:eda61400
[    9.176282] [<8011fe80>] (vfs_kern_mount) from [<801234a8>]
(do_mount+0x19c/0xd0c)
[    9.183886]  r9:80abc2e0 r8:80ab0bdc r7:edb4a240 r6:edb4a280
r5:00000060 r4:00000000
[    9.191743] [<8012330c>] (do_mount) from [<801243ac>] (SyS_mount+0x7c/0xa8)
[    9.198721]  r10:000000d5 r9:80a8d9c8 r8:8094cfa0 r7:00008001
r6:00000000 r5:edb4a280
[    9.206660]  r4:edb4a240
[    9.209227] [<80124330>] (SyS_mount) from [<80a3a248>]
(mount_block_root+0x114/0x240)
[    9.217091]  r8:ef5af1c0 r7:80a8d9b8 r6:edb8e000 r5:edb8e000 r4:00008001
[    9.223907] [<80a3a134>] (mount_block_root) from [<80a3a634>]
(prepare_namespace+0x98/0x1d0)
[    9.232380]  r10:000000d5 r9:80a8d998 r8:80a9b5c0 r7:80a8d990
r6:80a8d9b8 r5:80a8d9b8
[    9.240297]  r4:80a8d9c8
[    9.242877] [<80a3a59c>] (prepare_namespace) from [<80a39ee4>]
(kernel_init_freeable+0x1a4/0x1f0)
[    9.251780]  r6:80b09000 r5:80b09000 r4:00000007
[    9.256467] [<80a39d40>] (kernel_init_freeable) from [<80792cdc>]
(kernel_init+0x10/0xf4)
[    9.264667]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:
80792ccc
[    9.272614]  r4:00000000
[    9.275177] [<80792ccc>] (kernel_init) from [<8000f938>]
(ret_from_fork+0x14/0x3c)
[    9.282782]  r4:00000000 r3:00000000
[    9.286909] UBIFS error (ubi0:0 pid 1): ubifs_recover_leb: corrupt
empty space LEB 377:217088, corruption starts at 24762
[    9.297900] UBIFS error (ubi0:0 pid 1): ubifs_scanned_corruption:
corruption at LEB 377:241850
[    9.306536] UBIFS error (ubi0:0 pid 1): ubifs_scanned_corruption:
first 8192 bytes from LEB 377:241850
[    9.315870] 00000000: ffffffef ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[    9.327374] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[    9.338883] 00000040: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[    9.350389] 00000060: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
...
[    9.352755] 00001fc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff f
fffffff ffffffff  ................................
[    9.352765] 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff f
fffffff ffffffff  ................................
[    9.352770] UBIFS error (ubi0:0 pid 1): ubifs_recover_leb: LEB 377 scanning f
ailed
[   12.271485] VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0):
 error -117

Thus far we have encountered this with a 16Gb MT29F16G08 and 'not'
with a 2Gb MT29F2G08. The two parts have different geometries and the
16Gb part has a much larger block erase time (2ms) compared to the 2Gb
(700us).

We have also seen several occurrences of errors on both NAND chips
that cause a failure to mount rootfs but are not permanent
(power-cycle again and all is well):
[17:39:02][    2.666800] ubi0: attaching mtd2
[17:39:05][    5.388606] ubi0: scanning is finished
[17:39:05][    5.395747] ubi0 error: vtbl_check: bad CRC at record 72:
0xf116c36b, not 0x000000
[17:39:05][    5.403330] Volume table record 72 dump:
[17:39:05][    5.407279]        reserved_pebs   0
[17:39:05][    5.410342]        alignment       0
[17:39:05][    5.413402]        data_pad        0
[17:39:05][    5.416481]        vol_type        0
[17:39:05][    5.419543]        upd_marker      0
[17:39:05][    5.422603]        name_len        0
[17:39:05][    5.427696]        name            NULL
[17:39:05][    5.433237] ubi0 error: vtbl_check: bad CRC at record 72:
0xf116c36b, not 0x000000
[17:39:05][    5.440846] Volume table record 72 dump:
[17:39:05][    5.446806]        reserved_pebs   0
[17:39:05][    5.451881]        alignment       0
[17:39:05][    5.456967]        data_pad        0
[17:39:05][    5.462042]        vol_type        0
[17:39:05][    5.467137]        upd_marker      0
[17:39:05][    5.472216]        name_len        0
[17:39:05][    5.475304]        name            NULL
[17:39:05][    5.478629] ubi0 error: process_lvol: both volume tables
are corrupted
[17:39:05][    5.492599] ubi0 error: ubi_attach_mtd_dev: failed to
attach mtd2, error -22
[17:39:05][    5.499728] UBI error: cannot attach mtd2

Are any/all of the above the 'unstable bits' issue? Any
recommendations on what to look for next?

Regards,

Tim

Tim Harvey - Principal Software Engineer
Gateworks Corporation - http://www.gateworks.com/
3026 S. Higuera St. San Luis Obispo CA 93401
805-781-2000
