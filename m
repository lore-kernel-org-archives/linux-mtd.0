Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DJwsX-0007gw-H4
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2005 13:02:48 -0400
Date: Fri, 8 Apr 2005 19:01:59 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050408170159.GD2292@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] simplify list rotation code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After the other parts of my patch were vetoed against, how about this
one?

Instead of counting the list length, it simply rotates by up to 64
elements.  This is O(1) instead of O(n) and makes the code nicer to
read.

Jörn

-- 
When I am working on a problem I never think about beauty.  I think
only how to solve the problem.  But when I have finished, if the
solution is not beautiful, I know it is wrong.
-- R. Buckminster Fuller


Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 fs/jffs2/scan.c |  104 +++++++-------------------------------------------------
 1 files changed, 13 insertions(+), 91 deletions(-)

--- linux-2.6.11cow/fs/jffs2/scan.c~jffs2_rotate	2005-03-22 23:29:29.000000000 +0100
+++ linux-2.6.11cow/fs/jffs2/scan.c	2005-03-25 16:23:30.000000000 +0100
@@ -809,108 +809,30 @@ static int jffs2_scan_dirent_node(struct
 	return 0;
 }
 
-static int count_list(struct list_head *l)
-{
-	uint32_t count = 0;
-	struct list_head *tmp;
 
-	list_for_each(tmp, l) {
-		count++;
-	}
-	return count;
-}
-
-/* Note: This breaks if list_empty(head). I don't care. You
-   might, if you copy this code and use it elsewhere :) */
 static void rotate_list(struct list_head *head, uint32_t count)
 {
 	struct list_head *n = head->next;
 
+	if (list_empty(head))
+		return;
+
 	list_del(head);
-	while(count--) {
+	while (count--)
 		n = n->next;
-	}
+
 	list_add(head, n);
 }
 
+
 void jffs2_rotate_lists(struct jffs2_sb_info *c)
 {
-	uint32_t x;
-	uint32_t rotateby;
-
-	x = count_list(&c->clean_list);
-	if (x) {
-		rotateby = pseudo_random % x;
-		D1(printk(KERN_DEBUG "Rotating clean_list by %d\n", rotateby));
-
-		rotate_list((&c->clean_list), rotateby);
-
-		D1(printk(KERN_DEBUG "Erase block at front of clean_list is at %08x\n",
-			  list_entry(c->clean_list.next, struct jffs2_eraseblock, list)->offset));
-	} else {
-		D1(printk(KERN_DEBUG "Not rotating empty clean_list\n"));
-	}
-
-	x = count_list(&c->very_dirty_list);
-	if (x) {
-		rotateby = pseudo_random % x;
-		D1(printk(KERN_DEBUG "Rotating very_dirty_list by %d\n", rotateby));
-
-		rotate_list((&c->very_dirty_list), rotateby);
-
-		D1(printk(KERN_DEBUG "Erase block at front of very_dirty_list is at %08x\n",
-			  list_entry(c->very_dirty_list.next, struct jffs2_eraseblock, list)->offset));
-	} else {
-		D1(printk(KERN_DEBUG "Not rotating empty very_dirty_list\n"));
-	}
-
-	x = count_list(&c->dirty_list);
-	if (x) {
-		rotateby = pseudo_random % x;
-		D1(printk(KERN_DEBUG "Rotating dirty_list by %d\n", rotateby));
-
-		rotate_list((&c->dirty_list), rotateby);
-
-		D1(printk(KERN_DEBUG "Erase block at front of dirty_list is at %08x\n",
-			  list_entry(c->dirty_list.next, struct jffs2_eraseblock, list)->offset));
-	} else {
-		D1(printk(KERN_DEBUG "Not rotating empty dirty_list\n"));
-	}
-
-	x = count_list(&c->erasable_list);
-	if (x) {
-		rotateby = pseudo_random % x;
-		D1(printk(KERN_DEBUG "Rotating erasable_list by %d\n", rotateby));
-
-		rotate_list((&c->erasable_list), rotateby);
-
-		D1(printk(KERN_DEBUG "Erase block at front of erasable_list is at %08x\n",
-			  list_entry(c->erasable_list.next, struct jffs2_eraseblock, list)->offset));
-	} else {
-		D1(printk(KERN_DEBUG "Not rotating empty erasable_list\n"));
-	}
-
-	if (c->nr_erasing_blocks) {
-		rotateby = pseudo_random % c->nr_erasing_blocks;
-		D1(printk(KERN_DEBUG "Rotating erase_pending_list by %d\n", rotateby));
-
-		rotate_list((&c->erase_pending_list), rotateby);
-
-		D1(printk(KERN_DEBUG "Erase block at front of erase_pending_list is at %08x\n",
-			  list_entry(c->erase_pending_list.next, struct jffs2_eraseblock, list)->offset));
-	} else {
-		D1(printk(KERN_DEBUG "Not rotating empty erase_pending_list\n"));
-	}
-
-	if (c->nr_free_blocks) {
-		rotateby = pseudo_random % c->nr_free_blocks;
-		D1(printk(KERN_DEBUG "Rotating free_list by %d\n", rotateby));
-
-		rotate_list((&c->free_list), rotateby);
+	uint32_t rotateby = pseudo_random % 64;
 
-		D1(printk(KERN_DEBUG "Erase block at front of free_list is at %08x\n",
-			  list_entry(c->free_list.next, struct jffs2_eraseblock, list)->offset));
-	} else {
-		D1(printk(KERN_DEBUG "Not rotating empty free_list\n"));
-	}
+	rotate_list((&c->clean_list), rotateby);
+	rotate_list((&c->very_dirty_list), rotateby);
+	rotate_list((&c->dirty_list), rotateby);
+	rotate_list((&c->erasable_list), rotateby);
+	rotate_list((&c->erase_pending_list), rotateby);
+	rotate_list((&c->free_list), rotateby);
 }
