Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CGvsd-0001AO-IW
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 04:50:09 -0400
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <416A4930.6AF5C472@st.com>
Date: Mon, 11 Oct 2004 10:49:52 +0200
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Mark Hamilton <mhamilton@alliantnetworks.com>
References: <019301c4ad6e$33e3c730$0400a8c0@mark>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [JFFS2] GC patch for eCos port
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

isn't it cleaner (for compatibility with Linux) to modify 
jffs2_gc_fetch_page so that it reads a 
PAGE_CACHE_SIZE-aligned buffer ?
BTW I'd like to make the whole page caching thing optional for
a specific use (application needs to write structures to a 
file atomically & structure size is _not_ a power of 2 so it
may overlap a page boundary)... I think eCos doesn't care
about page caches ?

Estelle

 

Mark Hamilton wrote:
> 
> There looks to be a bug with the eCos port on how garbage collection is
> done. I sent a notice about this bug before but I didn't get a resolution.
> Another fellow came across the same bug and verified my fix. The bug seems
> specific to eCos because of how jffs2_gc_fetch_page was ported but the
> proposed fix is applied to gc.c. Since the gc.c is a JFFS2 core file, I
> guess this is the appropriate mailing list for posting the patch. The patch
> is attached.
> 
> Here is the problem.
> ffs2_gc_fetch_page reads 4K of data into a static buffer. The static buffer
> is hidden in the jffs2_gc_fetch_page function. The problem is when the
> writebuf pointer is calculated. The offset is used again to reference into
> the pg_ptr. You can image when start is equal to 4K that writebuf will
> extend beyond the end of the pg_ptr valid memory. Offset is set to start
> just before the while loop.
> 
> I made a comment below with what I think the fix should be.
> Am I missing something?
> 
>             pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
>             if (IS_ERR(pg_ptr)) {
>                 printk(KERN_WARNING "read_cache_page() returned error:
> %ld\n",
>                 PTR_ERR(pg_ptr));
>                 return PTR_ERR(pg_ptr);
>             }
>             offset = start;
>             while(offset < orig_end) {
>                         uint32_t datalen;
>                         uint32_t cdatalen;
>                         char comprtype = JFFS2_COMPR_NONE;
>                         ret = jffs2_reserve_space_gc(c, sizeof(ri) +
> JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen);
>                         if (ret) {
>                             printk(KERN_WARNING "jffs2_reserve_space_gc of
> %zd bytes for
>                                        garbage_collect_dnode failed: %d\n",
>                                          sizeof(ri)+ JFFS2_MIN_DATA_LEN,
> ret);
>                                     break;
>                         }
>                         cdatalen = min_t(uint32_t, alloclen - sizeof(ri),
> end - offset);
>                         datalen = end - offset;
>                         // This looks to be wrong.
>                         writebuf = pg_ptr + (offset & PAGE_CACHE_SIZE -1));
>                         // I think it should be.
>                         writebuf = pg_ptr + ((offset -start) &
> (PAGE_CACHE_SIZE -1));
> 
> The patch uses a define(__ECOS) to fix this problem.
