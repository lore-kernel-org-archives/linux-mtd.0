Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cY6r6-0004Uo-N8
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2017 07:58:30 +0000
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
 <5a769de2-31f1-f011-c6bc-e94427407751@nod.at>
 <a27bc761-b8d2-4f69-468a-b9a4d61c68f8@toradex.com>
 <306876cd-0855-b9ee-659d-2164cfc3b2c4@nod.at>
 <877dea3c-717d-9b1a-c01d-537f3b46b2de@toradex.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <ff60b696-ffec-8ddd-16bd-407a9bacb3e0@nod.at>
Date: Mon, 30 Jan 2017 08:57:58 +0100
MIME-Version: 1.0
In-Reply-To: <877dea3c-717d-9b1a-c01d-537f3b46b2de@toradex.com>
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

Am 30.01.2017 um 06:48 schrieb Bhuvanchandra DV:
> [    9.823378] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, PID 126
> [   10.190926] UBIFS assert failed in pack_bits at 242 (pid 120)
> [   10.197294] CPU: 0 PID: 120 Comm: mount Not tainted 4.10.0-rc4-00016-g60124f748422-dirty #13
> [   10.205952] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
> [   10.212515] Backtrace:
> [   10.215142] [<c010c474>] (dump_backtrace) from [<c010c71c>] (show_stack+0x18/0x1c)
> [   10.222899]  r7:00000000 r6:600c0013 r5:00000000 r4:c0e29058
> [   10.228716] [<c010c704>] (show_stack) from [<c03fcf18>] (dump_stack+0xb4/0xe8)
> [   10.236150] [<c03fce64>] (dump_stack) from [<c037b2dc>] (pack_bits+0x1f4/0x200)
> [   10.243649]  r10:0000b800 r9:ffffffee r8:c32bdd50 r7:c32bdd54 r6:00000001 r5:c831c860
> [   10.251651]  r4:0000000e r3:00000000
> [   10.255352] [<c037b0e8>] (pack_bits) from [<c037bf90>] (ubifs_pack_pnode+0x84/0x104)
> [   10.263289]  r9:c831c853 r8:c831c851 r7:c32299e0 r6:c30dc000 r5:c32bdd54 r4:c32299c8
> [   10.271233] [<c037bf0c>] (ubifs_pack_pnode) from [<c0385d50>] (ubifs_lpt_end_commit+0x27c/0x6fc)
> [   10.280214]  r9:00000001 r8:c8311000 r7:00000011 r6:0000b862 r5:c3229980 r4:c30dc000
> [   10.288148] [<c0385ad4>] (ubifs_lpt_end_commit) from [<c0373658>] (do_commit+0x244/0x80c)
> [   10.296515]  r10:00000020 r9:00000020 r8:c3195dd4 r7:00000003 r6:c30dc2f0 r5:c30dc000
> [   10.304514]  r4:00000000
> [   10.307163] [<c0373414>] (do_commit) from [<c0373e70>] (ubifs_run_commit+0x9c/0xf0)
> [   10.315001]  r8:00000000 r7:c30dcb48 r6:c30dc3e4 r5:c30dc42c r4:c30dc000
> [   10.321856] [<c0373dd4>] (ubifs_run_commit) from [<c03823dc>] (ubifs_rcvry_gc_commit+0x7c/0x1d8)
> [   10.330830]  r7:c30dcb48 r6:c3195c00 r5:c30dcb8c r4:c30dc000
> [   10.336659] [<c0382360>] (ubifs_rcvry_gc_commit) from [<c0364700>] (ubifs_remount_fs+0x514/0x79c)
> [   10.345731]  r7:c30dcb48 r6:c32a3c00 r5:c30dcb8c r4:c30dc000
> [   10.351548] [<c03641ec>] (ubifs_remount_fs) from [<c0225188>] (do_remount_sb+0x6c/0x1d8)
> [   10.359825]  r9:00000020 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:c318a000
> [   10.367783] [<c022511c>] (do_remount_sb) from [<c0248f4c>] (do_mount+0x698/0xc84)
> [   10.375452]  r8:c3108b10 r7:c02498e8 r6:c318a000 r5:00000000 r4:c318a044
> [   10.382306] [<c02488b4>] (do_mount) from [<c02498e8>] (SyS_mount+0x7c/0xa4)
> [   10.389416]  r10:00000000 r9:c32bc000 r8:c0ed0020 r7:01696860 r6:00000000 r5:c3214b40
> [   10.397418]  r4:c3214e80
> [   10.400075] [<c024986c>] (SyS_mount) from [<c0107e60>] (ret_fast_syscall+0x0/0x1c)
> [   10.407832]  r8:c0108004 r7:00000015 r6:00000000 r5:00000000 r4:00000000
> [   10.518251] systemd[1]: Started Journal Service.

This is what I was looking for! :)
Let's see whether I can find the root cause with that issue, otherwise I'll create
a debug patch for you.

Thanks,
//richard
