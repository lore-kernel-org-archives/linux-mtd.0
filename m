Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTKXW-00036B-H2
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 12:16:57 -0400
Subject: Strange automatic GC threshold ?
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Mar 2007 17:16:49 +0100
Message-Id: <1174321009.26465.266.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In jffs2_thread_should_wake() there is this test to
wake up GC thread:
	/* dirty_size contains blocks on erase_pending_list
	 * those blocks are counted in c->nr_erasing_blocks.
	 * If one block is actually erased, it is not longer counted as dirty_space
	 * but it is counted in c->nr_erasing_blocks, so we add it and subtract it
	 * with c->nr_erasing_blocks * c->sector_size again.
	 * Blocks on erasable_list are counted as dirty_size, but not in c->nr_erasing_blocks
	 * This helps us to force gc and pick eventually a clean block to spread the load.
	 */
	dirty = c->dirty_size + c->erasing_size - c->nr_erasing_blocks * c->sector_size;

	if (c->nr_free_blocks + c->nr_erasing_blocks < c->resv_blocks_gctrigger &&
			(dirty > c->nospc_dirty_size))

The && in the above if means that no matter how dirty the FS is, it wont
trigger GC until there is a very low count of free blocks as well(24 in my
case out of 1003). I wonder if that && should be a || instead?

 Jocke
