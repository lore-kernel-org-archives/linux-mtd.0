Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBxaY-0007me-IB
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 11:11:12 -0500
Received: from wohnheim.fh-wedel.de ([213.39.233.138]:58788)
	by moskovskaya.fh-wedel.de with esmtp (Exim 4.34) id 1DBxaX-00017x-D8
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 17:11:09 +0100
Received: from joern by wohnheim.fh-wedel.de with local (Exim 3.35 #1 (Debian))
	id 1DBxaY-0002xR-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2005 17:11:10 +0100
Date: Thu, 17 Mar 2005 17:11:10 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050317161110.GA10864@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [PATCH] replace pseudo_random with standard random calls
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This little puppy removes a lot of code.  Not sure what the original
idea behind the pseudo_random implementation was, so whoever dislikes
my patch may speak up now.

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law



Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 fs/jffs2/scan.c |  124 ++++++++++----------------------------------------------
 1 files changed, 23 insertions(+), 101 deletions(-)

--- linux-2.6.11cow/fs/jffs2/scan.c~jffs2_random	2005-03-04 11:40:37.000000000 +0100
+++ linux-2.6.11cow/fs/jffs2/scan.c	2005-03-12 15:47:17.000000000 +0100
@@ -10,13 +10,14 @@
  * $Id: scan.c,v 1.115 2004/11/17 12:59:08 dedekind Exp $
  *
  */
+#include <linux/compiler.h>
+#include <linux/crc32.h>
 #include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/pagemap.h>
-#include <linux/crc32.h>
-#include <linux/compiler.h>
+#include <linux/random.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
 #include "nodelist.h"
 
 #define EMPTY_SCAN_SIZE 1024
@@ -44,8 +45,6 @@
 	} \
 } while(0)
 
-static uint32_t pseudo_random;
-
 static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				  unsigned char *buf, uint32_t buf_size);
 
@@ -725,8 +724,6 @@ static int jffs2_scan_inode_node(struct 
 		  je32_to_cpu(ri->offset),
 		  je32_to_cpu(ri->offset)+je32_to_cpu(ri->dsize)));
 
-	pseudo_random += je32_to_cpu(ri->version);
-
 	UNCHECKED_SPACE(PAD(je32_to_cpu(ri->totlen)));
 	return 0;
 }
@@ -753,8 +750,6 @@ static int jffs2_scan_dirent_node(struct
 		return 0;
 	}
 
-	pseudo_random += je32_to_cpu(rd->version);
-
 	fd = jffs2_alloc_full_dirent(rd->nsize+1);
 	if (!fd) {
 		return -ENOMEM;
@@ -809,108 +804,35 @@ static int jffs2_scan_dirent_node(struct
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
+/* All lists are rotated by the same random number.  If they are
+ * rotated by a full circle or more, than that's what happens.
+ */
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
+	unsigned char rotateby;
+	get_random_bytes(&rotateby, 1);
+	rotateby %= 64; /* should be quite sufficient */
 
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
