Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUPRY-0000BX-BE
	for linux-mtd@lists.infradead.org; Mon, 11 Jan 2010 18:57:00 +0000
Received: by ewy23 with SMTP id 23so124656ewy.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Jan 2010 10:56:43 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
Date: Mon, 11 Jan 2010 13:56:42 -0500
Message-ID: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
Subject: Fail to mount ubifs
From: Jon Ringle <jon@ringle.org>
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

Hi,

I'm having problems with mounting ubifs. Flash is 32MB NOR (Intel
strata JS28F256P30T95).

Linux-2.6.31.11 with backport updates from
git://git.infradead.org/~dedekind/ubifs-v2.6.31.git

It fails to mount even if I truncate the volume with 'ubiupdatevol -t
/dev/ubi0_2'.

Thanks for your help.
Jon

$ grep _UBI kernelconfig-2.6.31
CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_RESERVE=1
CONFIG_MTD_UBI_GLUEBI=m
# CONFIG_MTD_UBI_DEBUG is not set
CONFIG_UBIFS_FS=m
# CONFIG_UBIFS_FS_XATTR is not set
# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
CONFIG_UBIFS_FS_DEBUG=y
CONFIG_UBIFS_FS_DEBUG_MSG_LVL=0
CONFIG_UBIFS_FS_DEBUG_CHKS=y

(initramfs) lsmod
Module                  Size  Used by
ubifs                 376300  0
gluebi                  6616  2
ixp4xx_eth             13972  0
pcimsg                  9144  0
ubi                    84092  3 ubifs,gluebi
ixp4xx                  3532  1
redboot                 4128  0
(initramfs) cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00080000 00020000 "RedBoot"
mtd1: 01f20000 00020000 "ubi"
mtd2: 00001000 00020000 "RedBoot config"
mtd3: 00020000 00020000 "FIS directory"
mtd4: 00352080 0001ff80 "kernel"
mtd5: 00d34000 0001ff80 "squashfs"
mtd6: 00dfc800 0001ff80 "ubifs"
(initramfs) ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:60
Present UBI devices:            ubi0

ubi0
Volumes count:                           3
Logical eraseblock size:                 130944 bytes, f KiB
Total amount of logical eraseblocks:     249 (32605056 bytes, f MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  0
Current maximum erase counter value:     65
Minimum input/output unit size:          1 byte
Character device major/minor:            253:0
Present volumes:                         0, 1, 2

Volume ID:   0 (on ubi0)
Type:        static
Alignment:   1
Size:        27 LEBs (3535488 bytes, f MiB)
Data bytes:  3481728 bytes (f MiB)
State:       OK
Name:        kernel
Character device major/minor: 253:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        static
Alignment:   1
Size:        106 LEBs (13880064 bytes, f MiB)
Data bytes:  13844480 bytes (f MiB)
State:       OK
Name:        squashfs
Character device major/minor: 253:2
-----------------------------------
Volume ID:   2 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        112 LEBs (14665728 bytes, f MiB)
State:       OK
Name:        ubifs
Character device major/minor: 253:3
(initramfs) mount -t ubifs ubi0:ubifs /mnt
[   49.510000] UBIFS DBG (pid 1495): ubifs_bg_thread: background
thread "ubifs_bgt0_2" started, PID 1495
[   49.590000] UBIFS: recovery needed
[   49.800000] UBIFS error (pid 1491): check_lpt_crc: invalid crc in
LPT node: crc cbcb calc cbfb
[   49.810000] [<c01822bc>] (unwind_backtrace+0x0/0x160) from
[<bf071a34>] (check_lpt_crc+0x9c/0xb0 [ubifs])
[   49.820000] [<bf071a34>] (check_lpt_crc+0x9c/0xb0 [ubifs]) from
[<bf071b24>] (unpack_pnode+0xdc/0xfc [ubifs])
[   49.830000] [<bf071b24>] (unpack_pnode+0xdc/0xfc [ubifs]) from
[<bf071d8c>] (scan_get_pnode+0x248/0x2ec [ubifs])
[   49.840000] [<bf071d8c>] (scan_get_pnode+0x248/0x2ec [ubifs]) from
[<bf072738>] (ubifs_lpt_scan_nolock+0x3f8/0x518 [ubifs])
[   49.850000] [<bf072738>] (ubifs_lpt_scan_nolock+0x3f8/0x518
[ubifs]) from [<bf0754b8>] (dbg_check_lprops+0xf8/0x2e4 [ubifs])
[   49.860000] [<bf0754b8>] (dbg_check_lprops+0xf8/0x2e4 [ubifs]) from
[<bf0654e4>] (do_commit+0x12c/0xa80 [ubifs])
[   49.870000] [<bf0654e4>] (do_commit+0x12c/0xa80 [ubifs]) from
[<bf0784dc>] (ubifs_rcvry_gc_commit+0x9c/0x718 [ubifs])
[   49.880000] [<bf0784dc>] (ubifs_rcvry_gc_commit+0x9c/0x718 [ubifs])
from [<bf051fec>] (mount_ubifs+0x69c/0x1620 [ubifs])
[   49.890000] [<bf051fec>] (mount_ubifs+0x69c/0x1620 [ubifs]) from
[<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
[   49.910000] [<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
from [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs])
[   49.920000] [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs]) from
[<c01f5360>] (vfs_kern_mount+0x68/0x12c)
[   49.930000] [<c01f5360>] (vfs_kern_mount+0x68/0x12c) from
[<c01f5468>] (do_kern_mount+0x34/0xdc)
[   49.940000] [<c01f5468>] (do_kern_mount+0x34/0xdc) from
[<c020dad0>] (do_mount+0x210/0x244)
[   49.940000] [<c020dad0>] (do_mount+0x210/0x244) from [<c020dba0>]
(sys_mount+0x9c/0xd0)
[   49.950000] [<c020dba0>] (sys_mount+0x9c/0xd0) from [<c017c9e0>]
(ret_fast_syscall+0x0/0x2c)
[   49.960000] UBIFS error (pid 1491): do_commit: commit failed, error -22
[   49.970000] UBIFS warning (pid 1491): ubifs_ro_mode: switched to
read-only mode, error -22
[   49.980000] [<c01822bc>] (unwind_backtrace+0x0/0x160) from
[<bf0654a8>] (do_commit+0xf0/0xa80 [ubifs])
[   49.990000] [<bf0654a8>] (do_commit+0xf0/0xa80 [ubifs]) from
[<bf0784dc>] (ubifs_rcvry_gc_commit+0x9c/0x718 [ubifs])
[   50.000000] [<bf0784dc>] (ubifs_rcvry_gc_commit+0x9c/0x718 [ubifs])
from [<bf051fec>] (mount_ubifs+0x69c/0x1620 [ubifs])
[   50.010000] [<bf051fec>] (mount_ubifs+0x69c/0x1620 [ubifs]) from
[<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
[   50.020000] [<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
from [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs])
[   50.030000] [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs]) from
[<c01f5360>] (vfs_kern_mount+0x68/0x12c)
[   50.040000] [<c01f5360>] (vfs_kern_mount+0x68/0x12c) from
[<c01f5468>] (do_kern_mount+0x34/0xdc)
[   50.050000] [<c01f5468>] (do_kern_mount+0x34/0xdc) from
[<c020dad0>] (do_mount+0x210/0x244)
[   50.060000] [<c020dad0>] (do_mount+0x210/0x244) from [<c020dba0>]
(sys_mount+0x9c/0xd0)
[   50.070000] [<c020dba0>] (sys_mount+0x9c/0xd0) from [<c017c9e0>]
(ret_fast_syscall+0x0/0x2c)
[   50.200000] UBIFS error (pid 1491): check_lpt_crc: invalid crc in
LPT node: crc cbcb calc cbfb
[   50.210000] [<c01822bc>] (unwind_backtrace+0x0/0x160) from
[<bf071a34>] (check_lpt_crc+0x9c/0xb0 [ubifs])
[   50.220000] [<bf071a34>] (check_lpt_crc+0x9c/0xb0 [ubifs]) from
[<bf071b24>] (unpack_pnode+0xdc/0xfc [ubifs])
[   50.230000] [<bf071b24>] (unpack_pnode+0xdc/0xfc [ubifs]) from
[<bf071d8c>] (scan_get_pnode+0x248/0x2ec [ubifs])
[   50.250000] [<bf071d8c>] (scan_get_pnode+0x248/0x2ec [ubifs]) from
[<bf072738>] (ubifs_lpt_scan_nolock+0x3f8/0x518 [ubifs])
[   50.260000] [<bf072738>] (ubifs_lpt_scan_nolock+0x3f8/0x518
[ubifs]) from [<bf0754b8>] (dbg_check_lprops+0xf8/0x2e4 [ubifs])
[   50.270000] [<bf0754b8>] (dbg_check_lprops+0xf8/0x2e4 [ubifs]) from
[<bf051ff4>] (mount_ubifs+0x6a4/0x1620 [ubifs])
[   50.280000] [<bf051ff4>] (mount_ubifs+0x6a4/0x1620 [ubifs]) from
[<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
[   50.290000] [<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
from [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs])
[   50.300000] [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs]) from
[<c01f5360>] (vfs_kern_mount+0x68/0x12c)
[   50.310000] [<c01f5360>] (vfs_kern_mount+0x68/0x12c) from
[<c01f5468>] (do_kern_mount+0x34/0xdc)
[   50.320000] [<c01f5468>] (do_kern_mount+0x34/0xdc) from
[<c020dad0>] (do_mount+0x210/0x244)
[   50.330000] [<c020dad0>] (do_mount+0x210/0x244) from [<c020dba0>]
(sys_mount+0x9c/0xd0)
[   50.340000] [<c020dba0>] (sys_mount+0x9c/0xd0) from [<c017c9e0>]
(ret_fast_syscall+0x0/0x2c)
[   50.350000] UBIFS DBG (pid 1495): ubifs_bg_thread: background
thread "ubifs_bgt0_2" stops
mount: Invalid argument
(initramfs) ubiupdatevol -t /dev/ubi0_2
(initramfs) mount -t ubifs ubi0:ubifs /mnt
[  115.910000] UBIFS: default file-system created
[  115.980000] UBIFS DBG (pid 1501): ubifs_bg_thread: background
thread "ubifs_bgt0_2" started, PID 1501
[  116.260000] UBIFS error (pid 1499): check_lpt_crc: invalid crc in
LPT node: crc cbcb calc cbfb
[  116.270000] [<c01822bc>] (unwind_backtrace+0x0/0x160) from
[<bf071a34>] (check_lpt_crc+0x9c/0xb0 [ubifs])
[  116.280000] [<bf071a34>] (check_lpt_crc+0x9c/0xb0 [ubifs]) from
[<bf071b24>] (unpack_pnode+0xdc/0xfc [ubifs])
[  116.290000] [<bf071b24>] (unpack_pnode+0xdc/0xfc [ubifs]) from
[<bf071d8c>] (scan_get_pnode+0x248/0x2ec [ubifs])
[  116.300000] [<bf071d8c>] (scan_get_pnode+0x248/0x2ec [ubifs]) from
[<bf072738>] (ubifs_lpt_scan_nolock+0x3f8/0x518 [ubifs])
[  116.310000] [<bf072738>] (ubifs_lpt_scan_nolock+0x3f8/0x518
[ubifs]) from [<bf0754b8>] (dbg_check_lprops+0xf8/0x2e4 [ubifs])
[  116.320000] [<bf0754b8>] (dbg_check_lprops+0xf8/0x2e4 [ubifs]) from
[<bf051ff4>] (mount_ubifs+0x6a4/0x1620 [ubifs])
[  116.340000] [<bf051ff4>] (mount_ubifs+0x6a4/0x1620 [ubifs]) from
[<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
[  116.350000] [<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
from [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs])
[  116.360000] [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs]) from
[<c01f5360>] (vfs_kern_mount+0x68/0x12c)
[  116.370000] [<c01f5360>] (vfs_kern_mount+0x68/0x12c) from
[<c01f5468>] (do_kern_mount+0x34/0xdc)
[  116.380000] [<c01f5468>] (do_kern_mount+0x34/0xdc) from
[<c020dad0>] (do_mount+0x210/0x244)
[  116.380000] [<c020dad0>] (do_mount+0x210/0x244) from [<c020dba0>]
(sys_mount+0x9c/0xd0)
[  116.390000] [<c020dba0>] (sys_mount+0x9c/0xd0) from [<c017c9e0>]
(ret_fast_syscall+0x0/0x2c)
[  116.400000] UBIFS DBG (pid 1501): ubifs_bg_thread: background
thread "ubifs_bgt0_2" stops
mount: Invalid argument
