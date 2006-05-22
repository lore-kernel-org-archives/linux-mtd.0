From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
Content-Type: text/plain
Date: Mon, 22 May 2006 16:36:55 +0100
Message-Id: <1148312215.12285.79.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: struct jffs2_xattr_datum/jffs2_xattr_ref/jffs2_inode_cache
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kaigai-san,

To fix the problems with xattr node deletion, I think you'll need to
just mark nodes obsolete like we do for inode nodes, and keep them in
_list_ of physical nodes attached to a struct jffs2_xattr_datum -- just
the same as the jffs2_inode_cache has a _list_ of nodes.

To avoid re-using xids too early, you'll need the jffs2_xattr_datum to
be removed only when that list is completely empty, in erase.c.

I've (helpfully) added a BUG_ON() in the two places it's likely to be
important, where we assume that what we find at the end of a
->next_in_ino list is a jffs2_inode_cache.

I've also shuffled the three structures so that they all start the
same...

{
	void *scan_dents; /* Unused in XATTR */
	struct jffs2_raw_node_ref *nodes;
	uint8_t class;
	...


I've also extended jffs2_link_node_ref() so that it adds the new
jffs2_raw_node_ref to a jffs2_inode_cache. It should _also_ be able to
add the ref to an xattr_ref or xattr_datum too.

Does that look OK?

I've done all this in the mtd-2.6.git tree -- I've pulled what was in
the jffs2-devel-2.6.git tree into that already.

-- 
dwmw2
