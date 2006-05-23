Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FiMEA-0007gC-6g
	for linux-mtd@lists.infradead.org; Mon, 22 May 2006 22:02:43 -0400
Message-ID: <44726D13.3000905@ak.jp.nec.com>
Date: Tue, 23 May 2006 11:01:55 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <1148312215.12285.79.camel@pmac.infradead.org>
In-Reply-To: <1148312215.12285.79.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: struct jffs2_xattr_datum/jffs2_xattr_ref/jffs2_inode_cache
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, David.

> To fix the problems with xattr node deletion, I think you'll need to
> just mark nodes obsolete like we do for inode nodes, and keep them in
> _list_ of physical nodes attached to a struct jffs2_xattr_datum -- just
> the same as the jffs2_inode_cache has a _list_ of nodes.
> 
> To avoid re-using xids too early, you'll need the jffs2_xattr_datum to
> be removed only when that list is completely empty, in erase.c.

I also think your suggestion is the most reasonable approch.

Now, I plan to implement that any versions of xattr_datum and
xattr_ref are chained to physical node list and a real deletion
of xattr_datum and xattr_ref should be called from
jffs2_remove_node_refs_from_ino_list().


By the way, I have a question about an usage for jffs2_reserve_space().

Is it permitted to allocate a space for multi nodes by a single
calling of jffs2_reserve_space()?
I tried to allocate a space for xattr_datum and xattr_ref by a single
calling of jffs2_reserve_space(), and it seems to work without any
troubles.

--[quich hack example]-----------
request = PAD(sizeof(struct jffs2_raw_xattr) + strlen(xname) + 1 + size)
          + PAD(sizeof(struct jffs2_raw_xref));
rc = jffs2_reserve_space(c, request, &phys_ofs, &length, ALLOC_NORMAL,
                         JFFS2_SUMMARY_XATTR_SIZE + JFFS2_SUMMARY_XREF_SIZE);
          :
xd = create_xattr_datum(..., &phys_ofs);  <- phys_ofs will be incremented by usage.
          :
newref = create_xattr_ref(..., phys_ofs);
          :
jffs2_complete_reservation(c);
----------------------------------

If it's permitted, it's useful to reduce complexity by exclusion.
What do you think about?

> I've also shuffled the three structures so that they all start the
> same...
> 
> {
> 	void *scan_dents; /* Unused in XATTR */
> 	struct jffs2_raw_node_ref *nodes;
> 	uint8_t class;
> 	...
> 
> 
> I've also extended jffs2_link_node_ref() so that it adds the new
> jffs2_raw_node_ref to a jffs2_inode_cache. It should _also_ be able to
> add the ref to an xattr_ref or xattr_datum too.
> 
> Does that look OK?

The xattr implementation depends on the format of those structures
only in gc.c. I could not think this shuffle has any bad effects.

> I've done all this in the mtd-2.6.git tree -- I've pulled what was in
> the jffs2-devel-2.6.git tree into that already.

I confirmed this. I'll use this tree as the development base.

Thanks,
-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
