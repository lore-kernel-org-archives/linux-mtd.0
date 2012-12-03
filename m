Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfXGc-0003YS-5a
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 14:45:07 +0000
Message-ID: <1354545960.11583.17.camel@sauron.fi.intel.com>
Subject: Re: UBI wl_tree_add problems after PEB scrubbed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zach Sadecki <zsadecki@itwatchdogs.com>, Richard Weinberger
 <richard@nod.at>
Date: Mon, 03 Dec 2012 16:46:00 +0200
In-Reply-To: <50B8CB36.3010604@itwatchdogs.com>
References: <50B8CB36.3010604@itwatchdogs.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4PnytCpohpCNGf0vofSM"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4PnytCpohpCNGf0vofSM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

/me looks at Richard...

OK, I confirm that this is fastmap to blame. Namely, this commit:

Author: Richard Weinberger <richard@nod.at>
Date:   Wed Sep 26 17:51:48 2012 +0200

    UBI: Add fastmap support to the WL sub-system
   =20
    To make fastmap possible the WL sub-system needs some
    changes.
    Mostly to support fastmaps pools.
   =20
    Signed-off-by: Richard Weinberger <richard@nod.at>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

If you revert it, bit-flips are handled properly.

Use the following for a time being:

$ git revert 76ac66e dbb7d2a 8199b90

On Fri, 2012-11-30 at 09:05 -0600, Zach Sadecki wrote:
> Every time I see UBI scrub a PEB with fixable bit-flips (on my custom=20
> Freescale i.MX28 board) the background thread has problems shortly=20
> thereafter.  I'm not exactly sure where to start debugging this and I'm=
=20
> hoping someone can help point me in the right direction.  Below are=20
> kernel messages showing the problem from 2 different runs (in which both=
=20
> ended up with a hung CPU).  This is using kernel 3.7-rc7.
>=20
> Also worth noting is that I had to modify the gpmi-nand driver to=20
> actually report max_bitflips back to the MTD layer to even get to this=
=20
> point (before that everything would just run along happily until it hit=
=20
> an uncorrectable ECC error).  I will submit a patch for this once=20
> everything seems OK...
>=20
> Kernel messages:
> [18444.860000] UBI: fixable bit-flip detected at PEB 2789
> [18444.870000] UBI: schedule PEB 2789 for scrubbing
> [18444.960000] UBI: fixable bit-flip detected at PEB 2789
> [18445.120000] UBI: scrubbed PEB 2789 (LEB 3:544), data moved to PEB 1574
> [18457.040000] UBI assert failed in wl_tree_add at 204 (pid 31)
> [18457.040000] [<c000d8fc>] (unwind_backtrace+0x0/0xf4) from=20
> [<c0279758>] (wl_tree_add+0xb8/0xd0)
> [18457.050000] [<c0279758>] (wl_tree_add+0xb8/0xd0) from [<c027a008>]=20
> (erase_worker+0x3bc/0x6c0)
> [18457.060000] [<c027a008>] (erase_worker+0x3bc/0x6c0) from [<c027961c>]=
=20
> (do_work+0x8c/0x110)
> [18457.070000] [<c027961c>] (do_work+0x8c/0x110) from [<c027adf4>]=20
> (ubi_thread+0xc4/0x148)
> [18457.080000] [<c027adf4>] (ubi_thread+0xc4/0x148) from [<c00370c8>]=20
> (kthread+0xa0/0xac)
> [18457.090000] [<c00370c8>] (kthread+0xa0/0xac) from [<c00092e8>]=20
> (ret_from_fork+0x14/0x2c)
> [21386.860000] UBI: fixable bit-flip detected at PEB 2467
> [21386.870000] UBI: schedule PEB 2467 for scrubbing
> [21387.000000] UBI: fixable bit-flip detected at PEB 2467
> [21387.190000] UBI: scrubbed PEB 2467 (LEB 3:490), data moved to PEB 1574
> [21400.920000] UBI assert failed in wl_tree_add at 204 (pid 31)
> [21400.920000] [<c000d8fc>] (unwind_backtrace+0x0/0xf4) from=20
> [<c0279758>] (wl_tree_add+0xb8/0xd0)
> [21400.930000] [<c0279758>] (wl_tree_add+0xb8/0xd0) from [<c027a008>]=20
> (erase_worker+0x3bc/0x6c0)
> [21400.940000] [<c027a008>] (erase_worker+0x3bc/0x6c0) from [<c027961c>]=
=20
> (do_work+0x8c/0x110)
> [21400.950000] [<c027961c>] (do_work+0x8c/0x110) from [<c027adf4>]=20
> (ubi_thread+0xc4/0x148)
> [21400.960000] [<c027adf4>] (ubi_thread+0xc4/0x148) from [<c00370c8>]=20
> (kthread+0xa0/0xac)
> [21400.970000] [<c00370c8>] (kthread+0xa0/0xac) from [<c00092e8>]=20
> (ret_from_fork+0x14/0x2c)
> [26168.070000] BUG: soft lockup - CPU#0 stuck for 22s! [ubi_bgt0d:31]
> [26168.070000] irq event stamp: 27382734
> [26168.070000] hardirqs last  enabled at (27382733): [<c0008e88>]=20
> __irq_svc+0x48/0x54
> [26168.070000] hardirqs last disabled at (27382734): [<c0008e74>]=20
> __irq_svc+0x34/0x54
> [26168.070000] softirqs last  enabled at (27382732): [<c001ea48>]=20
> __do_softirq+0x1ac/0x22c
> [26168.070000] softirqs last disabled at (27382725): [<c001ebb0>]=20
> irq_exit+0x84/0x94
> [26168.070000]
> [26168.070000] Pid: 31, comm:            ubi_bgt0d
> [26168.070000] CPU: 0    Not tainted  (3.7.0-rc7-itw #15)
> [26168.070000] PC is at wl_tree_add+0x44/0xd0
> [26168.070000] LR is at erase_worker+0x3bc/0x6c0
> [26168.070000] pc : [<c02796e4>]    lr : [<c027a008>] psr: 80000013
> [26168.070000] sp : c76d9e90  ip : c08ea20c  fp : c763add8
> [26168.070000] r10: 00000000  r9 : 00000043  r8 : c763ad78
> [26168.070000] r7 : c76d8000  r6 : c77073c0  r5 : c7707410  r4 : c7707408
> [26168.070000] r3 : 00000046  r2 : 00000044  r1 : c7707348  r0 : c77073c0
> [26168.070000] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM=20
> Segment kernel
> [26168.070000] Control: 0005317f  Table: 460a0000  DAC: 00000017
> [26168.070000] [<c000d8fc>] (unwind_backtrace+0x0/0xf4) from=20
> [<c005fc94>] (watchdog_timer_fn+0x15c/0x1b0)
> [26168.070000] [<c005fc94>] (watchdog_timer_fn+0x15c/0x1b0) from=20
> [<c003b24c>] (__run_hrtimer+0xd8/0x1e8)
> [26168.070000] [<c003b24c>] (__run_hrtimer+0xd8/0x1e8) from [<c003b724>]=
=20
> (hrtimer_interrupt+0x104/0x348)
> [26168.070000] [<c003b724>] (hrtimer_interrupt+0x104/0x348) from=20
> [<c0013390>] (mxs_timer_interrupt+0x20/0x30)
> [26168.070000] [<c0013390>] (mxs_timer_interrupt+0x20/0x30) from=20
> [<c00603e4>] (handle_irq_event_percpu+0x70/0x24c)
> [26168.070000] [<c00603e4>] (handle_irq_event_percpu+0x70/0x24c) from=20
> [<c00605fc>] (handle_irq_event+0x3c/0x5c)
> [26168.070000] [<c00605fc>] (handle_irq_event+0x3c/0x5c) from=20
> [<c0062d70>] (handle_level_irq+0x90/0x120)
> [26168.070000] [<c0062d70>] (handle_level_irq+0x90/0x120) from=20
> [<c0060360>] (generic_handle_irq+0x30/0x3c)
> [26168.070000] [<c0060360>] (generic_handle_irq+0x30/0x3c) from=20
> [<c0009abc>] (handle_IRQ+0x30/0x84)
> [26168.070000] [<c0009abc>] (handle_IRQ+0x30/0x84) from [<c0008760>]=20
> (icoll_handle_irq+0x34/0x48)
> [26168.070000] [<c0008760>] (icoll_handle_irq+0x34/0x48) from=20
> [<c0008e84>] (__irq_svc+0x44/0x54)
> [26168.070000] Exception stack(0xc76d9e48 to 0xc76d9e90)
> [26168.070000] 9e40:                   c77073c0 c7707348 00000044=20
> 00000046 c7707408 c7707410
> [26168.070000] 9e60: c77073c0 c76d8000 c763ad78 00000043 00000000=20
> c763add8 c08ea20c c76d9e90
> [26168.070000] 9e80: c027a008 c02796e4 80000013 ffffffff
> [26168.070000] [<c0008e84>] (__irq_svc+0x44/0x54) from [<c02796e4>]=20
> (wl_tree_add+0x44/0xd0)
> [26168.070000] [<c02796e4>] (wl_tree_add+0x44/0xd0) from [<c027a008>]=20
> (erase_worker+0x3bc/0x6c0)
> [26168.070000] [<c027a008>] (erase_worker+0x3bc/0x6c0) from [<c027961c>]=
=20
> (do_work+0x8c/0x110)
> [26168.070000] [<c027961c>] (do_work+0x8c/0x110) from [<c027adf4>]=20
> (ubi_thread+0xc4/0x148)
> [26168.070000] [<c027adf4>] (ubi_thread+0xc4/0x148) from [<c00370c8>]=20
> (kthread+0xa0/0xac)
> [26168.070000] [<c00370c8>] (kthread+0xa0/0xac) from [<c00092e8>]=20
> (ret_from_fork+0x14/0x2c)
>=20
>=20
>=20
> [13111.940000] UBI: fixable bit-flip detected at PEB 2822
> [13111.940000] UBI: schedule PEB 2822 for scrubbing
> [13112.030000] UBI: fixable bit-flip detected at PEB 2822
> [13112.200000] UBI: scrubbed PEB 2822 (LEB 3:634), data moved to PEB 2766
> [13124.260000] UBI assert failed in wl_tree_add at 204 (pid 31)
> [13124.270000] [<c000d8fc>] (unwind_backtrace+0x0/0xf4) from=20
> [<c027974c>] (wl_tree_add+0xb8/0xd0)
> [13124.280000] [<c027974c>] (wl_tree_add+0xb8/0xd0) from [<c0279ffc>]=20
> (erase_worker+0x3bc/0x6c0)
> [13124.290000] [<c0279ffc>] (erase_worker+0x3bc/0x6c0) from [<c0279610>]=
=20
> (do_work+0x8c/0x110)
> [13124.300000] [<c0279610>] (do_work+0x8c/0x110) from [<c027ade8>]=20
> (ubi_thread+0xc4/0x148)
> [13124.300000] [<c027ade8>] (ubi_thread+0xc4/0x148) from [<c00370c8>]=20
> (kthread+0xa0/0xac)
> [13124.310000] [<c00370c8>] (kthread+0xa0/0xac) from [<c00092e8>]=20
> (ret_from_fork+0x14/0x2c)
> [13361.320000] Unable to handle kernel NULL pointer dereference at=20
> virtual address 00000000
> [13361.330000] pgd =3D c5c64000
> [13361.330000] [00000000] *pgd=3D45c4f831, *pte=3D00000000, *ppte=3D00000=
000
> [13361.340000] Internal error: Oops: 817 [#1] ARM
> [13361.340000] CPU: 0    Not tainted  (3.7.0-rc7-itw #12)
> [13361.340000] PC is at prot_queue_del+0x7c/0xcc
> [13361.340000] LR is at ubi_wl_put_peb+0x1d8/0x2d8
> [13361.340000] pc : [<c0279070>]    lr : [<c027ac24>] psr: 60000013
> [13361.340000] sp : c6f07cd0  ip : c7720228  fp : 00000265
> [13361.340000] r10: 00000f75  r9 : 00000003  r8 : c763add8
> [13361.340000] r7 : c763ad70  r6 : c763a000  r5 : c7720228  r4 : c763ad74
> [13361.340000] r3 : 00200200  r2 : c77202b9  r1 : 00000000  r0 : c763a000
> [13361.340000] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM=20
> Segment user
> [13361.340000] Control: 0005317f  Table: 45c64000  DAC: 00000015
> [13361.340000] Process sqlite3 (pid: 6567, stack limit =3D 0xc6f061b8)
> [13361.340000] Stack: (0xc6f07cd0 to 0xc6f08000)
> [13361.340000] 7cc0:                                     c763ad74=20
> c027ac24 00000000 c0056088
> [13361.340000] 7ce0: 00000000 c763acc4 c76cfc00 00000000 c763a000=20
> 00000003 00000f75 00000265
> [13361.340000] 7d00: 00000000 c0275a94 00000000 c03cf0c8 c6f07dc0=20
> c6e65000 00000265 c6e65000
> [13361.340000] 7d20: c6cd6000 c6f07dc0 00000800 c019b45c c6f07dc0=20
> 00000000 c6f07dc0 00000000
> [13361.340000] 7d40: c6e65000 c01a779c 00000000 00000000 00000000=20
> 00000000 c6e65b20 00000001
> [13361.340000] 7d60: c6cd6000 00000265 c6e652f4 c6e652f4 c6e65000=20
> c6cd6108 c6cd6000 00000000
> [13361.340000] 7d80: 000001b5 c6e65000 00009000 c6cd6000 c6f07dc0=20
> 00000800 00000000 c01a7e30
> [13361.340000] 7da0: c01ab440 00000007 00000000 c6f06000 c6c76180=20
> c6f06000 c6cd6024 c6e65a80
> [13361.340000] 7dc0: 00000000 0001f000 00000010 00000265 c5c09ca8=20
> c6e65bd0 c6cd612c ffffffe4
> [13361.340000] 7de0: 000001b5 00000000 c6cd6108 00000000 c6cd612c=20
> c6e65000 00000001 c018df00
> [13361.340000] 7e00: c725bb20 00000003 00000060 00000004 00000080=20
> c6f06000 00000188 c6e652b4
> [13361.340000] 7e20: 00000000 00000000 00000108 00000001 c725d020=20
> c00bc1d4 00000002 00000000
> [13361.340000] 7e40: c725d020 c6d82400 c6e65000 c72f3b20 c72f40c0=20
> c725d020 000000a0 c018ffd8
> [13361.340000] 7e60: c6c76180 60000013 c72f3d38 c6f06000 00000188=20
> 00000047 000000a0 00000048
> [13361.340000] 7e80: 00000000 00000001 22222222 c72f3d5c 22222222=20
> 22222222 22222222 22222222
> [13361.340000] 7ea0: c725d020 00000000 c725d020 c72f3b20 c72f40a8=20
> c6e65000 c6f07edc 00000048
> [13361.340000] 7ec0: 00000000 c0193ffc 00000001 00000000 00000001=20
> 00000001 c00ccad0 00200020
> [13361.340000] 7ee0: 00000000 00000000 00000000 00000278 22222222=20
> 22222222 00000000 c725d020
> [13361.340000] 7f00: 00000000 c72f40a8 c6f07f38 c72f3b20 c6f06000=20
> 00000000 00000001 c00ccb04
> [13361.340000] 7f20: c6f07f38 000093c4 00000000 c6f3a000 c72f40a8=20
> c00ce958 c740ee70 c715cc78
> [13361.340000] 7f40: 0febbc64 0000000e c6f3a01d 00000000 00000000=20
> c7138d20 c725d020 00000000
> [13361.340000] 7f60: 00000002 00000000 00000000 60000010 00000000=20
> 00000000 00000001 c0056088
> [13361.340000] 7f80: c6f06000 0051da2c 00000000 0051d418 0051da2c=20
> 00000000 0051d418 0000000a
> [13361.340000] 7fa0: c00093c4 c0009240 0051da2c 00000000 0051da2c=20
> 0051da2c 00000000 b6f2576c
> [13361.340000] 7fc0: 0051da2c 00000000 0051d418 0000000a b6f24b24=20
> 00000000 00000000 00000001
> [13361.340000] 7fe0: 00000000 bec32f28 b6ed9064 b6deb62c 60000010=20
> 0051da2c 00000000 00000000
> [13361.340000] [<c0279070>] (prot_queue_del+0x7c/0xcc) from [<c027ac24>]=
=20
> (ubi_wl_put_peb+0x1d8/0x2d8)
> [13361.340000] [<c027ac24>] (ubi_wl_put_peb+0x1d8/0x2d8) from=20
> [<c0275a94>] (ubi_eba_unmap_leb+0x90/0xa8)
> [13361.340000] [<c0275a94>] (ubi_eba_unmap_leb+0x90/0xa8) from=20
> [<c019b45c>] (ubifs_leb_unmap+0x78/0xf4)
> [13361.340000] [<c019b45c>] (ubifs_leb_unmap+0x78/0xf4) from=20
> [<c01a779c>] (ubifs_garbage_collect_leb+0x23c/0x7b0)
> [13361.340000] [<c01a779c>] (ubifs_garbage_collect_leb+0x23c/0x7b0) from=
=20
> [<c01a7e30>] (ubifs_garbage_collect+0x120/0x3b8)
> [13361.340000] [<c01a7e30>] (ubifs_garbage_collect+0x120/0x3b8) from=20
> [<c018df00>] (make_reservation+0x110/0x428)
> [13361.340000] [<c018df00>] (make_reservation+0x110/0x428) from=20
> [<c018ffd8>] (ubifs_jnl_update+0x120/0x640)
> [13361.340000] [<c018ffd8>] (ubifs_jnl_update+0x120/0x640) from=20
> [<c0193ffc>] (ubifs_unlink+0x168/0x260)
> [13361.340000] [<c0193ffc>] (ubifs_unlink+0x168/0x260) from [<c00ccb04>]=
=20
> (vfs_unlink+0x84/0xfc)
> [13361.340000] [<c00ccb04>] (vfs_unlink+0x84/0xfc) from [<c00ce958>]=20
> (do_unlinkat+0xd4/0x160)
> [13361.340000] [<c00ce958>] (do_unlinkat+0xd4/0x160) from [<c0009240>]=
=20
> (ret_fast_syscall+0x0/0x38)
> [13361.340000] Code: e59c2000 e59c1004 e59f3040 e5821004 (e5812000)
> [13361.740000] ---[ end trace 8fb6e4d7822cc150 ]---
> [57160.070000] BUG: soft lockup - CPU#0 stuck for 22s! [init:1]
> [57160.070000] irq event stamp: 1311500
> [57160.070000] hardirqs last  enabled at (1311499): [<c00654d8>]=20
> rcu_sched_qs+0x8c/0xc8
> [57160.070000] hardirqs last disabled at (1311500): [<c03d15ec>]=20
> _raw_spin_lock_irq+0x24/0x54
> [57160.070000] softirqs last  enabled at (1311474): [<c001ea48>]=20
> __do_softirq+0x1ac/0x22c
> [57160.070000] softirqs last disabled at (1311465): [<c001ebb0>]=20
> irq_exit+0x84/0x94
> [57160.070000]
> [57160.070000] Pid: 1, comm:                 init
> [57160.070000] CPU: 0    Tainted: G      D       (3.7.0-rc7-itw #12)
> [57160.070000] PC is at wait_consider_task+0x4/0xb14
> [57160.070000] LR is at do_wait+0x104/0x200
> [57160.070000] pc : [<c001ac78>]    lr : [<c001b88c>] psr: 20000013
> [57160.070000] sp : c7439f0c  ip : 00000005  fp : c7439f78
> [57160.070000] r10: c7438000  r9 : c7439f34  r8 : c7430000
> [57160.070000] r7 : c7439f60  r6 : c74300dc  r5 : 00000000  r4 : c6c728a0
> [57160.070000] r3 : c6c72984  r2 : c6c728a0  r1 : 00000000  r0 : c7439f60
> [57160.070000] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM=20
> Segment user
> [57160.070000] Control: 0005317f  Table: 4779c000  DAC: 00000015
> [57160.070000] [<c000d8fc>] (unwind_backtrace+0x0/0xf4) from=20
> [<c005fc94>] (watchdog_timer_fn+0x15c/0x1b0)
> [57160.070000] [<c005fc94>] (watchdog_timer_fn+0x15c/0x1b0) from=20
> [<c003b24c>] (__run_hrtimer+0xd8/0x1e8)
> [57160.070000] [<c003b24c>] (__run_hrtimer+0xd8/0x1e8) from [<c003b724>]=
=20
> (hrtimer_interrupt+0x104/0x348)
> [57160.070000] [<c003b724>] (hrtimer_interrupt+0x104/0x348) from=20
> [<c0013390>] (mxs_timer_interrupt+0x20/0x30)
> [57160.070000] [<c0013390>] (mxs_timer_interrupt+0x20/0x30) from=20
> [<c00603e4>] (handle_irq_event_percpu+0x70/0x24c)
> [57160.070000] [<c00603e4>] (handle_irq_event_percpu+0x70/0x24c) from=20
> [<c00605fc>] (handle_irq_event+0x3c/0x5c)
> [57160.070000] [<c00605fc>] (handle_irq_event+0x3c/0x5c) from=20
> [<c0062d70>] (handle_level_irq+0x90/0x120)
> [57160.070000] [<c0062d70>] (handle_level_irq+0x90/0x120) from=20
> [<c0060360>] (generic_handle_irq+0x30/0x3c)
> [57160.070000] [<c0060360>] (generic_handle_irq+0x30/0x3c) from=20
> [<c0009abc>] (handle_IRQ+0x30/0x84)
> [57160.070000] [<c0009abc>] (handle_IRQ+0x30/0x84) from [<c0008760>]=20
> (icoll_handle_irq+0x34/0x48)
> [57160.070000] [<c0008760>] (icoll_handle_irq+0x34/0x48) from=20
> [<c0008e84>] (__irq_svc+0x44/0x54)
> [57160.070000] Exception stack(0xc7439ec0 to 0xc7439f08)
> [57160.070000] 9ec0: c7439f60 00000000 c6c728a0 c6c72984 c6c728a0=20
> 00000000 c74300dc c7439f60
> [57160.070000] 9ee0: c7430000 c7439f34 c7438000 c7439f78 00000005=20
> c7439f0c c001b88c c001ac78
> [57160.070000] 9f00: 20000013 ffffffff
> [57160.070000] [<c0008e84>] (__irq_svc+0x44/0x54) from [<c001ac78>]=20
> (wait_consider_task+0x4/0xb14)
> [57160.070000] [<c001ac78>] (wait_consider_task+0x4/0xb14) from=20
> [<c7438000>] (0xc7438000)
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Best Regards,
Artem Bityutskiy

--=-4PnytCpohpCNGf0vofSM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvLsoAAoJECmIfjd9wqK0OMkQAJQUDO9qoNowYCbNRyWndJMc
sMWCHWMYdS+lLj7DOCO2IT7/UKzVmNk9eOGGx4qYyMwauXZSyQMjHQgRrJYoOhxT
7kRTjZolBaonNE8ZGaAnhXI6BrzRR1mSZe+m0YdlLZA4hrmTuhQnFrmRO5pFaipY
CMXKsItGbGmvUPz77Jz2ZGkwJ9S8Edxt80ubEKR7gAmEU42t20AuQ2moOx5Tw0j2
GGmu1S3NajE98j0EvHeXx0pPKZ7PUG4k0YfR8KfoF4h7GpD+7YSy52Qz92fCyh52
CDamNqNGdj+3dVqd+bFKmtOL3a+yULhuIdhNPI9t6Llaxh2onVAih3ohp/sdO2DP
wnvMc3VMpUBpRx38aDx37eGL19nEz7bJXSpsKTuoagZ7EhAQksB/gksc7mIKdwZT
8omRssKWwnwM4akXB9hEeDDenk4+daDbd00hbex3dRew5luGV9cI2xlNxbEVsqpM
/gz2wueoB3DPekGDJ+cwxZXX53KEWJ7m6uk/iU/i0p0XAOTDQ5U3+jWleZtkcNFP
u8JqtGX7mQo0qU3Tsopc8iYUsGMRi9V0v2J7FYybXaHFLLPFbt9kP1wjis8BJ91x
GZs/yM4+o/+Q43c6SM3muYG+KsE2WyrBYecSm9XXbTNoHbwNux13KJ4desqPcGFt
bbTfyQdwB92W8HKWeYGr
=cADC
-----END PGP SIGNATURE-----

--=-4PnytCpohpCNGf0vofSM--
