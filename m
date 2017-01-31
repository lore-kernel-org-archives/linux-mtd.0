Received: from mail-eopbgr50116.outbound.protection.outlook.com
 ([40.107.5.116] helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYTuk-0000Dy-Cf
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 08:35:53 +0000
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
 <763b493b-1ff5-0e7e-7376-a6f4edd1d38f@toradex.com>
 <d69b2e1a-9ccf-9657-e3a5-769d244fbb8f@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Message-ID: <d8159144-0ccb-5043-2cb7-48dfe8b94fad@toradex.com>
Date: Tue, 31 Jan 2017 14:01:24 +0530
MIME-Version: 1.0
In-Reply-To: <d69b2e1a-9ccf-9657-e3a5-769d244fbb8f@nod.at>
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

On 01/31/2017 02:01 PM, Richard Weinberger wrote:

> Bhuvan,
>
> Am 31.01.2017 um 08:06 schrieb Bhuvanchandra DV:
>>>>> Am 30.01.2017 um 06:48 schrieb Bhuvanchandra DV:
>>>>>> [    9.823378] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, PID 126
>>>>>> [   10.190926] UBIFS assert failed in pack_bits at 242 (pid 120)
>>>>>> [   10.197294] CPU: 0 PID: 120 Comm: mount Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #13
>>>>>> [   10.205952] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>>>>>> [   10.212515] Backtrace:
>>>>>> [   10.215142] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
>>>>>> [   10.222899]  r7:00000000 r6:600c0013 r5:00000000 r4:c0e29058
>>>>>> [   10.228716] [<c010c704>] (show_stack) from [<c03fcf18>] (dump_stack+0xb4/0xe8)
>>>>>> [   10.236150] [<c03fce64>] (dump_stack) from [<c037b2dc>] (pack_bits+0x1f4/0x200)
>>>>>> [   10.243649]  r10:0000b800 r9:ffffffee r8:c32bdd50 r7:c32bdd54 r6:00000001 r5:c831c860
>>>>>> [   10.251651]  r4:0000000e r3:00000000
>>>>>> [   10.255352] [<c037b0e8>] (pack_bits) from [<c037bf90>] (ubifs_pack_pnode+0x84/0x104)
>>>>>> [   10.263289]  r9:c831c853 r8:c831c851 r7:c32299e0 r6:c30dc000 r5:c32bdd54 r4:c32299c8
>>>>>> [   10.271233] [<c037bf0c>] (ubifs_pack_pnode) from [<c0385d50>] (ubifs_lpt_end_commit+0x27c/0x6fc)
>>>>>> [   10.280214]  r9:00000001 r8:c8311000 r7:00000011 r6:0000b862 r5:c3229980 r4:c30dc000
>>>>>> [   10.288148] [<c0385ad4>] (ubifs_lpt_end_commit) from [<c0373658>] (do_commit+0x244/0x80c)
>>>>>> [   10.296515]  r10:00000020 r9:00000020 r8:c3195dd4 r7:00000003 r6:c30dc2f0 r5:c30dc000
>>>>>> [   10.304514]  r4:00000000
>>>>>> [   10.307163] [<c0373414>] (do_commit) from [<c0373e70>] (ubifs_run_commit+0x9c/0xf0)
>>>>>> [   10.315001]  r8:00000000 r7:c30dcb48 r6:c30dc3e4 r5:c30dc42c r4:c30dc000
>>>>>> [   10.321856] [<c0373dd4>] (ubifs_run_commit) from [<c03823dc>] (ubifs_rcvry_gc_commit+0x7c/0x1d8)
>>>>>> [   10.330830]  r7:c30dcb48 r6:c3195c00 r5:c30dcb8c r4:c30dc000
>>>>>> [   10.336659] [<c0382360>] (ubifs_rcvry_gc_commit) from [<c0364700>] (ubifs_remount_fs+0x514/0x79c)
>>>>>> [   10.345731]  r7:c30dcb48 r6:c32a3c00 r5:c30dcb8c r4:c30dc000
>>>>>> [   10.351548] [<c03641ec>] (ubifs_remount_fs) from [<c0225188>] (do_remount_sb+0x6c/0x1d8)
>>>>>> [   10.359825]  r9:00000020 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:c318a000
>>>>>> [   10.367783] [<c022511c>] (do_remount_sb) from [<c0248f4c>] (do_mount+0x698/0xc84)
>>>>>> [   10.375452]  r8:c3108b10 r7:c02498e8 r6:c318a000 r5:00000000 r4:c318a044
>>>>>> [   10.382306] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
>>>>>> [   10.389416]  r10:00000000 r9:c32bc000 r8:c0ed0020 r7:01696860 r6:00000000 r5:c3214b40
>>>>>> [   10.397418]  r4:c3214e80
>>>>>> [   10.400075] [<c024986c>] (SyS_mount) from [<c0107e60>] (ret_fast_syscall+0x0/0x1c)
>>>>>> [   10.407832]  r8:c0108004 r7:00000015 r6:00000000 r5:00000000 r4:00000000
>>>>>> [   10.518251] systemd[1]: Started Journal Service.
>>>>> This is what I was looking for! :)
>>>>> Let's see whether I can find the root cause with that issue, otherwise I'll create
>>>>> a debug patch for you.
>>>> Sure! Thank you.
>>> Hmm, i suspect that the dirty variable turns negative. Can you please reproduce
>>> with the attached debug patch? Maybe it gives us more hints what is going on.
>> Here is the log:
>>
>> [    4.313136] UBIFS (ubi0:2): recovery needed
>> [    4.646472] ------------[ cut here ]------------
>> [    4.651575] WARNING: CPU: 0 PID: 1 at fs/ubifs/replay.c:143 ubifs_replay_journal+0x1434/0x14bc
>> [    4.660406] Modules linked in:
>> [    4.663904] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #14
>> [    4.672721] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>> [    4.679290] Backtrace:
>> [    4.681907] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
>> [    4.689665]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
>> [    4.695480] [<c010c704>] (show_stack) from [<c03fcf78>] (dump_stack+0xb4/0xe8)
>> [    4.702896] [<c03fcec4>] (dump_stack) from [<c0125f64>] (__warn+0xd8/0x104)
>> [    4.710006]  r10:c30dc000 r9:c0371ce0 r8:c0c1e4a0 r7:0000008f r6:00000009 r5:00000000
>> [    4.718008]  r4:00000000 r3:00000000
>> [    4.721702] [<c0125e8c>] (__warn) from [<c0126044>] (warn_slowpath_null+0x28/0x30)
>> [    4.729454]  r9:00000000 r8:c30dcd2c r7:c30dcc0c r6:0001b948 r5:c32326c8 r4:c31dcb40
>> [    4.737386] [<c012601c>] (warn_slowpath_null) from [<c0371ce0>] (ubifs_replay_journal+0x1434/0x14bc)
>> [    4.746745] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
>> [    4.755468]  r10:c30dc008 r9:c31dc3c0 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c318a000
>> [    4.763468]  r4:00000000
>> [    4.766138] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
>> [    4.773427]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31dc340
>> [    4.781424]  r4:c3108b00
>> [    4.784090] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
>> [    4.791747]  r6:00008001 r5:c31dc340 r4:c3108b00
>> [    4.796509] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
>> [    4.804263]  r9:00000060 r8:c31dc300 r7:c02498e8 r6:c31dc340 r5:00000000 r4:c0e2515c
>> [    4.812197] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
>> [    4.819307]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31dc340
>> [    4.827301]  r4:c31dc300
>> [    4.829955] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
>> [    4.837970]  r8:c0d60878 r7:c7d3cd80 r6:c31ec000 r5:c31ec000 r4:00008001
>> [    4.844820] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
>> [    4.853453]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
>> [    4.861452]  r4:c0d60888
>> [    4.864099] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
>> [    4.873155]  r6:c0d73d5c r5:c0e78000 r4:00000008
>> [    4.877912] [<c0d00d14>] (kernel_init_freeable) from [<c0979c30>] (kernel_init+0x10/0x120)
>> [    4.886369]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979c20
>> [    4.894361]  r4:00000000
>> [    4.897019] [<c0979c20>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
>> [    4.904767]  r5:c0979c20 r4:00000000
>> [    4.908858] ---[ end trace 0f8d6b2bab39eeac ]---
>> [    4.913831] UBIFS error (ubi0:2 pid 1): ubifs_replay_journal: LEB 909 lp free: 126976 lp dirty: 112968 b free: 0 b8
>> [    4.927181] ------------[ cut here ]------------
>> [    4.932194] WARNING: CPU: 0 PID: 1 at fs/ubifs/replay.c:143 ubifs_replay_journal+0x1434/0x14bc
>> [    4.941005] Modules linked in:
>> [    4.944485] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.10.0-rc4-00016-g60124f748422-dirty #14
>> [    4.954530] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>> [    4.961097] Backtrace:
>> [    4.963702] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
>> [    4.971456]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
>> [    4.977272] [<c010c704>] (show_stack) from [<c03fcf78>] (dump_stack+0xb4/0xe8)
>> [    4.984684] [<c03fcec4>] (dump_stack) from [<c0125f64>] (__warn+0xd8/0x104)
>> [    4.991798]  r10:c30dc000 r9:c0371ce0 r8:c0c1e4a0 r7:0000008f r6:00000009 r5:00000000
>> [    4.999800]  r4:00000000 r3:00000000
>> [    5.003497] [<c0125e8c>] (__warn) from [<c0126044>] (warn_slowpath_null+0x28/0x30)
>> [    5.011254]  r9:00000000 r8:c30dcd2c r7:c30dcc0c r6:000143e8 r5:c32326b0 r4:c31dcbc0
>> [    5.019192] [<c012601c>] (warn_slowpath_null) from [<c0371ce0>] (ubifs_replay_journal+0x1434/0x14bc)
>> [    5.028553] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
>> [    5.037277]  r10:c30dc008 r9:c31dc3c0 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c318a000
>> [    5.045277]  r4:00000000
>> [    5.047938] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
>> [    5.055224]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31dc340
>> [    5.063224]  r4:c3108b00
>> [    5.065886] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
>> [    5.073547]  r6:00008001 r5:c31dc340 r4:c3108b00
>> [    5.078309] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
>> [    5.086063]  r9:00000060 r8:c31dc300 r7:c02498e8 r6:c31dc340 r5:00000000 r4:c0e2515c
>> [    5.093999] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
>> [    5.101107]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31dc340
>> [    5.109103]  r4:c31dc300
>> [    5.111754] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
>> [    5.119770]  r8:c0d60878 r7:c7d3cd80 r6:c31ec000 r5:c31ec000 r4:00008001
>> [    5.126622] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
>> [    5.135252]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
>> [    5.143250]  r4:c0d60888
>> [    5.145899] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
>> [    5.154954]  r6:c0d73d5c r5:c0e78000 r4:00000008
>> [    5.159709] [<c0d00d14>] (kernel_init_freeable) from [<c0979c30>] (kernel_init+0x10/0x120)
>> [    5.168160]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979c20
>> [    5.176151]  r4:00000000
>> [    5.178811] [<c0979c20>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
>> [    5.186556]  r5:c0979c20 r4:00000000
>> [    5.190810] ---[ end trace 0f8d6b2bab39eead ]---
>> [    5.195803] UBIFS error (ubi0:2 pid 1): ubifs_replay_journal: LEB 908 lp free: 126976 lp dirty: 82920 b free: 0 b 0
>> [    5.209152] ------------[ cut here ]------------
>> [    5.214149] WARNING: CPU: 0 PID: 1 at fs/ubifs/replay.c:143 ubifs_replay_journal+0x1434/0x14bc
>> [    5.223250] Modules linked in:
>> [    5.226486] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.10.0-rc4-00016-g60124f748422-dirty #14
>> [    5.236506] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>> [    5.243069] Backtrace:
>> [    5.245682] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
>> [    5.253439]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
>> [    5.259249] [<c010c704>] (show_stack) from [<c03fcf78>] (dump_stack+0xb4/0xe8)
>> [    5.266668] [<c03fcec4>] (dump_stack) from [<c0125f64>] (__warn+0xd8/0x104)
>> [    5.273780]  r10:c30dc000 r9:c0371ce0 r8:c0c1e4a0 r7:0000008f r6:00000009 r5:00000000
>> [    5.281783]  r4:00000000 r3:00000000
>> [    5.285478] [<c0125e8c>] (__warn) from [<c0126044>] (warn_slowpath_null+0x28/0x30)
>> [    5.293237]  r9:00000000 r8:c30dcd2c r7:c30dcc0c r6:00015cf8 r5:c3232698 r4:c31dcc40
>> [    5.301176] [<c012601c>] (warn_slowpath_null) from [<c0371ce0>] (ubifs_replay_journal+0x1434/0x14bc)
>> [    5.310536] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
>> [    5.319259]  r10:c30dc008 r9:c31dc3c0 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c318a000
>> [    5.327259]  r4:00000000
>> [    5.329923] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
>> [    5.337215]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31dc340
>> [    5.345216]  r4:c3108b00
>> [    5.347878] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
>> [    5.355537]  r6:00008001 r5:c31dc340 r4:c3108b00
>> [    5.360297] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
>> [    5.368056]  r9:00000060 r8:c31dc300 r7:c02498e8 r6:c31dc340 r5:00000000 r4:c0e2515c
>> [    5.375990] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
>> [    5.383099]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31dc340
>> [    5.391092]  r4:c31dc300
>> [    5.393743] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
>> [    5.401759]  r8:c0d60878 r7:c7d3cd80 r6:c31ec000 r5:c31ec000 r4:00008001
>> [    5.408613] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
>> [    5.417244]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
>> [    5.425243]  r4:c0d60888
>> [    5.427891] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
>> [    5.436947]  r6:c0d73d5c r5:c0e78000 r4:00000008
>> [    5.441701] [<c0d00d14>] (kernel_init_freeable) from [<c0979c30>] (kernel_init+0x10/0x120)
>> [    5.450159]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979c20
>> [    5.458151]  r4:00000000
>> [    5.460809] [<c0979c20>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
>> [    5.468549]  r5:c0979c20 r4:00000000
>> [    5.472625] ---[ end trace 0f8d6b2bab39eeae ]---
>> [    5.477444] UBIFS error (ubi0:2 pid 1): ubifs_replay_journal: LEB 907 lp free: 126976 lp dirty: 89336 b free: 0 b 6
>> [    5.490551] ------------[ cut here ]------------
>> [    5.495644] WARNING: CPU: 0 PID: 1 at fs/ubifs/replay.c:143 ubifs_replay_journal+0x1434/0x14bc
>> [    5.504653] Modules linked in:
>> [    5.507883] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.10.0-rc4-00016-g60124f748422-dirty #14
>> [    5.517898] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>> [    5.524463] Backtrace:
>> [    5.527067] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
>> [    5.534825]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
>> [    5.540637] [<c010c704>] (show_stack) from [<c03fcf78>] (dump_stack+0xb4/0xe8)
>> [    5.548053] [<c03fcec4>] (dump_stack) from [<c0125f64>] (__warn+0xd8/0x104)
>> [    5.555162]  r10:c30dc000 r9:c0371ce0 r8:c0c1e4a0 r7:0000008f r6:00000009 r5:00000000
>> [    5.563165]  r4:00000000 r3:00000000
>> [    5.566862] [<c0125e8c>] (__warn) from [<c0126044>] (warn_slowpath_null+0x28/0x30)
>> [    5.574612]  r9:00000000 r8:c30dcd2c r7:c30dcc0c r6:00005df0 r5:c3232ae0 r4:c31dccc0
>> [    5.582549] [<c012601c>] (warn_slowpath_null) from [<c0371ce0>] (ubifs_replay_journal+0x1434/0x14bc)
>> [    5.591910] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
>> [    5.600636]  r10:c30dc008 r9:c31dc3c0 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c318a000
>> [    5.608635]  r4:00000000
>> [    5.611297] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
>> [    5.618582]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31dc340
>> [    5.626581]  r4:c3108b00
>> [    5.629245] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
>> [    5.636906]  r6:00008001 r5:c31dc340 r4:c3108b00
>> [    5.641664] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
>> [    5.649419]  r9:00000060 r8:c31dc300 r7:c02498e8 r6:c31dc340 r5:00000000 r4:c0e2515c
>> [    5.657355] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
>> [    5.664465]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31dc340
>> [    5.672459]  r4:c31dc300
>> [    5.675111] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
>> [    5.683127]  r8:c0d60878 r7:c7d3cd80 r6:c31ec000 r5:c31ec000 r4:00008001
>> [    5.689978] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
>> [    5.698609]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
>> [    5.706600]  r4:c0d60888
>> [    5.709248] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
>> [    5.718302]  r6:c0d73d5c r5:c0e78000 r4:00000008
>> [    5.723057] [<c0d00d14>] (kernel_init_freeable) from [<c0979c30>] (kernel_init+0x10/0x120)
>> [    5.731508]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979c20
>> [    5.739500]  r4:00000000
>> [    5.742149] [<c0979c20>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
>> [    5.749888]  r5:c0979c20 r4:00000000
>> [    5.753960] ---[ end trace 0f8d6b2bab39eeaf ]---
>> [    5.758775] UBIFS error (ubi0:2 pid 1): ubifs_replay_journal: LEB 906 lp free: 126976 lp dirty: 24048 b free: 0 b 8
>> [    5.819011] UBIFS (ubi0:2): recovery deferred
>> [    5.825155] UBIFS (ubi0:2): UBIFS: mounted UBI device 0, volume 2, name "rootfs", R/O mode
>> [    5.834016] UBIFS (ubi0:2): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
>> [    5.844368] UBIFS (ubi0:2): FS size: 114532352 bytes (109 MiB, 902 LEBs), journal size 9023488 bytes (8 MiB, 72 LE)
>> [    5.855418] UBIFS (ubi0:2): reserved for root: 0 bytes (0 KiB)
>> [    5.861580] UBIFS (ubi0:2): media format: w4/r0 (latest is w5/r0), UUID 297830B7-F714-4754-B0DA-617A5595067D, small
>> [    5.876654] VFS: Mounted root (ubifs filesystem) readonly on device 0:12.
>>
> Is this really the last triggered warning right before the power-cut where UBIFS renders unmountable?
> I miss the failing ubifs_assert().

No this not the one before corruption, observed this on every power cut thought this is what you are expecting.
Let me continue the power-cut tests until the ubifs getting corrupted for the expected ubids_assert logs.

--
Bhuvan

>
> Thanks,
> //richard
