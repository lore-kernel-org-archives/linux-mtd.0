Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRg7h-00005D-Qt
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 14:13:07 +0000
Subject: Re: UBI/UBIFS corruptions during random power-cuts
To: Bhuvanchandra DV "(by" way of Boris Brezillon
 "<boris.brezillon@free-electrons.com>)" <bhuvanchandra.dv@toradex.com>,
 linux-mtd@lists.infradead.org
References: <b5608215-347a-f9a0-aa71-33546d7eab1b@toradex.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <0500de05-b3d7-6cbc-0236-5d4c83a5f00f@nod.at>
Date: Thu, 12 Jan 2017 15:12:29 +0100
MIME-Version: 1.0
In-Reply-To: <b5608215-347a-f9a0-aa71-33546d7eab1b@toradex.com>
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

Hi!

Am 12.01.2017 um 14:31 schrieb Bhuvanchandra DV (by way of Boris Brezillon <boris.brezillon@free-electrons.com>):
> Hello!,
> 
> During random power-cuts we observe consistent UBI/UBIFS issues. After multiple
> random power-cuts UBIFS is getting corrupted and unable to recover from that.
> NAND flash driver(vf610_nfc) passed all mtd-tests and ubi-tests. Not sure how to
> trace the reason for the ubifs corruption, can any one point me to right direction
> to figure out the reason for the UBIFS corruptions. We also tried disabling fastmap
> (just to check) on both kernel and U-Boot but still observed the corruptions at
> random power-cuts.
> 
> Hardware: Toradex Colibri VF50[0]
> Kernel Version: 4.4.21-v2.6.1b1+g7ecc29c[1]
> U-Boot Version: U-Boot 2016.11+fslc+g1a0e06a[2]
> 
> Log:
> [    2.442196] ubi0: default fastmap pool size: 50
> [    2.456898] ubi0: default fastmap WL pool size: 25
> [    2.471518] ubi0: attaching mtd3
> 
> [    2.906123] ubi0: scanning is finished
> [    2.932290] ubi0: attached mtd3 (name "ubi", size 126 MiB)
> [    2.947186] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    2.963482] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    2.979836] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    2.996544] ubi0: good PEBs: 1002, bad PEBs: 6, corrupted PEBs: 0
> [    3.012452] ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    3.039141] ubi0: max/mean erase counter: 155/25, WL threshold: 4096, image sequence number: 543125357
> [    3.068568] ubi0: available PEBs: 12, total reserved PEBs: 990, PEBs reserved for bad PEB handling: 14
> [    3.098879] ubi0: background thread "ubi_bgt0d" started, PID 57
> [    3.117852] input: gpio-keys as /devices/platform/gpio-keys/input/input1
> [    3.138290] rtc-ds1307 0-0068: hctosys: unable to read the hardware clock
> [    3.174546] ALSA device list:
> [    3.189044]   No soundcards f
> ound.
> [    3.237056] UBIFS (ubi0:2): recovery needed
> [    3.427633] UBIFS error (ubi0:2 pid 1): ubifs_read_node: bad node type (255 but expected 3)
> [    3.459103] UBIFS error (ubi0:2 pid 1): ubifs_read_node: bad node at LEB 766:122880, LEB mapping status 1
> [    3.491918] Not a node, first 24 bytes:
> [    3.496028] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................
> [    3.545462] CPU: 0 PID: 1 Comm: swapper Not tainted 4.4.21-v2.6.1b1+g7ecc29c #1
> [    3.577996] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
> [    3.597521] Backtrace:
> [    3.612914] [<80013474>] (dump_backtrace) from [<8001366c>] (show_stack+0x18/0x1c)
> [    3.646116]  r7:00000001 r6:000002fe r5:86b7b000 r4:0001e000
> [    3.665272] [<80013654>] (show_stack) from [<802a0d8c>] (dump_stack+0x24/0x28)
> [    3.698033] [<802a0d68>] (dump_stack) from [<80220594>] (ubifs_read
> _node+0x29c/0x318)
> [    3.731419] [<802202f8>] (ubifs_read_node) from [<802206b8>] (ubifs_read_node_wbuf+0xa8/0x2d0)
> [    3.765910]  r10:00000049 r9:00000003 r8:86b7b000 r7:8605c980 r6:000002fe r5:86015720
> [    3.800438]  r4:0001e000
> [    3.816229] [<80220610>] (ubifs_read_node_wbuf) from [<8023db64>] (ubifs_tnc_read_node+0x50/0x144)
> [    3.852151]  r10:86056b00 r9:8605c980 r8:86056b48 r7:00000003 r6:8605c980 r5:86b7b000
> [    3.887366]  r4:86056b78
> [    3.903213] [<8023db14>] (ubifs_tnc_read_node) from [<80221814>] (tnc_read_node_nm+0xcc/0x1e8)
> [    3.938730]  r7:86b7b1e8 r6:86b7b000 r5:8605c980 r4:86056b78
> [    3.958487] [<80221748>] (tnc_read_node_nm) from [<8022507c>] (ubifs_tnc_next_ent+0x144/0x1a8)
> [    3.993901]  r7:86b7b1e8 r6:86b7b000 r5:86843c18 r4:00000048
> [    4.013594] [<80224f38>] (ubifs_tnc_next_ent) from [<80225194>] (ubifs_tnc_remove_ino+0xb4/0x144)
> [    4.049499]  r10:86b7b960 r9:00008b9d r8:ffffffff r7:00000000 r6:8604b380 r5:86b7b000
> [    4.084965]  r4:
> 8604bc60
> [    4.100908] [<802250e0>] (ubifs_tnc_remove_ino) from [<80227d28>] (ubifs_replay_journal+0xe80/0x14c8)
> [    4.136758]  r10:86b7b960 r9:86843cf0 r8:8604bc40 r7:86b7b000 r6:8604b380 r5:00000000
> [    4.171625]  r4:8604bc60
> [    4.187099] [<80226ea8>] (ubifs_replay_journal) from [<8021ca40>] (ubifs_mount+0x118c/0x183c)
> [    4.221308]  r10:00000002 r9:00000000 r8:86011580 r7:86b7b000 r6:86028800 r5:86011580
> [    4.255908]  r4:86b7b7d0
> [    4.271430] [<8021b8b4>] (ubifs_mount) from [<800cd5c4>] (mount_fs+0x1c/0xac)
> [    4.291814]  r10:8085d6fc r9:808550cc r8:00000000 r7:8085d6fc r6:8085d6fc r5:86011500
> [    4.325815]  r4:8021b8b4
> [    4.341252] [<800cd5a8>] (mount_fs) from [<800e5554>] (vfs_kern_mount+0x50/0xfc)
> [    4.374139]  r6:00008001 r5:86011500 r4:86b5ae40
> [    4.391862] [<800e5504>] (vfs_kern_mount) from [<800e8070>] (do_mount+0x1a8/0xbc4)
> [    4.424750]  r9:808550cc r8:860114c0 r7:86011500 r6:00008001 r5:00000060 r4:00000000
> [    4.458487] [<800e7ec8>] (do_
> mount) from [<800e8e0c>] (SyS_mount+0x9c/0xc8)
> [    4.478608]  r10:87db24e0 r9:80756f74 r8:00008001 r7:80756f74 r6:00000000 r5:86011500
> [    4.512618]  r4:860114c0
> [    4.528003] [<800e8d70>] (SyS_mount) from [<808142c0>] (mount_block_root+0x140/0x268)
> [    4.561158]  r8:00008001 r7:86027000 r6:86027000 r5:8083e858 r4:86027000
> [    4.581212] [<80814180>] (mount_block_root) from [<808145c0>] (prepare_namespace+0xa4/0x1a0)
> [    4.615653]  r10:8083e838 r9:00000008 r8:80813600 r7:8083e834 r6:80882280 r5:8083e868
> [    4.650031]  r4:8083e858
> [    4.665290] [<8081451c>] (prepare_namespace) from [<80813eec>] (kernel_init_freeable+0x1d0/0x1e0)
> [    4.700190]  r5:80882280 r4:8080f308
> [    4.716823] [<80813d1c>] (kernel_init_freeable) from [<805f2cb8>] (kernel_init+0x10/0xf0)
> [    4.750876]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:805f2ca8
> [    4.785419]  r4:00000000
> [    4.801082] [<805f2ca8>] (kernel_init) from [<8000f7f8>] (ret_from_fork+0x14/0x3c)
> [    4
> .834654]  r5:805f2ca8 r4:00000000
> [    4.853272] List of all partitions:
> [    4.869394] No filesystem could mount root, tried:  ubifs
> [    4.887532] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> [    4.919980] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

Please give this patch a try:
http://lists.infradead.org/pipermail/linux-mtd/2017-January/071469.html

Thanks,
//richard
