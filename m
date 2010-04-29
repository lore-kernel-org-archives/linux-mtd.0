Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7RYi-0008WO-F2
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 11:05:35 +0000
Subject: Re: UBIFS, Memory fragmentation problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tomasz Stanislawski <t.stanislaws@samsung.com>
In-Reply-To: <4BD59783.8020800@samsung.com>
References: <4BD59783.8020800@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Apr 2010 14:00:40 +0300
Message-ID: <1272538840.26440.42.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, kyungmin.park@samsung.com,
	Tomasz Fujak <t.fujak@samsung.com>, linux-mtd@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CCing fs-devel, in case other people can give good suggestions.

On Mon, 2010-04-26 at 15:39 +0200, Tomasz Stanislawski wrote:
> Dear Mr. Artem Bityutskiy,
> Recently, I was developing a platform that utilizes UBIFS. An 
> interesting problem
> was encountered. During booting, UBIFS generates error messages and it sets
> file system into read only mode. Please look to appendix A. I have 
> investigated
> problem and according to my analysis observed problems are caused by severe
> memory fragmentation. The platform is based on kernel 2.6.29.
> 
> Few kernel errors where found in system logs. Please look to appendix A. 
> It looks
> that this failure was caused by memory fragmentation. Look at two 
> following lines:
> 
> DMA: 186*4kB 2*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB
>    0*2048kB 0*4096kB 0*8192kB = 760kB
> DMA: 998*4kB 146*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB
>    0*2048kB 0*4096kB 0*8192kB = 5160kB
> 
> There is no contiguous memory block of size 16 kB. Please consider 
> following
> scenario:
> 
>   Assume that program reached line 916 in file.c (look to Appendix B).
> Now do_writepage function is executed.  Now function 
> ubifs_jnl_write_data is
> called. Inside function ubifs_jnl_write_data operation kmalloc is called
> (Appendix C, line 697). Driver tries to allocate slightly more than 8 kiB.
> Unfortunately, allocator finds no contiguous memory block long enough.  It
> wakes up kswapd daemon. The daemon tries to drop page cache to disk.  
> Storing
> data to ubifs partition calls ubifs_jnl_write_data again.  Once again it 
> tries
> to allocate slightly more than 8 KiB. Allocator detects allocation 
> operation
> from procedure called to retain memory. In order to avoid endless loop 
> stack
> dump is generated and kmalloc fails. Failure of ubifs_jnl_write_data causes
> failure of kswapd action. Ubifs driver executes code in lines 926-929 
> setting
> UBI partition in read-only mode. Since now system becomes unstable, all 
> writing
> operation to root file system are denied.
> 
>   Simple workaround for this problem is changing all kmalloc/kfree to
> vmalloc/vfree. This functions creates virtual memory mapping, so there 
> is no
> need to find contiguous memory blocks. Such a patch was attached in the 
> file
> 'kmalloc2vmalloc.patch'. Function kmalloc is used often is ubifs driver 
> so it is
> possible that the problem might appear somewhere else. Static buffer cannot
> be used because function ubifs_jnl_write_data is both reentrant and in some
> sense 'recursive'.

Reentrant - yes, recursive - no. If kmalloc() cannot find space, it just
returns error, and GFP_NOFS makes sure . There is no recursion. kswapd
is a separate independent process.

>  Function ubifs_jnl_write_data calls kmalloc, which calls
> __alloc_pages_internal.  This function wakes up kswapd daemon. In order 
> to drop
> page cache or buffers it tries to initiate UBIFS operations which include
> calling ubifs_jnl_write_data.

This is indeed a work-around. But I do not want to go for vmalloc,
because lower-level MTD drivers may have difficulties with doing DMA on
vmalloc'ed buffers. Well, there are few places where we use vmalloced
buffers for I/O, and those should be fixed, but I do not want to add
more.

Also, vmalloc has its own issues - the virtual address range for vmalloc
on 32-bit systems is very limited (128MiB or something like that), and
we can start hitting these errors.

But I do not see why 'static buffer' cannot be used. Quite the opposite,
this approach can be used.

You can do something like we do in 'ubifs_bulk_read()':

1. Pre-allocate a 16KiB buffer at mount time (c->write_reserve). Add a
mutex to protect this buffer (c->write_reserve_mutex).
2. in 'ubifs_jnl_write_data()', try to allocate the buffer with
'kmalloc(GFP_NOFS | __GFP_NOWARN)' flag.
3. if it fails, then use 'c->write_reserve' under
'c->write_reserve_mutex'

We could try to use mempools (see mm/mempools.c), but they are designed
for constant size allocations.

>   Proposed solution is not sufficient IMHO. A failure of kmalloc 
> operations may occur
> sooner or later, causing system crash or malfunction. There are numerous
> calls to kmalloc inside UBIFS code. I wanted to ask you if it makes 
> sense to change
> all of them to vmalloc interface. Have you run into such problems with 
> memory
> fragmentation?

No, we did not see it. But I do agree we should make UBIFS be more
tolerant to high memory pressure conditions by being ready to not
allocate in the write pat 
> 
> I hope you find this information useful.
> 
> Yours sincerely,
> Tomasz Stanislawski
> 
> 
>   * Appendix A *
> 
> <4>[ 1018.882720] <4>kswapd0: page allocation failure. order:2, mode:0x4050
> <4>[ 1018.887611] [<c047fec4>] (dump_stack+0x0/0x14) from [<c01a1b30>] 
> (__alloc_pages_internal+0x3a8/0x3d4)
> <4>[ 1018.896906] [<c01a1788>] (__alloc_pages_internal+0x0/0x3d4) from 
> [<c01a1bdc>] (__get_free_pages+0x20/0x68)
> <4>[ 1018.906296] [<c01a1bbc>] (__get_free_pages+0x0/0x68) from 
> [<c0259b8c>] (ubifs_jnl_write_data+0x30/0x1a4)
> <4>[ 1018.915751] [<c0259b5c>] (ubifs_jnl_write_data+0x0/0x1a4) from 
> [<c025b3a4>] (do_writepage+0x9c/0x188)
> <4>[ 1018.924943] [<c025b308>] (do_writepage+0x0/0x188) from 
> [<c025b5fc>] (ubifs_writepage+0x16c/0x190)
> <4>[ 1018.933838]  r7:c4258000 r6:000009e3 r5:00000000 r4:c0730fa0
> <4>[ 1018.939426] [<c025b490>] (ubifs_writepage+0x0/0x190) from 
> [<c01a6f70>] (shrink_page_list+0x3e4/0x7c4)
> <4>[ 1018.948680] [<c01a6b8c>] (shrink_page_list+0x0/0x7c4) from 
> [<c01a75ec>] (shrink_list+0x29c/0x5ac)
> <4>[ 1018.957513] [<c01a7350>] (shrink_list+0x0/0x5ac) from [<c01a7b8c>] 
> (shrink_zone+0x290/0x344)
> <4>[ 1018.965909] [<c01a78fc>] (shrink_zone+0x0/0x344) from [<c01a817c>] 
> (kswapd+0x3c4/0x560)
> <4>[ 1018.973907] [<c01a7db8>] (kswapd+0x0/0x560) from [<c0171318>] 
> (kthread+0x54/0x80)
> <4>[ 1018.981504] [<c01712c4>] (kthread+0x0/0x80) from [<c015fdbc>] 
> (do_exit+0x0/0x640)
> <4>[ 1018.988826]  r5:00000000 r4:00000000
> <4>[ 1018.992331] Mem-info:
> <4>[ 1018.994590] DMA per-cpu:
> <4>[ 1018.997173] CPU    0: hi:   18, btch:   3 usd:  16
> <4>[ 1019.001891] DMA per-cpu:
> <4>[ 1019.004440] CPU    0: hi:   90, btch:  15 usd:  76
> <4>[ 1019.009249] <4>[ 1019.009281] <4>[ 1019.009315] Active_anon:10728 
> active_file:3486 inactive_anon:10797
>  inactive_file:6444 unevictable:3641 dirty:1 writeback:1 unstable:0
>  free:1480 slab:2573 mapped:12344 pagetables:1118 bounce:0
> <4>[ 1019.029203] DMA free:760kB min:548kB low:684kB high:820kB 
> active_anon:608kB inactive_anon:688kB active_file:52kB inactive_file:0kB 
> unevictable:516kB present:80264kB pages_scanned:2 all_unreclaimable? no
> <4>[ 1019.047162] lowmem_reserve[]: 0 0 0
> <4>[ 1019.050559] DMA free:5160kB min:1780kB low:2224kB high:2668kB 
> active_anon:42304kB inactive_anon:42500kB active_file:13892kB 
> inactive_file:25776kB unevictable:14048kB present:260096kB 
> pages_scanned:0 all_unreclaimable? no
> <4>[ 1019.070274] lowmem_reserve[]: 0 0 0
> <4>[ 1019.073514] DMA: 186*4kB 2*8kB 0*16kB 0*32kB 0*64kB 0*128kB 
> 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB 0*8192kB = 760kB
> <4>[ 1019.084267] DMA: 998*4kB 146*8kB 0*16kB 0*32kB 0*64kB 0*128kB 
> 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB 0*8192kB = 5160kB
> <4>[ 1019.095285] 19144 total pagecache pages
> <4>[ 1019.099144] 4569 pages in swap cache
> <4>[ 1019.102719] Swap cache stats: add 66771, delete 62202, find 8700/13664
> <4>[ 1019.109204] Free swap  = 13540kB
> <4>[ 1019.112412] Total swap = 99992kB
> <4>[ 1019.133396] 85760 pages of RAM
> <4>[ 1019.135006] 1943 free pages
> <4>[ 1019.137860] 32559 reserved pages
> <4>[ 1019.140990] 2129 slab pages
> <4>[ 1019.143814] 41254 pages shared
> <4>[ 1019.146801] 4569 pages swap cached
> <4>[ 1019.150247] <3>UBIFS error (pid 395): do_writepage: cannot write 
> page 1 of inode 13633, error -12
> <4>[ 1019.159087] <4>UBIFS warning (pid 395): ubifs_ro_mode: switched to 
> read-only mode, error -12
> <4>[ 1019.306567] <3>UBIFS error (pid 395): make_reservation: cannot 
> reserve 529 bytes in jhead 2, error -30
> <4>[ 1019.314216] <3>UBIFS error (pid 395): do_writepage: cannot write 
> page 0 of inode 13633, error -30
> 
> 
>   * Appendix B *
> 
> File fs/ubifs/file.c:910
>   910         addr = kmap(page);
>   911         block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
>   912         i = 0;
>   913         while (len) {
>   914                 blen = min_t(int, len, UBIFS_BLOCK_SIZE);
>   915                 data_key_init(c, &key, inode->i_ino, block);
>   916                 err = ubifs_jnl_write_data(c, inode, &key, addr, 
> blen);
>   917                 if (err)
>   918                         break;
>   919                 if (++i >= UBIFS_BLOCKS_PER_PAGE)
>   920                         break;
>   921                 block += 1;
>   922                 addr += blen;
>   923                 len -= blen;
>   924         }
>   925         if (err) {
>   926                 SetPageError(page);
>   927                 ubifs_err("cannot write page %lu of inode %lu, 
> error %d",
>   928                           page->index, inode->i_ino, err);
>   929                 ubifs_ro_mode(c, err);
>   930         }
> 
>   * Appendix C *
> 
> File fs/ubifs/journal.c:684
>   684 int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode 
> *inode,
>   685                          const union ubifs_key *key, const void 
> *buf, int len)
>   686 {
>   687         struct ubifs_data_node *data;
>   688         int err, lnum, offs, compr_type, out_len;
>   689         int dlen = UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * 
> WORST_COMPR_FACTOR;
>   690         struct ubifs_inode *ui = ubifs_inode(inode);
>   691          692         dbg_jnl("ino %lu, blk %u, len %d, key %s",
>   693                 (unsigned long)key_inum(c, key), key_block(c, 
> key), len,
>   694                 DBGKEY(key));
>   695         ubifs_assert(len <= UBIFS_BLOCK_SIZE);
>   696                  697         data = kmalloc(dlen, GFP_NOFS);
>   698         if (!data)
>   699                 return -ENOMEM;
>   700          701         data->ch.node_type = UBIFS_DATA_NODE;
> 
> differences between files attachment (kmalloc2vmalloc.patch)
> From 44a4267d6f9df2a65c7b2a6d45942a2ddd587309 Mon Sep 17 00:00:00 2001
> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
> Date: Wed, 21 Apr 2010 14:59:33 +0200
> Subject: [PATCH] changed kmalloc to vmalloc to fix fragmentation problem
> 
> ---
>  fs/ubifs/journal.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index 64b5f3a..29d3db1 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -694,7 +694,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
>  		DBGKEY(key));
>  	ubifs_assert(len <= UBIFS_BLOCK_SIZE);
>  
> -	data = kmalloc(dlen, GFP_NOFS);
> +	data = vmalloc(dlen);
>  	if (!data)
>  		return -ENOMEM;
>  
> @@ -732,7 +732,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
>  		goto out_ro;
>  
>  	finish_reservation(c);
> -	kfree(data);
> +	vfree(data);
>  	return 0;
>  
>  out_release:
> @@ -741,7 +741,7 @@ out_ro:
>  	ubifs_ro_mode(c, err);
>  	finish_reservation(c);
>  out_free:
> -	kfree(data);
> +	vfree(data);
>  	return err;
>  }
>  
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
