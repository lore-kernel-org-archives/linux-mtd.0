Received: from mail-eopbgr50125.outbound.protection.outlook.com
 ([40.107.5.125] helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cY4tT-0005e1-4X
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2017 05:52:50 +0000
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
CC: Artem Bityutskiy <dedekind1@gmail.com>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Message-ID: <877dea3c-717d-9b1a-c01d-537f3b46b2de@toradex.com>
Date: Mon, 30 Jan 2017 11:18:23 +0530
MIME-Version: 1.0
In-Reply-To: <306876cd-0855-b9ee-659d-2164cfc3b2c4@nod.at>
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

On 01/26/2017 02:02 PM, Richard Weinberger wrote:

> Bhuvan,
>
> Am 25.01.2017 um 07:29 schrieb Bhuvanchandra DV:
>> Logs:
>> [    3.605299] UBIFS (ubi0:2): recovery needed
>> [    3.694649] hub 1-1:1.0: USB hub found
>> [    3.702704] hub 1-1:1.0: 4 ports detected
>> [    3.993572] UBIFS assert failed in ubifs_categorize_lprops at 417 (pid 1)
>> [    4.000943] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #13
>> [    4.009765] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>> [    4.016333] Backtrace:
>> [    4.018957] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
>> [    4.026720]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
>> [    4.032530] [<c010c704>] (show_stack) from [<c03fcf18>] (dump_stack+0xb4/0xe8)
>> [    4.039972] [<c03fce64>] (dump_stack) from [<c037e914>] (ubifs_categorize_lprops+0xdc/0xf0)
>> [    4.048517]  r10:c31eb780 r9:c31eb780 r8:00000020 r7:c3256778 r6:c30dc000 r5:c383fb74
>> [    4.056517]  r4:c3256778 r3:00000000
>> [    4.060216] [<c037e838>] (ubifs_categorize_lprops) from [<c037b98c>] (unpack_pnode+0xb8/0xfc)
>> [    4.068944] [<c037b8d4>] (unpack_pnode) from [<c037bbc0>] (ubifs_get_pnode.part.4+0x1f0/0x2b0)
>> [    4.077757]  r9:00000009 r8:00000004 r7:c3253c00 r6:00000002 r5:c30dc000 r4:c3256700
>> [    4.085695] [<c037b9d0>] (ubifs_get_pnode.part.4) from [<c037d604>] (ubifs_lpt_lookup_dirty+0x254/0x2a8)
>> [    4.095374]  r10:00000336 r9:00000240 r8:00000006 r7:c3253b98 r6:0000032b r5:c30dc000
>> [    4.103371]  r4:00000000
>> [    4.106024] [<c037d3b0>] (ubifs_lpt_lookup_dirty) from [<c0380a3c>] (ubifs_update_one_lp+0x40/0x150)
>> [    4.115355]  r10:00000336 r9:00000240 r8:80000001 r7:00000336 r6:c30dcc0c r5:c30dc000
>> [    4.123360]  r4:000000a0 r3:00000000
>> [    4.127058] [<c03809fc>] (ubifs_update_one_lp) from [<c036dbc8>] (ubifs_tnc_add+0x124/0x140)
>> [    4.135688]  r8:c30dc000 r7:c325df00 r6:c325df00 r5:00000000 r4:c30dc478
>> [    4.142533] [<c036daa4>] (ubifs_tnc_add) from [<c0371814>] (ubifs_replay_journal+0xf68/0x145c)
>> [    4.151341]  r10:c30dc000 r9:00000000 r8:00000000 r7:0000006a r6:c30dcd40 r5:c30dcd24
>> [    4.159337]  r4:c323f280
>> [    4.162008] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
>> [    4.170733]  r10:c30dc008 r9:c31eb400 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c31f4000
>> [    4.178735]  r4:00000000
>> [    4.181401] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
>> [    4.188691]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31eb380
>> [    4.196689]  r4:c3108d00
>> [    4.199355] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
>> [    4.207022]  r6:00008001 r5:c31eb380 r4:c3108d00
>> [    4.211785] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
>> [    4.219546]  r9:00000060 r8:c31eb340 r7:c02498e8 r6:c31eb380 r5:00000000 r4:c0e2515c
>> [    4.227484] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
>> [    4.234591]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31eb380
>> [    4.242585]  r4:c31eb340
>> [    4.245240] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
>> [    4.253263]  r8:c0d60878 r7:c7d3ce00 r6:c31f0000 r5:c31f0000 r4:00008001
>> [    4.260113] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
>> [    4.268744]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
>> [    4.276744]  r4:c0d60888
>> [    4.279391] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
>> [    4.288454]  r6:c0d73d5c r5:c0e78000 r4:00000008
>> [    4.293212] [<c0d00d14>] (kernel_init_freeable) from [<c0979bd0>] (kernel_init+0x10/0x120)
>> [    4.301668]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979bc0
>> [    4.309662]  r4:00000000
>> [    4.312317] [<c0979bc0>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
>> [    4.320066]  r5:c0979bc0 r4:00000000
>> [    4.325060] UBIFS error (ubi0:2 pid 1): ubifs_get_pnode.part.4: error -22 reading pnode at 9:33006
>> [    4.334503] (pid 1) dumping pnode:
>> [    4.338241]  address c3256700 parent c3253c00 cnext 0
>> [    4.343435]  flags 0 iip 2 level 0 num 0
>> [    4.347644]  0: free 63488 dirty 38840 flags 34 lnum 0
>> [    4.352929]  1: free 0 dirty 119976 flags 34 lnum 0
>> [    4.358133]  2: free 0 dirty 10912 flags 1 lnum 0
>> [    4.362971]  3: free 126976 dirty 130904 flags 36 lnum 0
>> [    4.368585] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #13
>> [    4.377394] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>> [    4.383962] Backtrace:
>> [    4.386579] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
>> [    4.394341]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
>> [    4.400150] [<c010c704>] (show_stack) from [<c03fcf18>] (dump_stack+0xb4/0xe8)
>> [    4.407577] [<c03fce64>] (dump_stack) from [<c037bc00>] (ubifs_get_pnode.part.4+0x230/0x2b0)
>> [    4.416210]  r10:c31eb780 r9:00000009 r8:00000004 r7:c3253c00 r6:00000002 r5:c30dc000
>> [    4.424211]  r4:c3256700 r3:00000000
>> [    4.427914] [<c037b9d0>] (ubifs_get_pnode.part.4) from [<c037d604>] (ubifs_lpt_lookup_dirty+0x254/0x2a8)
>> [    4.437600]  r10:00000336 r9:00000240 r8:00000006 r7:c3253b98 r6:0000032b r5:c30dc000
>> [    4.445596]  r4:00000000
>> [    4.448253] [<c037d3b0>] (ubifs_lpt_lookup_dirty) from [<c0380a3c>] (ubifs_update_one_lp+0x40/0x150)
>> [    4.457591]  r10:00000336 r9:00000240 r8:80000001 r7:00000336 r6:c30dcc0c r5:c30dc000
>> [    4.465593]  r4:000000a0 r3:00000000
>> [    4.469291] [<c03809fc>] (ubifs_update_one_lp) from [<c036dbc8>] (ubifs_tnc_add+0x124/0x140)
>> [    4.477921]  r8:c30dc000 r7:c325df00 r6:c325df00 r5:00000000 r4:c30dc478
>> [    4.484767] [<c036daa4>] (ubifs_tnc_add) from [<c0371814>] (ubifs_replay_journal+0xf68/0x145c)
>> [    4.493575]  r10:c30dc000 r9:00000000 r8:00000000 r7:0000006a r6:c30dcd40 r5:c30dcd24
>> [    4.501570]  r4:c323f280
>> [    4.504244] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
>> [    4.512967]  r10:c30dc008 r9:c31eb400 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c31f4000
>> [    4.520967]  r4:00000000
>> [    4.523633] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
>> [    4.530924]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31eb380
>> [    4.538924]  r4:c3108d00
>> [    4.541587] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
>> [    4.549256]  r6:00008001 r5:c31eb380 r4:c3108d00
>> [    4.554013] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
>> [    4.561772]  r9:00000060 r8:c31eb340 r7:c02498e8 r6:c31eb380 r5:00000000 r4:c0e2515c
>> [    4.569706] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
>> [    4.576816]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31eb380
>> [    4.584817]  r4:c31eb340
>> [    4.587471] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
>> [    4.595487]  r8:c0d60878 r7:c7d3ce00 r6:c31f0000 r5:c31f0000 r4:00008001
>> [    4.602337] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
>> [    4.610968]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
>> [    4.618969]  r4:c0d60888
>> [    4.621615] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
>> [    4.630680]  r6:c0d73d5c r5:c0e78000 r4:00000008
>> [    4.635435] [<c0d00d14>] (kernel_init_freeable) from [<c0979bd0>] (kernel_init+0x10/0x120)
>> [    4.643894]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979bc0
>> [    4.651887]  r4:00000000
>> [    4.654548] [<c0979bc0>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
>> [    4.662293]  r5:c0979bc0 r4:00000000
>> [    4.666405] UBIFS error (ubi0:2 pid 1): ubifs_get_pnode.part.4: calc num: 202
>> [    4.673985] UBIFS error (ubi0:2 pid 1): ubifs_update_one_lp: cannot update properties of LEB 822, error -22
>> [    4.697926] List of all partitions:
> Hmm, these are the logs _after_ the power-cut. I expected to see a failed ubifs_assert() right before the
> power-cut. Please note that an ubifs_assert() will not halt the kernel....
> Can you please check?

Here is the boot log just before ubifs corruption:

[    3.070267] ubi0: default fastmap pool size: 50
[    3.074995] ubi0: default fastmap WL pool size: 25
[    3.080242] ubi0: attaching mtd3
[    3.145809] random: fast init done
[    3.283860] ubi0: attached by fastmap
[    3.287949] ubi0: fastmap pool size: 50
[    3.291924] ubi0: fastmap WL pool size: 25
[    3.335435] ubi0: attached mtd3 (name "ubi", size 126 MiB)
[    3.341371] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    3.348586] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    3.355542] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    3.362808] ubi0: good PEBs: 1002, bad PEBs: 6, corrupted PEBs: 0
[    3.369206] ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128
[    3.376779] ubi0: max/mean erase counter: 179/22, WL threshold: 4096, image sequence number: 0
[    3.385595] ubi0: available PEBs: 0, total reserved PEBs: 1002, PEBs reserved for bad PEB handling: 14
[    3.395904] ubi0: background thread "ubi_bgt0d" started, PID 93
[    3.408968] rtc-ds1307 0-0068: hctosys: unable to read the hardware clock
[    3.419427] ALSA device list:
[    3.422686]   No soundcards found.
[    3.518643] UBIFS (ubi0:2): recovery needed
[    3.730665] UBIFS assert failed in ubifs_change_lp at 559 (pid 1)
[    3.737360] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #13
[    3.746182] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[    3.752746] Backtrace:
[    3.755367] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
[    3.763131]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
[    3.768941] [<c010c704>] (show_stack) from [<c03fcf18>] (dump_stack+0xb4/0xe8)
[    3.776376] [<c03fce64>] (dump_stack) from [<c0380854>] (ubifs_change_lp+0x69c/0x6f8)
[    3.784397]  r10:00010000 r9:c30dc990 r8:ffffff70 r7:c30dcc0c r6:c383e000 r5:c32299e0
[    3.792402]  r4:c30dc000 r3:00000000
[    3.796101] [<c03801b8>] (ubifs_change_lp) from [<c0371974>] (ubifs_replay_journal+0x10c8/0x145c)
[    3.805170]  r10:c30dc000 r9:00000000 r8:c30dcd2c r7:c30dcc0c r6:c383e000 r5:00000000
[    3.813164]  r4:c320e180
[    3.815838] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
[    3.824568]  r10:c30dc008 r9:c31d7c40 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c318a000
[    3.832570]  r4:00000000
[    3.835239] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
[    3.842524]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31d7bc0
[    3.850524]  r4:c3108b00
[    3.853189] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
[    3.860855]  r6:00008001 r5:c31d7bc0 r4:c3108b00
[    3.865617] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
[    3.873373]  r9:00000060 r8:c31d7b80 r7:c02498e8 r6:c31d7bc0 r5:00000000 r4:c0e2515c
[    3.881309] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
[    3.888416]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31d7bc0
[    3.896409]  r4:c31d7b80
[    3.899064] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
[    3.907079]  r8:c0d60878 r7:c7d3cac0 r6:c31d6000 r5:c31d6000 r4:00008001
[    3.913930] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
[    3.922561]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
[    3.930561]  r4:c0d60888
[    3.933209] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
[    3.942271]  r6:c0d73d5c r5:c0e78000 r4:00000008
[    3.947030] [<c0d00d14>] (kernel_init_freeable) from [<c0979bd0>] (kernel_init+0x10/0x120)
[    3.955486]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979bc0
[    3.963480]  r4:00000000
[    3.966137] [<c0979bc0>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
[    3.973884]  r5:c0979bc0 r4:00000000
[    3.981026] UBIFS (ubi0:2): recovery deferred
[    3.987526] UBIFS (ubi0:2): UBIFS: mounted UBI device 0, volume 2, name "rootfs", R/O mode
[    3.996046] UBIFS (ubi0:2): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    4.006596] UBIFS (ubi0:2): FS size: 114532352 bytes (109 MiB, 902 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
[    4.017640] UBIFS (ubi0:2): reserved for root: 0 bytes (0 KiB)
[    4.023638] UBIFS (ubi0:2): media format: w4/r0 (latest is w5/r0), UUID 83D3E2A3-0249-4C6A-94A7-2097C18695C1, small LPT model
[    4.039240] VFS: Mounted root (ubifs filesystem) readonly on device 0:12.
[    4.051410] devtmpfs: mounted
[    4.064159] Freeing unused kernel memory: 1024K
...
[    9.823378] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, PID 126
[   10.190926] UBIFS assert failed in pack_bits at 242 (pid 120)
[   10.197294] CPU: 0 PID: 120 Comm: mount Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #13
[   10.205952] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[   10.212515] Backtrace:
[   10.215142] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
[   10.222899]  r7:00000000 r6:600c0013 r5:00000000 r4:c0e29058
[   10.228716] [<c010c704>] (show_stack) from [<c03fcf18>] (dump_stack+0xb4/0xe8)
[   10.236150] [<c03fce64>] (dump_stack) from [<c037b2dc>] (pack_bits+0x1f4/0x200)
[   10.243649]  r10:0000b800 r9:ffffffee r8:c32bdd50 r7:c32bdd54 r6:00000001 r5:c831c860
[   10.251651]  r4:0000000e r3:00000000
[   10.255352] [<c037b0e8>] (pack_bits) from [<c037bf90>] (ubifs_pack_pnode+0x84/0x104)
[   10.263289]  r9:c831c853 r8:c831c851 r7:c32299e0 r6:c30dc000 r5:c32bdd54 r4:c32299c8
[   10.271233] [<c037bf0c>] (ubifs_pack_pnode) from [<c0385d50>] (ubifs_lpt_end_commit+0x27c/0x6fc)
[   10.280214]  r9:00000001 r8:c8311000 r7:00000011 r6:0000b862 r5:c3229980 r4:c30dc000
[   10.288148] [<c0385ad4>] (ubifs_lpt_end_commit) from [<c0373658>] (do_commit+0x244/0x80c)
[   10.296515]  r10:00000020 r9:00000020 r8:c3195dd4 r7:00000003 r6:c30dc2f0 r5:c30dc000
[   10.304514]  r4:00000000
[   10.307163] [<c0373414>] (do_commit) from [<c0373e70>] (ubifs_run_commit+0x9c/0xf0)
[   10.315001]  r8:00000000 r7:c30dcb48 r6:c30dc3e4 r5:c30dc42c r4:c30dc000
[   10.321856] [<c0373dd4>] (ubifs_run_commit) from [<c03823dc>] (ubifs_rcvry_gc_commit+0x7c/0x1d8)
[   10.330830]  r7:c30dcb48 r6:c3195c00 r5:c30dcb8c r4:c30dc000
[   10.336659] [<c0382360>] (ubifs_rcvry_gc_commit) from [<c0364700>] (ubifs_remount_fs+0x514/0x79c)
[   10.345731]  r7:c30dcb48 r6:c32a3c00 r5:c30dcb8c r4:c30dc000
[   10.351548] [<c03641ec>] (ubifs_remount_fs) from [<c0225188>] (do_remount_sb+0x6c/0x1d8)
[   10.359825]  r9:00000020 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:c318a000
[   10.367783] [<c022511c>] (do_remount_sb) from [<c0248f4c>] (do_mount+0x698/0xc84)
[   10.375452]  r8:c3108b10 r7:c02498e8 r6:c318a000 r5:00000000 r4:c318a044
[   10.382306] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
[   10.389416]  r10:00000000 r9:c32bc000 r8:c0ed0020 r7:01696860 r6:00000000 r5:c3214b40
[   10.397418]  r4:c3214e80
[   10.400075] [<c024986c>] (SyS_mount) from [<c0107e60>] (ret_fast_syscall+0x0/0x1c)
[   10.407832]  r8:c0108004 r7:00000015 r6:00000000 r5:00000000 r4:00000000
[   10.518251] systemd[1]: Started Journal Service.
[  OK  ] Started Journal Service.
[   10.608286] UBIFS assert failed in ubifs_garbage_collect_leb at 516 (pid 120)
[   10.615660] CPU: 0 PID: 120 Comm: mount Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #13
[   10.624281] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[   10.630846] Backtrace:
[   10.633465] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
[   10.641228]  r7:00000000 r6:600e0113 r5:00000000 r4:c0e29058
[   10.647047] [<c010c704>] (show_stack) from [<c03fcf18>] (dump_stack+0xb4/0xe8)
[   10.654483] [<c03fce64>] (dump_stack) from [<c0374b94>] (ubifs_garbage_collect_leb+0x768/0x7ac)
[   10.663383]  r10:000002d4 r9:c336f340 r8:c336f348 r7:c3195c24 r6:c3195c00 r5:c30dc000
[   10.671387]  r4:c32bde78 r3:00000000
[   10.675101] [<c037442c>] (ubifs_garbage_collect_leb) from [<c0382400>] (ubifs_rcvry_gc_commit+0xa0/0x1d8)
[   10.684876]  r10:00000020 r9:00000020 r8:00000000 r7:c3195c24 r6:c3195c00 r5:c30dcb8c
[   10.692873]  r4:c30dc000
[   10.695547] [<c0382360>] (ubifs_rcvry_gc_commit) from [<c0364700>] (ubifs_remount_fs+0x514/0x79c)
[   10.704621]  r7:c30dcb48 r6:c32a3c00 r5:c30dcb8c r4:c30dc000
[   10.710448] [<c03641ec>] (ubifs_remount_fs) from [<c0225188>] (do_remount_sb+0x6c/0x1d8)
[   10.718734]  r9:00000020 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:c318a000
[   10.726697] [<c022511c>] (do_remount_sb) from [<c0248f4c>] (do_mount+0x698/0xc84)
[   10.734371]  r8:c3108b10 r7:c02498e8 r6:c318a000 r5:00000000 r4:c318a044
[   10.741222] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
[   10.748331]  r10:00000000 r9:c32bc000 r8:c0ed0020 r7:01696860 r6:00000000 r5:c3214b40
[   10.756333]  r4:c3214e80
[   10.758986] [<c024986c>] (SyS_mount) from [<c0107e60>] (ret_fast_syscall+0x0/0x1c)
[   10.766745]  r8:c0108004 r7:00000015 r6:00000000 r5:00000000 r4:00000000
[   10.789614] UBIFS (ubi0:2): deferred recovery completed
...
[   11.890821] UBIFS assert failed in ubifs_change_lp at 559 (pid 111)
[   11.897728] CPU: 0 PID: 111 Comm: systemd-journal Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #13
[   11.907259] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[   11.913828] Backtrace:
[   11.916447] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
[   11.924207]  r7:00000000 r6:600f0013 r5:00000000 r4:c0e29058
[   11.930018] [<c010c704>] (show_stack) from [<c03fcf18>] (dump_stack+0xb4/0xe8)
[   11.937460] [<c03fce64>] (dump_stack) from [<c0380854>] (ubifs_change_lp+0x69c/0x6f8)
[   11.945489]  r10:0000fdb0 r9:c30dc990 r8:ffffff70 r7:000002d6 r6:c30dcc0c r5:c32299e0
[   11.953494]  r4:c30dc000 r3:00000000
[   11.957195] [<c03801b8>] (ubifs_change_lp) from [<c0380a80>] (ubifs_update_one_lp+0x84/0x150)
[   11.965922]  r10:000002d6 r9:c32e4000 r8:0000fdb0 r7:000002d6 r6:c30dcc0c r5:c30dc000
[   11.973916]  r4:00000000
[   11.976594] [<c03809fc>] (ubifs_update_one_lp) from [<c0364058>] (bud_wbuf_callback+0x20/0x28)
[   11.985409]  r8:0000024a r7:c3195e18 r6:00000250 r5:c30dc000 r4:c3195db0
[   11.992282] [<c0364038>] (bud_wbuf_callback) from [<c036935c>] (ubifs_wbuf_write_nolock+0x234/0x770)
[   12.001639] [<c0369128>] (ubifs_wbuf_write_nolock) from [<c035b6dc>] (ubifs_jnl_write_data+0x1a4/0x300)
[   12.011236]  r10:000002d6 r9:c3195c00 r8:c32e4000 r7:c329fd08 r6:0000024a r5:c30dc000
[   12.019231]  r4:00000000
[   12.021884] [<c035b538>] (ubifs_jnl_write_data) from [<c035db28>] (do_writepage+0x80/0x1a8)
[   12.030429]  r10:00008075 r9:c17dc000 r8:20000000 r7:c35db640 r6:00001000 r5:c30dc000
[   12.038430]  r4:c7d08b80
[   12.041075] [<c035daa8>] (do_writepage) from [<c035f50c>] (ubifs_writepage+0x174/0x240)
[   12.049275]  r10:c35db8b4 r9:00000000 r8:00000000 r7:c7d08b80 r6:800f0013 r5:00000200
[   12.057279]  r4:c35db640
[   12.059929] [<c035f398>] (ubifs_writepage) from [<c01df1b8>] (__writepage+0x1c/0x48)
[   12.067863]  r10:c329fe88 r9:00000000 r8:ffffffff r7:c35db774 r6:c7d08b80 r5:c35db774
[   12.075866]  r4:00000000
[   12.078516] [<c01df19c>] (__writepage) from [<c01df8e8>] (write_cache_pages+0x16c/0x3d0)
[   12.086789]  r5:c329fde0 r4:00000000
[   12.090486] [<c01df77c>] (write_cache_pages) from [<c01dfb94>] (generic_writepages+0x48/0x64)
[   12.099208]  r10:00000000 r9:7fffffff r8:ffffffff r7:00000000 r6:c35db774 r5:c329fe88
[   12.107206]  r4:c35db774
[   12.109854] [<c01dfb4c>] (generic_writepages) from [<c01e1c24>] (do_writepages+0x3c/0x40)
[   12.118216]  r5:7fffffff r4:ffffffff
[   12.121931] [<c01e1be8>] (do_writepages) from [<c01d4e38>] (__filemap_fdatawrite_range+0x7c/0xa4)
[   12.131018] [<c01d4dbc>] (__filemap_fdatawrite_range) from [<c01d4fb4>] (filemap_write_and_wait_range+0x3c/0x88)
[   12.141389]  r6:00000000 r5:c35db774 r4:c32c8b40
[   12.146148] [<c01d4f78>] (filemap_write_and_wait_range) from [<c035e290>] (ubifs_fsync+0x48/0xbc)
[   12.155223]  r9:7fffffff r8:ffffffff r7:00000000 r6:c30dc000 r5:c35db640 r4:c32c8b40
[   12.163180] [<c035e248>] (ubifs_fsync) from [<c025470c>] (vfs_fsync_range+0x60/0xb4)
[   12.171112]  r9:c329e000 r8:c35db640 r7:00000000 r6:00000000 r5:00000000 r4:c32c8b40
[   12.179044] [<c02546ac>] (vfs_fsync_range) from [<c02547d8>] (do_fsync+0x44/0x6c)
[   12.186713]  r9:c329e000 r8:c0108004 r7:00000076 r6:00000000 r5:c32c8b40 r4:c32c8b40
[   12.194644] [<c0254794>] (do_fsync) from [<c0254a94>] (SyS_fsync+0x14/0x18)
[   12.201750]  r6:00000006 r5:00000001 r4:814d5498
[   12.206513] [<c0254a80>] (SyS_fsync) from [<c0107e60>] (ret_fast_syscall+0x0/0x1c)
..

Complete boot log is available here[1]

[1] http://pastebin.com/BFxcxH1w

--
Bhuvan

>
> Do you face this issue also only with power-cuts? IOW when doing regular reboots it works just fine?
>
> Thanks,
> //richard
