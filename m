Received: from mail-db5eur01on0095.outbound.protection.outlook.com
 ([104.47.2.95] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbgtM-0008Cw-Te
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 05:03:39 +0000
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
 <17f16834-e200-60c7-62d4-b083b00335ac@toradex.com>
 <24fa997a-ba80-efb7-231d-8d4fddcd954d@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Message-ID: <ce043ab8-2a2b-804d-ac22-67d404fc5578@toradex.com>
Date: Thu, 9 Feb 2017 10:29:17 +0530
MIME-Version: 1.0
In-Reply-To: <24fa997a-ba80-efb7-231d-8d4fddcd954d@nod.at>
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

Richard,

On 02/09/2017 03:40 AM, Richard Weinberger wrote:

> Bhuvan,
>
> Am 06.02.2017 um 07:10 schrieb Bhuvanchandra DV:
>> Here is the log with debug patch:
>>
>> [    3.244581] ubi0: attached by fastmap
>> [    3.248432] ubi0: fastmap pool size: 50
>> [    3.252617] ubi0: fastmap WL pool size: 25
>> [    3.296085] ubi0: attached mtd3 (name "ubi", size 126 MiB)
>> [    3.302006] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    3.309050] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    3.316151] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    3.323429] ubi0: good PEBs: 1000, bad PEBs: 8, corrupted PEBs: 0
>> [    3.329677] ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    3.337233] ubi0: max/mean erase counter: 276/31, WL threshold: 4096, image sequence number: 0
>> [    3.346200] ubi0: available PEBs: 0, total reserved PEBs: 1000, PEBs reserved for bad PEB handling: 12
>> [    3.356545] ubi0: background thread "ubi_bgt0d" started, PID 93
>> [    3.369408] rtc-ds1307 0-0068: hctosys: unable to read the hardware clock
>> [    3.379847] ALSA device list:
>> [    3.383366]   No soundcards found.
>> [    3.486183] UBIFS (ubi0:2): recovery needed
>> [    3.806677] ------------[ cut here ]------------
>> [    3.811542] WARNING: CPU: 0 PID: 1 at fs/ubifs/replay.c:143 ubifs_replay_journal+0x1434/0x14bc
>> [    3.820907] Modules linked in:
>> [    3.824313] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #14
>> [    3.833124] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>> [    3.839689] Backtrace:
>> [    3.842309] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
>> [    3.850066]  r7:00000000 r6:60000013 r5:00000000 r4:c0e29058
>> [    3.855877] [<c010c704>] (show_stack) from [<c03fcf78>] (dump_stack+0xb4/0xe8)
>> [    3.863297] [<c03fcec4>] (dump_stack) from [<c0125f64>] (__warn+0xd8/0x104)
>> [    3.870405]  r10:c30dc000 r9:c0371ce0 r8:c0c1e4a0 r7:0000008f r6:00000009 r5:00000000
>> [    3.878408]  r4:00000000 r3:00000000
>> [    3.882105] [<c0125e8c>] (__warn) from [<c0126044>] (warn_slowpath_null+0x28/0x30)
>> [    3.889865]  r9:00000000 r8:c30dcd2c r7:c30dcc0c r6:ffffff58 r5:c322c498 r4:c320e180
>> [    3.897801] [<c012601c>] (warn_slowpath_null) from [<c0371ce0>] (ubifs_replay_journal+0x1434/0x14bc)
>> [    3.907163] [<c03708ac>] (ubifs_replay_journal) from [<c03662ac>] (ubifs_mount+0x13d8/0x17d8)
>> [    3.915891]  r10:c30dc008 r9:c31d7c80 r8:c30dcb48 r7:00000000 r6:c30dc000 r5:c318a000
>> [    3.923885]  r4:00000000
>> [    3.926555] [<c0364ed4>] (ubifs_mount) from [<c022558c>] (mount_fs+0x1c/0xb0)
>> [    3.933842]  r10:00008001 r9:00000000 r8:c0248a04 r7:c0e2515c r6:c0e2515c r5:c31d7c40
>> [    3.941841]  r4:c3108b00
>> [    3.944505] [<c0225570>] (mount_fs) from [<c0244bd4>] (vfs_kern_mount+0x5c/0x134)
>> [    3.952164]  r6:00008001 r5:c31d7c40 r4:c3108b00
>> [    3.956926] [<c0244b78>] (vfs_kern_mount) from [<c0248a04>] (do_mount+0x150/0xc84)
>> [    3.964681]  r9:00000060 r8:c31d7280 r7:c02498e8 r6:c31d7c40 r5:00000000 r4:c0e2515c
>> [    3.972616] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
>> [    3.979725]  r10:c0d00604 r9:c0d60888 r8:00008001 r7:c0bf5644 r6:00000000 r5:c31d7c40
>> [    3.987721]  r4:c31d7280
>> [    3.990370] [<c024986c>] (SyS_mount) from [<c0d0121c>] (mount_block_root+0x10c/0x274)
>> [    3.998384]  r8:c0d60878 r7:c7d3cac0 r6:c31d6000 r5:c31d6000 r4:00008001
>> [    4.005239] [<c0d01110>] (mount_block_root) from [<c0d01644>] (prepare_namespace+0x98/0x1d0)
>> [    4.013870]  r10:c0d00604 r9:c0d60858 r8:c0d60854 r7:c0e78000 r6:c0d60878 r5:c0d60878
>> [    4.021868]  r4:c0d60888
>> [    4.024515] [<c0d015ac>] (prepare_namespace) from [<c0d00ec0>] (kernel_init_freeable+0x1ac/0x1f8)
>> [    4.033572]  r6:c0d73d5c r5:c0e78000 r4:00000008
>> [    4.038327] [<c0d00d14>] (kernel_init_freeable) from [<c0979c30>] (kernel_init+0x10/0x120)
>> [    4.046777]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0979c20
>> [    4.054770]  r4:00000000
>> [    4.057426] [<c0979c20>] (kernel_init) from [<c0107ef0>] (ret_from_fork+0x14/0x24)
>> [    4.065165]  r5:c0979c20 r4:00000000
>> [    4.069239] ---[ end trace 0340b4f2891a36dc ]---
>> [    4.074236] UBIFS error (ubi0:2 pid 1): ubifs_replay_journal: LEB 819 lp free: 0 lp dirty: 126808 b free: 22528 b dirty: 96 dirty: -168
> Hmm, so it really underflows. ;-\
>
> Just in case, you can trigger this also with a fresh filesystem?
> Or did you always keep the same one?

Yes, I triggered it with fresh filesystem.

--
Bhuvan

>
> Thanks,
> //richard
