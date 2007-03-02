Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HNA61-0005Mp-3y
	for linux-mtd@lists.infradead.org; Fri, 02 Mar 2007 10:55:50 -0500
Subject: [PATCH 3/9] swap: Catch pages with errors and mark as bad
From: Richard Purdie <rpurdie@openedhand.com>
To: Nick Piggin <nickpiggin@yahoo.com.au>, Hugh Dickins <hugh@veritas.com>,
	kernel list <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
Content-Type: text/plain
Date: Fri, 02 Mar 2007 15:54:38 +0000
Message-Id: <1172850879.11149.122.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check for pages with errors within shrink_page_list() and if found, try
to unuse them which will trigger the functions to mark the page bad. The
page will then be allocated a new swap page.

If a swap page write error occurs, don't disable page reclaim.

Based on a patch by Nick Piggin and some of my own changes as discussed
on LKML.

Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

---
 mm/page_io.c |    3 ---
 mm/vmscan.c  |    9 +++++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

Index: linux/mm/page_io.c
===================================================================
--- linux.orig/mm/page_io.c	2007-02-28 18:12:16.000000000 +0000
+++ linux/mm/page_io.c	2007-02-28 18:12:44.000000000 +0000
@@ -59,15 +59,12 @@ static int end_swap_bio_write(struct bio
 		 * Re-dirty the page in order to avoid it being reclaimed.
 		 * Also print a dire warning that things will go BAD (tm)
 		 * very quickly.
-		 *
-		 * Also clear PG_reclaim to avoid rotate_reclaimable_page()
 		 */
 		set_page_dirty(page);
 		printk(KERN_ALERT "Write-error on swap-device (%u:%u:%Lu)\n",
 				imajor(bio->bi_bdev->bd_inode),
 				iminor(bio->bi_bdev->bd_inode),
 				(unsigned long long)bio->bi_sector);
-		ClearPageReclaim(page);
 	}
 	end_page_writeback(page);
 	bio_put(bio);
Index: linux/mm/vmscan.c
===================================================================
--- linux.orig/mm/vmscan.c	2007-02-28 18:12:34.000000000 +0000
+++ linux/mm/vmscan.c	2007-02-28 18:12:44.000000000 +0000
@@ -490,6 +490,15 @@ static unsigned long shrink_page_list(st
 
 #ifdef CONFIG_SWAP
 		/*
+		 * Encountered an error last time? Try to remove the
+		 * page from its current position, which will notice
+		 * the error and mark that swap entry bad. Then we can
+		 * try allocating another swap entry.
+		 */
+		if (PageSwapCache(page) && unlikely(PageError(page)))
+			try_to_unuse_page_entry(page);
+
+		/*
 		 * Anonymous process memory has backing store?
 		 * Try to allocate it some swap space here.
 		 */
