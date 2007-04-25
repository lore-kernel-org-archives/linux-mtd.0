Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hgjbu-0002uo-4V
	for linux-mtd@lists.infradead.org; Wed, 25 Apr 2007 11:41:06 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177514597.2755.251.camel@pmac.infradead.org>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 25 Apr 2007 17:40:48 +0200
Message-Id: <1177515648.5073.14.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-04-25 at 16:23 +0100, David Woodhouse wrote:
> On Wed, 2007-04-25 at 17:09 +0200, Joakim Tjernlund wrote:
> > --- a/fs/jffs2/nodelist.c
> > +++ b/fs/jffs2/nodelist.c
> > @@ -83,6 +83,10 @@ void jffs2_truncate_fragtree(struct jffs2_sb_info *c, struct 
> >          * REF_PRISTINE irrespective of its size.
> >          */
> >         frag = frag_last(list);
> > +       if (!frag) {
> > +          printk(KERN_ERR "frag==NULL\n");
> > +          BUG();
> > +       }
> >         if (frag->node && (frag->ofs & (PAGE_CACHE_SIZE - 1)) == 0) {
> >                 dbg_fragtree2("marking the last fragment 0x%08x-0x%08x REF_PRIST
> >                         frag->ofs, frag->ofs + frag->size);
> > 
> > and set a BP on the BUG().
> > Here is some data when stopping the BP:
> > (gdb) bt
> > #0  jffs2_truncate_fragtree (c=0xcff56800, list=0xc023d610, size=0x2800)
> >     at fs/jffs2/nodelist.c:88
> > #1  0xc00d23dc in jffs2_do_read_inode_internal (c=0xcff56800, f=0xc023d600, 
> >     latest_node=0xc0635ea0) at fs/jffs2/readinode.c:813
> > #2  0xc00d25cc in jffs2_do_crccheck_inode (c=0xcff56800, ic=0xcfe6d398)
> >     at fs/jffs2/readinode.c:971
> 
> So... you're truncating the inode in question to a non-zero length, but
> it didn't have any data nodes beforehand. How on earth did that happen?

Well, they said they updated the app SW and rebooted ...

> 
> Can you dump the fragtree before the truncation, and show the size it's
> being truncated to?
You mean something like this?
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -59,7 +59,8 @@ void jffs2_truncate_fragtree(struct jffs2_sb_info *c,
struct r
        struct jffs2_node_frag *frag = jffs2_lookup_node_frag(list,
size);
 
        dbg_fragtree("truncating fragtree to 0x%08x bytes\n", size);
-
+       if (!list->rb_node)
+          __jffs2_dbg_dump_fragtree(frag);
        /* We know frag->ofs <= size. That's what lookup does for us */
        if (frag && frag->ofs != size) {
                if (frag->ofs+frag->size > size) {
@@ -83,6 +84,10 @@ void jffs2_truncate_fragtree(struct jffs2_sb_info *c,
struct 
         * REF_PRISTINE irrespective of its size.
         */
        frag = frag_last(list);
+       if (!frag) {
+          printk(KERN_ERR "frag==NULL\n");
+          BUG();
+       }

That will OOPS in __jffs2_dbg_dump_fragtree:
 Unable to handle kernel paging request for data at 
address 0x00000000
Faulting instruction address: 0xc00d960c
Oops: Kernel access of bad area, sig: 11 [#1]

NIP: C00D960C LR: C00CDC64 CTR: 00000000
REGS: c0635d30 TRAP: 0300   Not tainted  (2.6.20)
MSR: 00009032 <EE,ME,IR,DR>  CR: 22022042  XER: 20000000
DAR: 00000000, DSISR: 20000000
TASK = c04bd810[144] 'jffs2_gcd_mtd6' THREAD: c0634000
GPR00: C00CDC64 C0635DE0 C04BD810 00000000 00000000 00000000 00000000
00000000 
GPR08: C01DC618 00008000 D443E188 00000000 22022084 FCE9FEF7 C0635E38
C0635E2C 
GPR16: C0635E38 C01E0000 00000000 00000000 C0635E24 C0635E20 C0237A0C
CF8023D8 
GPR24: 82022022 C0635EA0 C0237A00 CFF2B800 C0237A10 00000000 00000000
00000000 
NIP [C00D960C] __jffs2_dbg_dump_fragtree+0x14/0x74
LR [C00CDC64] jffs2_truncate_fragtree+0xd0/0x128
Call Trace:
[C0635DE0] [C0635EA0] 0xc0635ea0 (unreliable)
[C0635DF0] [C00CDC64] jffs2_truncate_fragtree+0xd0/0x128
[C0635E10] [C00D1870] jffs2_do_read_inode_internal+0xee4/0x10a4
[C0635E90] [C00D1A88] jffs2_do_crccheck_inode+0x58/0xb4
[C0635F00] [C00D5668] jffs2_garbage_collect_pass+0x174/0x6cc
[C0635F50] [C00D6E90] jffs2_garbage_collect_thread+0xa0/0x11c
[C0635FF0] [C000FF70] kernel_thread+0x44/0x60
Instruction dump:
3c60c021 3ca0c01e 38a59ef8 3863e47c 4bf42b85 0fe00000 48000000 7c0802a6 
9421fff0 93e1000c 7c7f1b78 90010014 <7c001828> 3000ffff 7c00192d
40a2fff4
> 
> Sounds like the simple fix is 'if (!frag) return;', but I'd like to know
> what's actually happening.
> 
