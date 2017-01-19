Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cU8iY-0004nK-Pw
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 09:09:21 +0000
Subject: Re: UBI/UBIFS corruptions during random power-cuts
To: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
 linux-mtd@lists.infradead.org
References: <b5608215-347a-f9a0-aa71-33546d7eab1b@toradex.com>
 <0500de05-b3d7-6cbc-0236-5d4c83a5f00f@nod.at>
 <961abad6-7d46-4427-fb2b-97477a4a6a10@toradex.com>
 <2be57b2b-8fad-a987-8257-18f8ea024621@nod.at>
 <89cd8327-581b-4285-d9ae-138d800211cf@toradex.com>
 <bceb976b-0aac-fe04-a540-f24823366233@nod.at>
 <c5cc6f86-fb4e-cdb4-8b0b-10d4dfd33735@toradex.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5a769de2-31f1-f011-c6bc-e94427407751@nod.at>
Date: Thu, 19 Jan 2017 10:08:49 +0100
MIME-Version: 1.0
In-Reply-To: <c5cc6f86-fb4e-cdb4-8b0b-10d4dfd33735@toradex.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bhuvan,

Am 19.01.2017 um 06:36 schrieb Bhuvanchandra DV:
> Hi Richard,
> 
> On 01/18/2017 01:28 PM, Richard Weinberger wrote:
> 
>> Am 18.01.2017 um 06:11 schrieb Bhuvanchandra DV:
>>>> Also apply this patch:
>>>> http://lists.infradead.org/pipermail/linux-mtd/2017-January/071264.html
>>> Along with this patch there are no corruptions occurred so far, power-cut tests are running fine
>>> since few days. Will update if any issues are observed.
>> Good to know. :-)
> 
> Unfortunately today in one of the test setup UBIFS got corrupted, this time the stack trace is with
> 'ubifs_get_pnode'.
> 
> ...
> [    3.885175] UBIFS error (ubi0:2 pid 1): ubifs_get_pnode.part.4: error -22 reading pnode at 8:28985
> [    3.894717] (pid 1) dumping pnode:
> [    3.898540]  address c3234680 parent c3234600 cnext 0
> [    3.903749]  flags 0 iip 3 level 0 num 0
> [    3.907973]  0: free 51200 dirty 131032 flags 1 lnum 0
> [    3.913258]  1: free 0 dirty 118032 flags 34 lnum 0
> [    3.918469]  2: free 92160 dirty 22752 flags 34 lnum 0
> [    3.923755]  3: free 40960 dirty 71672 flags 34 lnum 0
> [    3.929205] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc4-00016-g60124f7 #11
> [    3.937052] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
> [    3.943621] Backtrace:
> [    3.946247] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
> [    3.954009]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
> [    3.959822] [<c010c704>] (show_stack) from [<c03fcf38>] (dump_stack+0xb4/0xe8)
> [    3.967250] [<c03fce84>] (dump_stack) from [<c037bc00>] (ubifs_get_pnode.part.4+0x230/0x2b0)
> [    3.975882]  r10:c3210e00 r9:00000008 r8:00000006 r7:c3234600 r6:00000003 r5:c30dc000
> [    3.983883]  r4:c3234680 r3:00000000
> [    3.987584] [<c037b9d0>] (ubifs_get_pnode.part.4) from [<c037d604>] (ubifs_lpt_lookup_dirty+0x254/0x2a8)
> [    3.997265]  r10:00000357 r9:00013800 r8:00000006 r7:c3232b80 r6:0000034c r5:c30dc000
> [    4.005262]  r4:00000000
> [    4.007915] [<c037d3b0>] (ubifs_lpt_lookup_dirty) from [<c0380a3c>] (ubifs_update_one_lp+0x40/0x150)
> [    4.017246]  r10:00000357 r9:00013800 r8:80000001 r7:00000357 r6:c30dcc0c r5:c30dc000
> [    4.025249]  r4:00000091 r3:00000000
> [    4.028948] [<c03809fc>] (ubifs_update_one_lp) from [<c036dbc8>] (ubifs_tnc_add+0x124/0x140)
> [    4.037578]  r8:c30dc000 r7:c323c830 r6:c323c830 r5:00000006 r4:c30dc478
> [    4.044424] [<c036daa4>] (ubifs_tnc_add) from [<c0371814>] (ubifs_replay_journal+0xf68/0x145c)
> [    4.053230]  r10:c30dc000 r9:00000000 r8:00200000 r7:0000006a r6:c30dcd40 r5:c30dcd24
> [    4.061229]  r4:c321b980
> [    4.063899] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
> [    4.072624]  r10:c30dc008 r9:c31d7d00 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c318a000
> [    4.080625]  r4:00000000
> [    4.083290] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
> [    4.090578]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31d7c80
> [    4.098580]  r4:c3108b00
> [    4.101245] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
> [    4.108912]  r6:00008001 r5:c31d7c80 r4:c3108b00
> [    4.113675] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
> [    4.121428]  r9:00000060 r8:c31d7300 r7:c02498e8 r6:c31d7c80 r5:00000000 r4:c0e2515c
> [    4.129364] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
> [    4.136471]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31d7c80
> [    4.144465]  r4:c31d7300
> [    4.147120] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
> [    4.155135]  r8:c0d60878 r7:c7d3cac0 r6:c31d6000 r5:c31d6000 r4:00008001
> [    4.161987] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
> [    4.170616]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
> [    4.178616]  r4:c0d60888
> [    4.181264] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
> [    4.190327]  r6:c0d73d5c r5:c0e78000 r4:00000008
> [    4.195086] [<c0d00d14>] (kernel_init_freeable) from [<c0979bf0>] (kernel_init+0x10/0x120)
> [    4.203543]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979be0
> [    4.211534]  r4:00000000
> [    4.214185] [<c0979be0>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
> [    4.221931]  r5:c0979be0 r4:00000000
> [    4.227189] UBIFS error (ubi0:2 pid 1): ubifs_get_pnode.part.4: calc num: 211
> [    4.234585] UBIFS error (ubi0:2 pid 1): ubifs_update_one_lp: cannot update properties of LEB 855, error -22
> ....
> 
> Complete boot log is available here[1]
> 
> [1] http://pastebin.com/2Sg3SQWg

Hmm, this is something different.
A LPT entry accounts more dirty spaces than LEB size.

Can you please enable the UBIFS debugfs "chk_lprops" knob?
Either via userspace or just set the flag in source.

Please watch out of ubifs assert message. UBIFS will *not* abort.

Thanks,
//richard
