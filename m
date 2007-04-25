Subject: Re: OOPS at mount
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Wed, 25 Apr 2007 16:23:17 +0100
Message-Id: <1177514597.2755.251.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-04-25 at 17:09 +0200, Joakim Tjernlund wrote:
> --- a/fs/jffs2/nodelist.c
> +++ b/fs/jffs2/nodelist.c
> @@ -83,6 +83,10 @@ void jffs2_truncate_fragtree(struct jffs2_sb_info *c, struct 
>          * REF_PRISTINE irrespective of its size.
>          */
>         frag = frag_last(list);
> +       if (!frag) {
> +          printk(KERN_ERR "frag==NULL\n");
> +          BUG();
> +       }
>         if (frag->node && (frag->ofs & (PAGE_CACHE_SIZE - 1)) == 0) {
>                 dbg_fragtree2("marking the last fragment 0x%08x-0x%08x REF_PRIST
>                         frag->ofs, frag->ofs + frag->size);
> 
> and set a BP on the BUG().
> Here is some data when stopping the BP:
> (gdb) bt
> #0  jffs2_truncate_fragtree (c=0xcff56800, list=0xc023d610, size=0x2800)
>     at fs/jffs2/nodelist.c:88
> #1  0xc00d23dc in jffs2_do_read_inode_internal (c=0xcff56800, f=0xc023d600, 
>     latest_node=0xc0635ea0) at fs/jffs2/readinode.c:813
> #2  0xc00d25cc in jffs2_do_crccheck_inode (c=0xcff56800, ic=0xcfe6d398)
>     at fs/jffs2/readinode.c:971

So... you're truncating the inode in question to a non-zero length, but
it didn't have any data nodes beforehand. How on earth did that happen?

Can you dump the fragtree before the truncation, and show the size it's
being truncated to?

Sounds like the simple fix is 'if (!frag) return;', but I'd like to know
what's actually happening.

-- 
dwmw2
