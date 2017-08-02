Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcuIj-0000qq-O7
 for linux-mtd@lists.infradead.org; Wed, 02 Aug 2017 14:07:07 +0000
Date: Wed, 2 Aug 2017 16:06:42 +0200
From: Oleksij Rempel <ore@pengutronix.de>
To: kernel@pengutronix.de
Cc: richard@nod.at, linux-mtd@lists.infradead.org
Subject: Re: "UBIFS error (pid 396): dbg_check_space_info: free space changed
 from" + ecryptfs
Message-ID: <20170802140642.kpsdh3jfow2azevm@pengutronix.de>
References: <dbc5bc9f-6c38-a0c3-e776-050a70382814@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbc5bc9f-6c38-a0c3-e776-050a70382814@rempel-privat.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hallo all,

Initial issue was detected on kernel 4.0.9 and is still reproducible
with same kernel version + most of back ported ubi/ubifs patches till
the kernel v4.12. UBIfs encryption patches was not backported.

To reproduce it I needed:
- system with fresh flashed ubi image.
- on first start it should run following script:
> mount -o remount,rw /
> mount -t ecryptfs ... /dst
> ... do some work and mv some files to /dst
> umount /dst
> mount -o remount,ro / <--  UBIFS error (pid 396): dbg_check_space_info:

UBIFS: background thread "ubifs_bgt0_0" stops
UBIFS error (pid 396): dbg_check_space_info: free space changed from 36950545 to 36950885
UBIFS: saved lprops statistics dump
(pid 396) Lprops statistics: empty_lebs 350, idx_lebs  15
 taken_empty_lebs 1, total_free 44818072, total_dirty 491616
 total_used 77161336, total_dark 2549512, total_dead 373528
UBIFS: saved budgeting info dump
(pid 396) Budgeting info: data budget sum 360, total budget sum 360
 budg_data_growth 0, budg_dd_growth 360, budg_idx_growth 0
 min_idx_lebs 45, old_idx_sz 1839552, uncommitted_idx 0
 page_budget 4144, inode_budget 160, dent_budget 312
 nospace 0, nospace_rp 0
 dark_wm 6144, dead_wm 2048, max_idx_node_sz 192
UBIFS: saved idx_gc_cnt 0
UBIFS: current lprops statistics dump
(pid 396) Lprops statistics: empty_lebs 350, idx_lebs  15
 taken_empty_lebs 1, total_free 44816384, total_dirty 494184
 total_used 77160648, total_dark 2549512, total_dead 374216
UBIFS: current budgeting info dump
(pid 396) Budgeting info: data budget sum 0, total budget sum 0
 budg_data_growth 0, budg_dd_growth 0, budg_idx_growth 0
 min_idx_lebs 45, old_idx_sz 1839552, uncommitted_idx 0
 page_budget 4144, inode_budget 160, dent_budget 312
 nospace 0, nospace_rp 0
 dark_wm 6144, dead_wm 2048, max_idx_node_sz 192
 freeable_cnt 0, calc_idx_sz 1838288, idx_gc_cnt 0
 dirty_pg_cnt 0, dirty_zn_cnt 7, clean_zn_cnt 1051
 gc_lnum 625, ihead_lnum 640
 jhead 0 (GC)  LEB -1
 jhead 1 (base)   LEB 624
 jhead 2 (data)    LEB -1
 bud LEB 624
 commit state 0
Budgeting predictions:
    available: 38003304, outstanding 0, free 36950885
CPU: 0 PID: 396 Comm: mount Tainted: G           O    4.0.9-20161125-1 #2
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
Backtrace:
[<c0012020>] (dump_backtrace) from [<c0012244>] (show_stack+0x18/0x1c)
r6:0233d365 r5:c0753da4 r4:00000000 r3:00000000
[<c001222c>] (show_stack) from [<c0569064>] (dump_stack+0x90/0xa0)
[<c0568fd4>] (dump_stack) from [<c01a94a8>] (dbg_check_space_info+0x12c/0x138)
r5:00000000 r4:ce790000
[<c01a937c>] (dbg_check_space_info) from [<c0181c80>] (ubifs_remount_fs+0x288/0x6ec)
r10:00000000 r9:ce790898 r8:cdee5564 r7:00000003 r6:000001e0 r5:00000000
r4:ce790000
[<c01819f8>] (ubifs_remount_fs) from [<c00f4220>] (do_remount_sb+0x6c/0x1cc)
r9:cdefac00 r8:00000000 r7:00000000 r6:00000001 r5:00000000 r4:cdefac00
[<c00f41b4>] (do_remount_sb) from [<c01117fc>] (do_mount+0x7c8/0xc1c)
r8:00800021 r7:cdefac40 r6:cdee83d0 r5:00000048 r4:00000000
[<c0111034>] (do_mount) from [<c0111fc0>] (SyS_mount+0x7c/0xa8)
r10:00000000 r9:cdaec000 r8:015a2d80 r7:00800421 r6:00000000 r5:cdb69240
r4:cdb69200
[<c0111f44>] (SyS_mount) from [<c000e980>] (ret_fast_syscall+0x0/0x3c)
r8:c000eb24 r7:00000015 r6:00000000 r5:00000000 r4:00000000
UBIFS warning (pid 396): ubifs_ro_mode: switched to read-only mode, error -22
CPU: 0 PID: 396 Comm: mount Tainted: G           O    4.0.9-20161125-1 #2
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
Backtrace:
[<c0012020>] (dump_backtrace) from [<c0012244>] (show_stack+0x18/0x1c)
r6:00000010 r5:c0753da4 r4:00000000 r3:00000000
[<c001222c>] (show_stack) from [<c0569064>] (dump_stack+0x90/0xa0)
[<c0568fd4>] (dump_stack) from [<c01853a8>] (ubifs_ro_mode.part.6+0x68/0x6c)
r5:cdefac00 r4:00000006
[<c0185340>] (ubifs_ro_mode.part.6) from [<c01854c8>] (ubifs_ro_mode+0x1c/0x20)
r6:000001e0 r5:00000000 r4:ce790000 r3:00000002
[<c01854ac>] (ubifs_ro_mode) from [<c0181c90>] (ubifs_remount_fs+0x298/0x6ec)
[<c01819f8>] (ubifs_remount_fs) from [<c00f4220>] (do_remount_sb+0x6c/0x1cc)
r9:cdefac00 r8:00000000 r7:00000000 r6:00000001 r5:00000000 r4:cdefac00
[<c00f41b4>] (do_remount_sb) from [<c01117fc>] (do_mount+0x7c8/0xc1c)
r8:00800021 r7:cdefac40 r6:cdee83d0 r5:00000048 r4:00000000
[<c0111034>] (do_mount) from [<c0111fc0>] (SyS_mount+0x7c/0xa8)
r10:00000000 r9:cdaec000 r8:015a2d80 r7:00800421 r6:00000000 r5:cdb69240
r4:cdb69200
[<c0111f44>] (SyS_mount) from [<c000e980>] (ret_fast_syscall+0x0/0x3c)
r8:c000eb24 r7:00000015 r6:00000000 r5:00000000 r4:00000000

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
