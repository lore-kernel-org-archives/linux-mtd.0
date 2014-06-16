Received: from den-mipot-002.corp.ebay.com ([216.113.175.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwdHZ-0005pH-7y
 for linux-mtd@lists.infradead.org; Mon, 16 Jun 2014 20:13:34 +0000
From: "Voytovich, Mike" <mvoytovich@paypal.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubi_io_read -74 and ubifs_scanned_corruption errors with i.MX28
Date: Mon, 16 Jun 2014 20:13:09 +0000
Message-ID: <CFC49DF0.A141%mvoytovich@paypal.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <70C7CEC3578EF9448BC6B7E5B0120DF8@corp.ebay.com>
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

Hi,

We're seeing a failed device after running for a few weeks with various
UBIFS errors, including "ubi_io_read: error -74", "ubifs_scan: corrupt
empty space", "ubifs_scanned_corruption", etc (please see the kernel
output below).  We're running Linux 3.10.0-rc7 on a Freescale i.MX28 board
with a Micron MT29F2G08ABAEA device.

I tried running some of the mtd tests, and most of them pass, with the
exception of mtd_oobtest and mtd_nandbiterrs (although reading the
archives, it appears these failures may be due to an issue with the tests,
and not necessarily related to the failure below).

Note that we're NOT using ubiformat; but, we don't use nandwrite either
(we flash_erase, then do an ubiattach + mount, then extract a root
filesystem image onto the mounted filesystem).  So I'm not sure the "Why
do I have to use ubiformat?" in the FAQ
(http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat)
applies in this case.

And, I'm not sure that it's an issue with sub-pages not being properly
supported, as appending "--vid-hdr-offset 2048" to ubiattach results in
the same failure.

Any ideas regarding what might be going on here?  Perhaps we really do
need to use ubiformat?  Or maybe the mtd_oobtest / mtd_nandbiterrs test
failures are masking a real issue with the MTD and/or i.MX28 gpmi nand
drivers or configuration?

thanks,
-mike


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    5.815240] UBI: scanning is finished
[    5.865519] UBI: attached mtd3 (name "rootfs", size 180 MiB) to ubi0
[    5.871925] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976
bytes
[    5.878877] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    5.885730] UBI: VID header offset: 2048 (aligned 2048), data offset:
4096
[    5.892644] UBI: good PEBs: 1440, bad PEBs: 0, corrupted PEBs: 0
[    5.898786] UBI: user volume: 2, internal volumes: 1, max. volumes
count: 128
[    5.906070] UBI: max/mean erase counter: 102/28, WL threshold: 4096,
image sequence number: 857856516
[    5.915434] UBI: available PEBs: 8, total reserved PEBs: 1432, PEBs
reserved for bad PEB handling: 40
[    5.924918] UBI: background thread "ubi_bgt0d" started, PID 40
[    5.931441] stmp3xxx-rtc 80056000.rtc: setting system clock to
1970-01-01 00:00:17 UTC (17)
[    6.100973] UBIFS: recovery needed
[    9.827117] UBIFS: recovery deferred
[    9.832000] UBIFS: mounted UBI device 0, volume 0, name "rootfs", R/O
mode
[    9.839091] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit
sizes: 2048 bytes/2048 bytes
[    9.848410] UBIFS: FS size: 171544576 bytes (163 MiB, 1351 LEBs),
journal size 8634368 bytes (8 MiB, 68 LEBs)
[    9.858476] UBIFS: reserved for root: 4952683 bytes (4836 KiB)
[    9.864358] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
6C7D782B-6835-4B1C-B1C1-8BCF6A099BCF, small LPT model
[    9.882415] VFS: Mounted root (ubifs filesystem) readonly on device
0:11.
[    9.899348] devtmpfs: mounted
[    9.903868] Freeing unused kernel memory: 256K (c057f000 - c05bf000)>
[   12.509524] udevd[64]: starting version 182
[   27.523366] UBIFS: completing deferred recovery
[   27.679203] UBIFS: background thread "ubifs_bgt0_0" started, PID 218
[   27.867104] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 126976 bytes from PEB 670:4096, read only 126976 bytes, retry
[   27.939522] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 126976 bytes from PEB 670:4096, read only 126976 bytes, retry
[   28.011381] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 126976 bytes from PEB 670:4096, read only 126976 bytes, retry
[   28.083325] UBI error: ubi_io_read: error -74 (ECC error) while reading
126976 bytes from PEB 670:4096, read 126976 bytes
[   28.094479] CPU: 0 PID: 217 Comm: mount Tainted: G         C
3.10.0-rc7 #1
[   28.101760] [<c0013dd4>] (unwind_backtrace+0x0/0xf0) from [<c0011b4c>]
(show_stack+0x10/0x14)
[   28.110505] [<c0011b4c>] (show_stack+0x10/0x14) from [<c028cee4>]
(ubi_io_read+0xfc/0x2c0)
[   28.118986] [<c028cee4>] (ubi_io_read+0xfc/0x2c0) from [<c028a47c>]
(ubi_eba_read_leb+0x190/0x424)
[   28.128155] [<c028a47c>] (ubi_eba_read_leb+0x190/0x424) from
[<c0289974>] (ubi_leb_read+0xac/0x120)
[   28.137429] [<c0289974>] (ubi_leb_read+0xac/0x120) from [<c01bd804>]
(ubifs_leb_read+0x28/0x8c)
[   28.146345] [<c01bd804>] (ubifs_leb_read+0x28/0x8c) from [<c01c537c>]
(ubifs_start_scan+0x74/0xec)
[   28.155512] [<c01c537c>] (ubifs_start_scan+0x74/0xec) from [<c01c56a4>]
(ubifs_scan+0x28/0x37c)
[   28.164293] [<c01c56a4>] (ubifs_scan+0x28/0x37c) from [<c01cf484>]
(ubifs_tnc_start_commit+0x604/0xa20)
[   28.173896] [<c01cf484>] (ubifs_tnc_start_commit+0x604/0xa20) from
[<c01c8c7c>] (do_commit+0x144/0x864)
[   28.183500] [<c01c8c7c>] (do_commit+0x144/0x864) from [<c01d79c0>]
(ubifs_rcvry_gc_commit+0x70/0x1dc)
[   28.192923] [<c01d79c0>] (ubifs_rcvry_gc_commit+0x70/0x1dc) from
[<c01b94a4>] (ubifs_remount_fs+0x238/0x790)
[   28.202956] [<c01b94a4>] (ubifs_remount_fs+0x238/0x790) from
[<c00ce554>] (do_remount_sb+0x9c/0x15c)
[   28.212358] [<c00ce554>] (do_remount_sb+0x9c/0x15c) from [<c00e7804>]
(do_mount+0x554/0x818)
[   28.220998] [<c00e7804>] (do_mount+0x554/0x818) from [<c00e7b4c>]
(SyS_mount+0x84/0xb8)
[   28.229208] [<c00e7b4c>] (SyS_mount+0x84/0xb8) from [<c000edc0>]
(ret_fast_syscall+0x0/0x44)
[   28.240863] UBIFS error (pid 217): ubifs_scan: corrupt empty space at
LEB 562:125583
[   28.248835] UBIFS error (pid 217): ubifs_scanned_corruption: corruption
at LEB 562:125583
[   28.257193] UBIFS error (pid 217): ubifs_scanned_corruption: first 1393
bytes from LEB 562:125583
[   28.266307] 00000000: ffffffbf ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.266429] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.266533] 00000040: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.266636] 00000060: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.266737] 00000080: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.266835] 000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.266933] 000000c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267032] 000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267131] 00000100: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267229] 00000120: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267328] 00000140: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267430] 00000160: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267527] 00000180: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267625] 000001a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267724] 000001c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267822] 000001e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.267919] 00000200: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268018] 00000220: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268117] 00000240: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268215] 00000260: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268315] 00000280: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268413] 000002a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268513] 000002c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268611] 000002e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268710] 00000300: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268810] 00000320: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.268908] 00000340: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269007] 00000360: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269106] 00000380: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269202] 000003a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269298] 000003c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269395] 000003e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269495] 00000400: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269590] 00000420: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269687] 00000440: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269783] 00000460: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269881] 00000480: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.269977] 000004a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.270074] 000004c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.270174] 000004e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.270273] 00000500: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.270371] 00000520: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.270471] 00000540: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[   28.270514] 00000560: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff                                   .................
[   28.270549] UBIFS error (pid 217): ubifs_scan: LEB 562 scanning failed
[   28.280651] UBIFS error (pid 217): do_commit: commit failed, error -117
[   28.287873] UBIFS warning (pid 217): ubifs_ro_mode: switched to
read-only mode, error -117
[   28.296360] CPU: 0 PID: 217 Comm: mount Tainted: G         C
3.10.0-rc7 #1
[   28.303512] [<c0013dd4>] (unwind_backtrace+0x0/0xf0) from [<c0011b4c>]
(show_stack+0x10/0x14)
[   28.312262] [<c0011b4c>] (show_stack+0x10/0x14) from [<c01c92d4>]
(do_commit+0x79c/0x864)
[   28.320646] [<c01c92d4>] (do_commit+0x79c/0x864) from [<c01d79c0>]
(ubifs_rcvry_gc_commit+0x70/0x1dc)
[   28.330126] [<c01d79c0>] (ubifs_rcvry_gc_commit+0x70/0x1dc) from
[<c01b94a4>] (ubifs_remount_fs+0x238/0x790)
[   28.340165] [<c01b94a4>] (ubifs_remount_fs+0x238/0x790) from
[<c00ce554>] (do_remount_sb+0x9c/0x15c)
[   28.349513] [<c00ce554>] (do_remount_sb+0x9c/0x15c) from [<c00e7804>]
(do_mount+0x554/0x818)
[   28.358162] [<c00e7804>] (do_mount+0x554/0x818) from [<c00e7b4c>]
(SyS_mount+0x84/0xb8)
[   28.366368] [<c00e7b4c>] (SyS_mount+0x84/0xb8) from [<c000edc0>]
(ret_fast_syscall+0x0/0x44)
[   28.375896] UBIFS: background thread "ubifs_bgt0_0" stops
[   28.754565] UBIFS: background thread "ubifs_bgt0_1" started, PID 227
[   28.879338] UBIFS: recovery needed
[   29.156390] UBIFS: recovery completed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
