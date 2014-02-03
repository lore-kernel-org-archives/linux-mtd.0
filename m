Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAHIQ-0005NB-07
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2014 11:02:37 +0000
Message-ID: <52EF772D.8080207@nod.at>
Date: Mon, 03 Feb 2014 12:02:05 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Am 03.02.2014 11:31, schrieb Wiedemer, Thorsten (Lawo AG):
> Hi,
> 
> here the log of the kernel oops:
> 
> Dec 25 03:59:22 kernel: Unable to handle kernel NULL pointer dereference at virtual address 0000000c  
> Dec 25 03:59:22 kernel: pgd = c7148000  
> Dec 25 03:59:22 kernel: [0000000c] *pgd=8709b831, *pte=00000000, *ppte=00000000  
> Dec 25 03:59:22 kernel: Internal error: Oops: 17 [#1] PREEMPT ARM  
> Dec 25 03:59:22 kernel: Modules linked in:  
> Dec 25 03:59:22 kernel: CPU: 0    Tainted: G           O  (3.6.11 #1)  
> Dec 25 03:59:22 kernel: PC is at __up_write+0x3c/0x1a8  
> Dec 25 03:59:22 kernel: LR is at __up_write+0x24/0x1a8  
> Dec 25 03:59:22 kernel: pc : [<c0229400>]    lr : [<c02293e8>]    psr: a0000093  
> Dec 25 03:59:22 kernel: sp : c7225cc8  ip : 00020000  fp : c79fba00  
> Dec 25 03:59:22 kernel: r10: 00000523  r9 : 00000001  r8 : c7b33000  
> Dec 25 03:59:22 kernel: r7 : c793a800  r6 : c7bd473c  r5 : c7bd4738  r4 : c7bd4720  
> Dec 25 03:59:22 kernel: r3 : 00000000  r2 : 00000002  r1 : 00000001  r0 : 00000002  
> Dec 25 03:59:22 kernel: Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user  
> Dec 25 03:59:22 kernel: Control: 0005317f  Table: 87148000  DAC: 00000015  
> Dec 25 03:59:22 kernel: Process Master (pid: 739, stack limit = 0xc7224270)  
> Dec 25 03:59:22 kernel: Stack: (0xc7225cc8 to 0xc7226000)  
> Dec 25 03:59:22 kernel: 5cc0:                   c7b33000 60000013 00001000 c7bd4720 c7224038 00000523  
> Dec 25 03:59:22 kernel: 5ce0: c793a800 c7b33000 00000001 00000523 c79fba00 c02d0618 0001e800 0000071c  
> Dec 25 03:59:22 kernel: 5d00: 00000523 00000000 c793a800 c02d0d10 00000800 00000523 00000001 c7271700  
> Dec 25 03:59:22 kernel: 5d20: 00000000 c7b33000 00000000 c7b2f1a8 00000a28 00000523 00000001 c01e03e4  
> Dec 25 03:59:22 kernel: 5d40: 00000000 00000800 00000523 00000001 00000080 c7b33000 c7592a90 c7abd504  
> Dec 25 03:59:22 kernel: 5d60: c7abd4b4 c02cfbd4 00000800 00000800 c7b2f000 c7b33000 00000800 00000523  
> Dec 25 03:59:22 kernel: 5d80: c7abd508 c01da97c 00000800 c7abd4b4 c7b33000 c7abd490 c7b2f000 c7abd490  
> Dec 25 03:59:22 kernel: 5da0: c7b2f000 00000800 00000538 c01db54c 00000800 00000000 c7abd4b4 00000001  
> Dec 25 03:59:22 kernel: 5dc0: 00000090 c7b2f000 c7abd490 c01dcc00 00000000 c7592a90 c7b2f000 c7592aec  
> Dec 25 03:59:22 kernel: 5de0: 00000000 00000725 c72850a0 c7592a90 00000001 c01d1238 00000724 00000000  
> Dec 25 03:59:22 kernel: 5e00: 00000000 00000724 00000000 00000725 00000000 c00eee08 00000724 00000000  
> Dec 25 03:59:22 kernel: 5e20: 00000000 c7225ec8 c72850a0 00000000 00000000 c0096b68 00000725 00000000  
> Dec 25 03:59:22 kernel: 5e40: 00000000 00000000 c7b2f000 c7225ec8 00000001 c7225ec0 00000000 c7592bd0  
> Dec 25 03:59:22 kernel: 5e60: b427e578 c01d2444 00000000 00000000 7e711374 0000000b 0009e016 c7592a90  
> Dec 25 03:59:22 kernel: 5e80: 00000000 00100000 00000000 00000000 00000000 000000a0 c7225f88 c72850a0  
> Dec 25 03:59:22 kernel: 5ea0: fffffdee 00000725 c71c20a0 c7224000 00000000 c00c41a0 00000000 00000000  
> Dec 25 03:59:22 kernel: 5ec0: ae59a748 00000725 00000000 00000000 00000000 00000001 ffffffff c72850a0  
> Dec 25 03:59:22 kernel: 5ee0: 00000000 00000000 00000000 00000000 c71c20a0 00000000 00000000 00000000  
> Dec 25 03:59:22 kernel: 5f00: 00000725 00000000 00000000 00000000 00000725 00000000 00000725 00000000  
> Dec 25 03:59:22 kernel: 5f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000  
> Dec 25 03:59:22 kernel: 5f40: 00000000 00000000 c72850a0 ae59a748 c7225f88 ae59a748 00000725 c00c48c0  
> Dec 25 03:59:22 kernel: 5f60: c72850a0 c00c5d04 00000000 00000000 c72850a0 ae59a748 00000725 c00c4bbc  
> Dec 25 03:59:22 kernel: 5f80: 00000022 00000001 00000000 00000000 00000725 00000725 b427e500 00000004  
> Dec 25 03:59:22 kernel: 5fa0: c0012f48 c0012dc0 00000725 00000725 0000002b ae59a748 00000725 b45a2ab0  
> Dec 25 03:59:22 kernel: 5fc0: 00000725 00000725 b427e500 00000004 b427e670 b427e62c b45be628 b427e578  
> Dec 25 03:59:22 kernel: 5fe0: 00000000 b427e460 b6c652a8 b6c65a24 80000010 0000002b 00000000 00000000  
> Dec 25 03:59:22 kernel: [<c0229400>] (__up_write+0x3c/0x1a8) from [<c02d0618>] (leb_write_unlock+0x74/0xf0)  
> Dec 25 03:59:22 kernel: [<c02d0618>] (leb_write_unlock+0x74/0xf0) from [<c02d0d10>] (ubi_eba_write_leb+0x94/0x820)  
> Dec 25 03:59:22 kernel: [<c02d0d10>] (ubi_eba_write_leb+0x94/0x820) from [<c02cfbd4>] (ubi_leb_write+0xc4/0xe8)  
> Dec 25 03:59:22 kernel: [<c02cfbd4>] (ubi_leb_write+0xc4/0xe8) from [<c01da97c>] (ubifs_leb_write+0x9c/0x144)  
> Dec 25 03:59:22 kernel: [<c01da97c>] (ubifs_leb_write+0x9c/0x144) from [<c01db54c>] (ubifs_wbuf_sync_nolock+0xf0/0x360)  
> Dec 25 03:59:22 kernel: [<c01db54c>] (ubifs_wbuf_sync_nolock+0xf0/0x360) from [<c01dcc00>] (ubifs_sync_wbufs_by_inode+0xac/0xe8)  
> Dec 25 03:59:22 kernel: [<c01dcc00>] (ubifs_sync_wbufs_by_inode+0xac/0xe8) from [<c01d1238>] (ubifs_fsync+0x78/0xb4)  
> Dec 25 03:59:22 kernel: [<c01d1238>] (ubifs_fsync+0x78/0xb4) from [<c00eee08>] (generic_write_sync+0x70/0xa0)  
> Dec 25 03:59:22 kernel: [<c00eee08>] (generic_write_sync+0x70/0xa0) from [<c0096b68>] (generic_file_aio_write+0xb0/0xd4)  
> Dec 25 03:59:22 kernel: [<c0096b68>] (generic_file_aio_write+0xb0/0xd4) from [<c01d2444>] (ubifs_aio_write+0xf8/0x18c)  
> Dec 25 03:59:22 kernel: [<c01d2444>] (ubifs_aio_write+0xf8/0x18c) from [<c00c41a0>] (do_sync_write+0x9c/0xd0)  
> Dec 25 03:59:22 kernel: [<c00c41a0>] (do_sync_write+0x9c/0xd0) from [<c00c48c0>] (vfs_write+0x9c/0x148)  
> Dec 25 03:59:22 kernel: [<c00c48c0>] (vfs_write+0x9c/0x148) from [<c00c4bbc>] (sys_write+0x38/0x78)  
> Dec 25 03:59:22 kernel: [<c00c4bbc>] (sys_write+0x38/0x78) from [<c0012dc0>] (ret_fast_syscall+0x0/0x2c)  
> Dec 25 03:59:22 kernel: Code: e4863004 e5953004 e1560003 0a00002a (e593200c)   
> Dec 25 03:59:22 kernel: ---[ end trace 3a4c18efd3a1d78b ]---  
> Dec 25 03:59:22 kernel: note: Master[739] exited with preempt_count 2  
> 
> This was a remote log via udp, so the lines were a bit misordered and theoretically there may be missing lines. But I reordered it and I think it's complete.
> 
> Would be great if you have some hints.

How reliable can you reproduce this?
Last time Artem thought that it looks like a memory corruption.
Maybe due to a race. Can you reproduce this without preemption? CONFIG_PREEMPT_NONE=y?

Thanks,
//richard
