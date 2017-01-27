Received: from mail-he1eur01on0131.outbound.protection.outlook.com
 ([104.47.0.131] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWzeE-0004Rs-K8
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2017 06:04:37 +0000
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
Message-ID: <4fa488b7-0d1b-2888-2f26-53cc2d2876de@toradex.com>
Date: Fri, 27 Jan 2017 11:30:34 +0530
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

I cleaned all the earlier boot logs of the test. Need to rerun the power-cut test to cpature the boot
logs. Will share the relevant logs ASAP.

>
> Do you face this issue also only with power-cuts? IOW when doing regular reboots it works just fine?

So far only tested with external power-cuts.

--
Bhuvan

>
> Thanks,
> //richard
