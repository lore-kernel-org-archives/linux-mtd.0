Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cptCV-0002hR-CS
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 09:02:27 +0000
Subject: Re: UBIFS: Failed to read/write file when contiguous pages are not
 enough
To: yhb@ruijie.com.cn, linux-mtd@lists.infradead.org
References: <80B78A8B8FEE6145A87579E8435D78C307980BFA@FZEX3.ruijie.com.cn>
Cc: dedekind1@gmail.com, yushouhua@ruijie.com.cn, dengwenjie@ruijie.com.cn,
 huangcb@ruijie.com.cn, jiangxh@ruijie.com.cn
From: Richard Weinberger <richard@nod.at>
Message-ID: <92df8ed2-ba8f-c419-d82a-d85672c9d145@nod.at>
Date: Mon, 20 Mar 2017 10:01:36 +0100
MIME-Version: 1.0
In-Reply-To: <80B78A8B8FEE6145A87579E8435D78C307980BFA@FZEX3.ruijie.com.cn>
Content-Type: text/plain; charset=gbk
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

Am 20.03.2017 um 09:23 schrieb yhb@ruijie.com.cn:
> There is only one memory zone:
> DMA32 free:88712kB min:45568kB low:56960kB high:68352kB active_anon:490248kB inactive_anon:192712kB active_file:8852kB inactive_file:21268kB unevictable:0kB isolated(anon):56kB isolated(file):3272kB present:2028660kB mlocked:0kB dirty:24512kB writeback:20kB mapped:16960kB shmem:17936kB slab_reclaimable:5160kB slab_unreclaimable:1147384kB kernel_stack:12736kB pagetables:8428kB unstable:0kB bounce:0kB writeback_tmp:0kB pages_scanned:52723 all_unreclaimable? yes
> lowmem_reserve[]: 0 0 0
> DMA32: 19314*4kB 982*8kB 191*16kB 15*32kB 1*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB 0*8192kB 0*16384kB 0*32768kB = 88712kB
> The number of free pages is above high watermark, but the number of the free pages with order >= 1 is below half of min watermark.
> 
> UBIFS need allocate two contiguous pages when it reads file.
> do_readpage():
> dn = kmalloc(UBIFS_MAX_DATA_NODE_SZ, GFP_NOFS);
> 
> UBIFS need allocate four contiguous pages when it writes file.
> do_writepage -> ubifs_jnl_write_data:
> data = kmalloc(dlen, GFP_NOFS | __GFP_NOWARN);
> 
> When the free pages with order >= 1 are not enough, many processes hang in the page fault handler.
>  Call Trace:
> [<a80000008a947560 : ffffffff8010d4c8>] schedule+0x348/0x980
> [<a80000008a947620 : ffffffff8010de9c>] schedule_timeout+0x174/0x228
> [<a80000008a9476a0 : ffffffff8010cd54>] io_schedule_timeout+0x6c/0x108
> [<a80000008a9476c0 : ffffffff8035394c>] congestion_wait+0x7c/0xa8
> [<a80000008a947710 : ffffffff8034bf64>] shrink_zone+0xbac/0xea8
> [<a80000008a9478f0 : ffffffff8034ccfc>] do_try_to_free_pages+0xf4/0x428
> [<a80000008a947960 : ffffffff8034d128>] try_to_free_pages+0x68/0x78
> [<a80000008a9479c0 : ffffffff80344730>] __alloc_pages_nodemask+0x358/0x5f8
> [<a80000008a947aa0 : ffffffff8036faf4>] cache_alloc_refill+0x3ac/0x730
> [<a80000008a947b10 : ffffffff80370098>] kmem_cache_alloc+0xd0/0xd8
> [<a80000008a947b40 : ffffffff80410c54>] do_readpage+0x15c/0x3d8
> [<a80000008a947ba0 : ffffffff804118a4>] ubifs_readpage+0x5c/0x3f0
> [<a80000008a947c40 : ffffffff8033df2c>] filemap_fault+0x294/0x410
> [<a80000008a947c90 : ffffffff803568c0>] __do_fault+0x70/0x738
> [<a80000008a947d30 : ffffffff803596b8>] handle_mm_fault+0x1e0/0xf80
> [<a80000008a947dc0 : ffffffff802dee5c>] do_page_fault+0x13c/0x388
> [<a80000008a947e80 : ffffffff80100980>] ret_from_exception+0x0/0x8
> 
> UBIFS needs improvement: do not allocate contiguous pages.

Please more details. :)

>From a quick review I assume that your machine ran out of memory and the
kmalloc() in UBIFS was the first one that noticed. Another kmalloc()
what needs more than one page would fail too.

Or does this only happen when the kernel tries to produce free memory
in the writeback path?

Thanks,
//richard
