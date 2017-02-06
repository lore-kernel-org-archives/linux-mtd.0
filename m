Received: from mail-eopbgr20135.outbound.protection.outlook.com
 ([40.107.2.135] helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cacZu-0008OL-Vm
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2017 06:15:10 +0000
Subject: Re: UBI/UBIFS corruptions during random power-cuts
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <b5608215-347a-f9a0-aa71-33546d7eab1b@toradex.com>
 <0500de05-b3d7-6cbc-0236-5d4c83a5f00f@nod.at>
 <961abad6-7d46-4427-fb2b-97477a4a6a10@toradex.com>
 <2be57b2b-8fad-a987-8257-18f8ea024621@nod.at>
 <89cd8327-581b-4285-d9ae-138d800211cf@toradex.com>
 <bceb976b-0aac-fe04-a540-f24823366233@nod.at>
 <c5cc6f86-fb4e-cdb4-8b0b-10d4dfd33735@toradex.com>
 <5a769de2-31f1-f011-c6bc-e94427407751@nod.at>
 <a27bc761-b8d2-4f69-468a-b9a4d61c68f8@toradex.com>
 <306876cd-0855-b9ee-659d-2164cfc3b2c4@nod.at>
 <877dea3c-717d-9b1a-c01d-537f3b46b2de@toradex.com>
 <ff60b696-ffec-8ddd-16bd-407a9bacb3e0@nod.at>
 <47db4d54-f8f5-a663-75b3-d2cd5fd0769f@toradex.com>
 <c3c9dcff-5738-d36c-189d-8aa0e9be98ca@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Message-ID: <17f16834-e200-60c7-62d4-b083b00335ac@toradex.com>
Date: Mon, 6 Feb 2017 11:40:31 +0530
MIME-Version: 1.0
In-Reply-To: <c3c9dcff-5738-d36c-189d-8aa0e9be98ca@nod.at>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/31/2017 02:18 AM, Richard Weinberger wrote:

> Bhuvan,
>
> Am 30.01.2017 um 14:31 schrieb Bhuvanchandra DV:
>> On 01/30/2017 01:27 PM, Richard Weinberger wrote:
>>
>>> Bhuvan,
>>>
>>> Am 30.01.2017 um 06:48 schrieb Bhuvanchandra DV:
>>>> [    9.823378] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, PID 126
>>>> [   10.190926] UBIFS assert failed in pack_bits at 242 (pid 120)
>>>> [   10.197294] CPU: 0 PID: 120 Comm: mount Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #13
>>>> [   10.205952] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>>>> [   10.212515] Backtrace:
>>>> [   10.215142] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
>>>> [   10.222899]  r7:00000000 r6:600c0013 r5:00000000 r4:c0e29058
>>>> [   10.228716] [<c010c704>] (show_stack) from [<c03fcf18>] (dump_stack+0xb4/0xe8)
>>>> [   10.236150] [<c03fce64>] (dump_stack) from [<c037b2dc>] (pack_bits+0x1f4/0x200)
>>>> [   10.243649]  r10:0000b800 r9:ffffffee r8:c32bdd50 r7:c32bdd54 r6:00000001 r5:c831c860
>>>> [   10.251651]  r4:0000000e r3:00000000
>>>> [   10.255352] [<c037b0e8>] (pack_bits) from [<c037bf90>] (ubifs_pack_pnode+0x84/0x104)
>>>> [   10.263289]  r9:c831c853 r8:c831c851 r7:c32299e0 r6:c30dc000 r5:c32bdd54 r4:c32299c8
>>>> [   10.271233] [<c037bf0c>] (ubifs_pack_pnode) from [<c0385d50>] (ubifs_lpt_end_commit+0x27c/0x6fc)
>>>> [   10.280214]  r9:00000001 r8:c8311000 r7:00000011 r6:0000b862 r5:c3229980 r4:c30dc000
>>>> [   10.288148] [<c0385ad4>] (ubifs_lpt_end_commit) from [<c0373658>] (do_commit+0x244/0x80c)
>>>> [   10.296515]  r10:00000020 r9:00000020 r8:c3195dd4 r7:00000003 r6:c30dc2f0 r5:c30dc000
>>>> [   10.304514]  r4:00000000
>>>> [   10.307163] [<c0373414>] (do_commit) from [<c0373e70>] (ubifs_run_commit+0x9c/0xf0)
>>>> [   10.315001]  r8:00000000 r7:c30dcb48 r6:c30dc3e4 r5:c30dc42c r4:c30dc000
>>>> [   10.321856] [<c0373dd4>] (ubifs_run_commit) from [<c03823dc>] (ubifs_rcvry_gc_commit+0x7c/0x1d8)
>>>> [   10.330830]  r7:c30dcb48 r6:c3195c00 r5:c30dcb8c r4:c30dc000
>>>> [   10.336659] [<c0382360>] (ubifs_rcvry_gc_commit) from [<c0364700>] (ubifs_remount_fs+0x514/0x79c)
>>>> [   10.345731]  r7:c30dcb48 r6:c32a3c00 r5:c30dcb8c r4:c30dc000
>>>> [   10.351548] [<c03641ec>] (ubifs_remount_fs) from [<c0225188>] (do_remount_sb+0x6c/0x1d8)
>>>> [   10.359825]  r9:00000020 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:c318a000
>>>> [   10.367783] [<c022511c>] (do_remount_sb) from [<c0248f4c>] (do_mount+0x698/0xc84)
>>>> [   10.375452]  r8:c3108b10 r7:c02498e8 r6:c318a000 r5:00000000 r4:c318a044
>>>> [   10.382306] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
>>>> [   10.389416]  r10:00000000 r9:c32bc000 r8:c0ed0020 r7:01696860 r6:00000000 r5:c3214b40
>>>> [   10.397418]  r4:c3214e80
>>>> [   10.400075] [<c024986c>] (SyS_mount) from [<c0107e60>] (ret_fast_syscall+0x0/0x1c)
>>>> [   10.407832]  r8:c0108004 r7:00000015 r6:00000000 r5:00000000 r4:00000000
>>>> [   10.518251] systemd[1]: Started Journal Service.
>>> This is what I was looking for! :)
>>> Let's see whether I can find the root cause with that issue, otherwise I'll create
>>> a debug patch for you.
>> Sure! Thank you.
> Hmm, i suspect that the dirty variable turns negative. Can you please reproduce
> with the attached debug patch? Maybe it gives us more hints what is going on.

Here is the log with debug patch:

[    3.244581] ubi0: attached by fastmap
[    3.248432] ubi0: fastmap pool size: 50
[    3.252617] ubi0: fastmap WL pool size: 25
[    3.296085] ubi0: attached mtd3 (name "ubi", size 126 MiB)
[    3.302006] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    3.309050] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    3.316151] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    3.323429] ubi0: good PEBs: 1000, bad PEBs: 8, corrupted PEBs: 0
[    3.329677] ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128
[    3.337233] ubi0: max/mean erase counter: 276/31, WL threshold: 4096, image sequence number: 0
[    3.346200] ubi0: available PEBs: 0, total reserved PEBs: 1000, PEBs reserved for bad PEB handling: 12
[    3.356545] ubi0: background thread "ubi_bgt0d" started, PID 93
[    3.369408] rtc-ds1307 0-0068: hctosys: unable to read the hardware clock
[    3.379847] ALSA device list:
[    3.383366]   No soundcards found.
[    3.486183] UBIFS (ubi0:2): recovery needed
[    3.806677] ------------[ cut here ]------------
[    3.811542] WARNING: CPU: 0 PID: 1 at fs/ubifs/replay.c:143 ubifs_replay_journal+0x1434/0x14bc
[    3.820907] Modules linked in:
[    3.824313] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #14
[    3.833124] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[    3.839689] Backtrace:
[    3.842309] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
[    3.850066]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
[    3.855877] [<c010c704>] (show_stack) from [<c03fcf78>] (dump_stack+0xb4/0xe8)
[    3.863297] [<c03fcec4>] (dump_stack) from [<c0125f64>] (__warn+0xd8/0x104)
[    3.870405]  r10:c30dc000 r9:c0371ce0 r8:c0c1e4a0 r7:0000008f r6:00000009 r5:00000000
[    3.878408]  r4:00000000 r3:00000000
[    3.882105] [<c0125e8c>] (__warn) from [<c0126044>] (warn_slowpath_null+0x28/0x30)
[    3.889865]  r9:00000000 r8:c30dcd2c r7:c30dcc0c r6:ffffff58 r5:c322c498 r4:c320e180
[    3.897801] [<c012601c>] (warn_slowpath_null) from [<c0371ce0>] (ubifs_replay_journal+0x1434/0x14bc)
[    3.907163] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
[    3.915891]  r10:c30dc008 r9:c31d7c80 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c318a000
[    3.923885]  r4:00000000
[    3.926555] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
[    3.933842]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31d7c40
[    3.941841]  r4:c3108b00
[    3.944505] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
[    3.952164]  r6:00008001 r5:c31d7c40 r4:c3108b00
[    3.956926] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
[    3.964681]  r9:00000060 r8:c31d7280 r7:c02498e8 r6:c31d7c40 r5:00000000 r4:c0e2515c
[    3.972616] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
[    3.979725]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31d7c40
[    3.987721]  r4:c31d7280
[    3.990370] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
[    3.998384]  r8:c0d60878 r7:c7d3cac0 r6:c31d6000 r5:c31d6000 r4:00008001
[    4.005239] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
[    4.013870]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
[    4.021868]  r4:c0d60888
[    4.024515] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
[    4.033572]  r6:c0d73d5c r5:c0e78000 r4:00000008
[    4.038327] [<c0d00d14>] (kernel_init_freeable) from [<c0979c30>] (kernel_init+0x10/0x120)
[    4.046777]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979c20
[    4.054770]  r4:00000000
[    4.057426] [<c0979c20>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
[    4.065165]  r5:c0979c20 r4:00000000
[    4.069239] ---[ end trace 0340b4f2891a36dc ]---
[    4.074236] UBIFS error (ubi0:2 pid 1): ubifs_replay_journal: LEB 819 lp free: 0 lp dirty: 126808 b free: 22528 b dirty: 96 dirty: -168
[    4.086957] UBIFS assert failed in ubifs_change_lp at 559 (pid 1)
[    4.093407] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.10.0-rc4-00016-g60124f748422-dirty #14
[    4.103447] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[    4.110012] Backtrace:
[    4.112614] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
[    4.120372]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
[    4.126182] [<c010c704>] (show_stack) from [<c03fcf78>] (dump_stack+0xb4/0xe8)
[    4.133616] [<c03fcec4>] (dump_stack) from [<c03808b4>] (ubifs_change_lp+0x69c/0x6f8)
[    4.141637]  r10:00005800 r9:c30dc990 r8:ffffffb8 r7:c30dcc0c r6:ffffff58 r5:c322c498
[    4.149634]  r4:c30dc000 r3:00000000
[    4.153334] [<c0380218>] (ubifs_change_lp) from [<c03713c0>] (ubifs_replay_journal+0xb14/0x14bc)
[    4.162316]  r10:c30dc000 r9:00000000 r8:c30dcd2c r7:c30dcc0c r6:ffffff58 r5:c322c498
[    4.170310]  r4:c320e180
[    4.172977] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
[    4.181706]  r10:c30dc008 r9:c31d7c80 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c318a000
[    4.189698]  r4:00000000
[    4.192360] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
[    4.199647]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31d7c40
[    4.207645]  r4:c3108b00
[    4.210309] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
[    4.217967]  r6:00008001 r5:c31d7c40 r4:c3108b00
[    4.222728] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
[    4.230485]  r9:00000060 r8:c31d7280 r7:c02498e8 r6:c31d7c40 r5:00000000 r4:c0e2515c
[    4.238418] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
[    4.245529]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31d7c40
[    4.253523]  r4:c31d7280
[    4.256172] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
[    4.264183]  r8:c0d60878 r7:c7d3cac0 r6:c31d6000 r5:c31d6000 r4:00008001
[    4.271033] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
[    4.279666]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
[    4.287665]  r4:c0d60888
[    4.290309] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
[    4.299367]  r6:c0d73d5c r5:c0e78000 r4:00000008
[    4.304123] [<c0d00d14>] (kernel_init_freeable) from [<c0979c30>] (kernel_init+0x10/0x120)
[    4.312572]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979c20
[    4.320565]  r4:00000000
[    4.323222] [<c0979c20>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
[    4.330960]  r5:c0979c20 r4:00000000
[    4.338528] UBIFS (ubi0:2): recovery deferred
[    4.345120] UBIFS (ubi0:2): UBIFS: mounted UBI device 0, volume 2, name "rootfs", R/O mode
[    4.353998] UBIFS (ubi0:2): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    4.364349] UBIFS (ubi0:2): FS size: 114532352 bytes (109 MiB, 902 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
[    4.375390] UBIFS (ubi0:2): reserved for root: 0 bytes (0 KiB)
[    4.381392] UBIFS (ubi0:2): media format: w4/r0 (latest is w5/r0), UUID 297830B7-F714-4754-B0DA-617A5595067D, small LPT model
[    4.396743] VFS: Mounted root (ubifs filesystem) readonly on device 0:12.
...
[    9.672243] UBIFS (ubi0:2): completing deferred recovery
[   10.228267] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, PID 126
[   10.276128] UBIFS assert failed in pack_bits at 242 (pid 120)
[   10.282568] CPU: 0 PID: 120 Comm: mount Tainted: G        W       4.10.0-rc4-00016-g60124f748422-dirty #14
[   10.292446] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[   10.299010] Backtrace:
[   10.301638] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
[   10.309394]  r7:00000000 r6:600f0113 r5:00000000 r4:c0e29058
[   10.315206] [<c010c704>] (show_stack) from [<c03fcf78>] (dump_stack+0xb4/0xe8)
[   10.322634] [<c03fcec4>] (dump_stack) from [<c037b33c>] (pack_bits+0x1f4/0x200)
[   10.330138]  r10:00017000 r9:fffffff7 r8:c32cdd50 r7:c32cdd54 r6:00000002 r5:c83280da
[   10.338135]  r4:0000000e r3:00000000
[   10.341835] [<c037b148>] (pack_bits) from [<c037bff0>] (ubifs_pack_pnode+0x84/0x104)
[   10.349767]  r9:c83280d8 r8:c83280d6 r7:c322c4e0 r6:c30dc000 r5:c32cdd54 r4:c322c480
[   10.357719] [<c037bf6c>] (ubifs_pack_pnode) from [<c0385db0>] (ubifs_lpt_end_commit+0x27c/0x6fc)
[   10.366698]  r9:00000001 r8:c8311000 r7:00000011 r6:000170e7 r5:c322c480 r4:c30dc000
[   10.374633] [<c0385b34>] (ubifs_lpt_end_commit) from [<c03736b8>] (do_commit+0x244/0x80c)
[   10.383002]  r10:00000020 r9:00000020 r8:c3195dd4 r7:00000003 r6:c30dc2f0 r5:c30dc000
[   10.391000]  r4:00000000
[   10.393646] [<c0373474>] (do_commit) from [<c0373ed0>] (ubifs_run_commit+0x9c/0xf0)
[   10.401484]  r8:00000000 r7:c30dcb48 r6:c30dc3e4 r5:c30dc42c r4:c30dc000
[   10.408335] [<c0373e34>] (ubifs_run_commit) from [<c038243c>] (ubifs_rcvry_gc_commit+0x7c/0x1d8)
[   10.417305]  r7:c30dcb48 r6:c3195c00 r5:c30dcb8c r4:c30dc000
[   10.423128] [<c03823c0>] (ubifs_rcvry_gc_commit) from [<c0364700>] (ubifs_remount_fs+0x514/0x79c)
[   10.432199]  r7:c30dcb48 r6:c32a0c00 r5:c30dcb8c r4:c30dc000
[   10.438015] [<c03641ec>] (ubifs_remount_fs) from [<c0225188>] (do_remount_sb+0x6c/0x1d8)
[   10.446293]  r9:00000020 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:c318a000
[   10.454251] [<c022511c>] (do_remount_sb) from [<c0248f4c>] (do_mount+0x698/0xc84)
[   10.461922]  r8:c3108b10 r7:c02498e8 r6:c318a000 r5:00000000 r4:c318a044
[   10.468776] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
[   10.475884]  r10:00000000 r9:c32cc000 r8:c0ed0020 r7:0078f860 r6:00000000 r5:c3216bc0
[   10.483886]  r4:c3216e40
[   10.486539] [<c024986c>] (SyS_mount) from [<c0107e60>] (ret_fast_syscall+0x0/0x1c)
[   10.494290]  r8:c0108004 r7:00000015 r6:00000000 r5:00000000 r4:00000000
...
[   10.692568] UBIFS (ubi0:2): deferred recovery completed
[   11.757358] systemd-journald[115]: Received request to flush runtime journal from PID 1
[   11.826036] UBIFS assert failed in ubifs_change_lp at 559 (pid 115)
[   11.833005] CPU: 0 PID: 115 Comm: systemd-journal Tainted: G        W       4.10.0-rc4-00016-g60124f748422-dirty #14
[   11.843768] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[   11.850336] Backtrace:
[   11.852954] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
[   11.860716]  r7:00000000 r6:600f0013 r5:00000000 r4:c0e29058
[   11.866526] [<c010c704>] (show_stack) from [<c03fcf78>] (dump_stack+0xb4/0xe8)
[   11.873973] [<c03fcec4>] (dump_stack) from [<c03808b4>] (ubifs_change_lp+0x69c/0x6f8)
[   11.881998]  r10:000055b0 r9:c30dc990 r8:ffffffb8 r7:00000333 r6:c30dcc0c r5:c322c498
[   11.890002]  r4:c30dc000 r3:00000000
[   11.893701] [<c0380218>] (ubifs_change_lp) from [<c0380ae0>] (ubifs_update_one_lp+0x84/0x150)
[   11.902421]  r10:00000333 r9:c337c000 r8:000055b0 r7:00000333 r6:c30dcc0c r5:c30dc000
[   11.910414]  r4:00000000
[   11.913091] [<c0380a5c>] (ubifs_update_one_lp) from [<c0364058>] (bud_wbuf_callback+0x20/0x28)
[   11.921902]  r8:0000024c r7:c3195e18 r6:00000250 r5:c30dc000 r4:c3195db0
[   11.928768] [<c0364038>] (bud_wbuf_callback) from [<c036935c>] (ubifs_wbuf_write_nolock+0x234/0x770)
[   11.938117] [<c0369128>] (ubifs_wbuf_write_nolock) from [<c035b6dc>] (ubifs_jnl_write_data+0x1a4/0x300)
[   11.947714]  r10:00000333 r9:c3195c00 r8:c337c000 r7:c3295d08 r6:0000024c r5:c30dc000
[   11.955711]  r4:00000000
[   11.958363] [<c035b538>] (ubifs_jnl_write_data) from [<c035db28>] (do_writepage+0x80/0x1a8)
[   11.966911]  r10:0000f66e r9:c17ef000 r8:20000000 r7:c35de590 r6:00001000 r5:c30dc000
[   11.974909]  r4:c7d08de0
[   11.977559] [<c035daa8>] (do_writepage) from [<c035f50c>] (ubifs_writepage+0x174/0x240)
[   11.985757]  r10:c35de804 r9:00000000 r8:00000000 r7:c7d08de0 r6:800f0013 r5:00000200
[   11.993760]  r4:c35de590
[   11.996411] [<c035f398>] (ubifs_writepage) from [<c01df1b8>] (__writepage+0x1c/0x48)
[   12.004343]  r10:c3295e88 r9:00000000 r8:ffffffff r7:c35de6c4 r6:c7d08de0 r5:c35de6c4
[   12.012339]  r4:00000000
[   12.014986] [<c01df19c>] (__writepage) from [<c01df8e8>] (write_cache_pages+0x16c/0x3d0)
[   12.023260]  r5:c3295de0 r4:00000000
[   12.026957] [<c01df77c>] (write_cache_pages) from [<c01dfb94>] (generic_writepages+0x48/0x64)
[   12.035670]  r10:00000000 r9:7fffffff r8:ffffffff r7:00000000 r6:c35de6c4 r5:c3295e88
[   12.043670]  r4:c35de6c4
[   12.046319] [<c01dfb4c>] (generic_writepages) from [<c01e1c24>] (do_writepages+0x3c/0x40)
[   12.054677]  r5:7fffffff r4:ffffffff
[   12.058392] [<c01e1be8>] (do_writepages) from [<c01d4e38>] (__filemap_fdatawrite_range+0x7c/0xa4)
[   12.067470] [<c01d4dbc>] (__filemap_fdatawrite_range) from [<c01d4fb4>] (filemap_write_and_wait_range+0x3c/0x88)
[   12.077844]  r6:00000000 r5:c35de6c4 r4:c3377280
[   12.082602] [<c01d4f78>] (filemap_write_and_wait_range) from [<c035e290>] (ubifs_fsync+0x48/0xbc)
[   12.091679]  r9:7fffffff r8:ffffffff r7:00000000 r6:c30dc000 r5:c35de590 r4:c3377280
[   12.099644] [<c035e248>] (ubifs_fsync) from [<c025470c>] (vfs_fsync_range+0x60/0xb4)
[   12.107574]  r9:c3294000 r8:c35de590 r7:00000000 r6:00000000 r5:00000000 r4:c3377280
[   12.115506] [<c02546ac>] (vfs_fsync_range) from [<c02547d8>] (do_fsync+0x44/0x6c)
[   12.123175]  r9:c3294000 r8:c0108004 r7:00000076 r6:00000000 r5:c3377280 r4:c3377280
[   12.131106] [<c0254794>] (do_fsync) from [<c0254a94>] (SyS_fsync+0x14/0x18)
[   12.138203]  r6:00000006 r5:00000001 r4:81036430
[   12.142961] [<c0254a80>] (SyS_fsync) from [<c0107e60>] (ret_fast_syscall+0x0/0x1c)

--
Bhuvan

>
> Thanks,
> //richard
