Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvTpB-0002T6-Aa
	for linux-mtd@lists.infradead.org; Tue, 05 Jun 2007 03:51:32 -0400
Subject: [PATCH] JFFS2 appears to "freeze" during erase, version 2
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Jun 2007 09:51:15 +0200
Message-Id: <1181029875.30670.23.camel@gentoo-jocke.transmode.se>
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

Here is an updated version that contains all everything in one patch. I hope
this one can be applied as is.

 Jocke

>From 87cd93db5895e1506a6abb0dbc891587e96d8547 Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Tue, 5 Jun 2007 09:38:53 +0200
Subject: [PATCH] JFFS2 appears to "freeze" during erase
Radoslaw Bisewski <radbis@googlemail.com> writes:
With current desing erase_free_sem is locked every time the flash
block is being erased. For NOR flashes - ~1 second is needed to erase
single flash block. In the worst case scenario erase_free_sem may be
locked for a couple of seconds when the number of blocks is being
erased (e.g. after large file was removed). When erase_free_sem is
locked all read/write operations for given JFFS2 partition are locked
too - in effect from time to time access to the JFFS2 partition is
locked for a number of seconds. This fix makes critical section in
flash erasing procedure shorter - now erase_free_sem is locked around
erase_completion_lock spinlock only.

Additional bug fixes by me.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/erase.c |   22 ++++++++++++++++++++--
 1 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index ad01210..0506a3c 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -52,12 +52,14 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	instr = kmalloc(sizeof(struct erase_info) + sizeof(struct erase_priv_struct), GFP_KERNEL);
 	if (!instr) {
 		printk(KERN_WARNING "kmalloc for struct erase_info in jffs2_erase_block failed. Refiling block for later\n");
+		down(&c->erase_free_sem);        
 		spin_lock(&c->erase_completion_lock);
 		list_move(&jeb->list, &c->erase_pending_list);
 		c->erasing_size -= c->sector_size;
 		c->dirty_size += c->sector_size;
 		jeb->dirty_size = c->sector_size;
 		spin_unlock(&c->erase_completion_lock);
+		up(&c->erase_free_sem);
 		return;
 	}
 
@@ -84,12 +86,14 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	if (ret == -ENOMEM || ret == -EAGAIN) {
 		/* Erase failed immediately. Refile it on the list */
 		D1(printk(KERN_DEBUG "Erase at 0x%08x failed: %d. Refiling on erase_pending_list\n", jeb->offset, ret));
+		down(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 		list_move(&jeb->list, &c->erase_pending_list);
 		c->erasing_size -= c->sector_size;
 		c->dirty_size += c->sector_size;
 		jeb->dirty_size = c->sector_size;
 		spin_unlock(&c->erase_completion_lock);
+		up(&c->erase_free_sem);
 		return;
 	}
 
@@ -116,6 +120,7 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 			jeb = list_entry(c->erase_complete_list.next, struct jffs2_eraseblock, list);
 			list_del(&jeb->list);
 			spin_unlock(&c->erase_completion_lock);
+			up(&c->erase_free_sem);
 			jffs2_mark_erased_block(c, jeb);
 
 			if (!--count) {
@@ -136,6 +141,7 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 			jffs2_free_jeb_node_refs(c, jeb);
 			list_add(&jeb->list, &c->erasing_list);
 			spin_unlock(&c->erase_completion_lock);
+			up(&c->erase_free_sem);
 
 			jffs2_erase_block(c, jeb);
 
@@ -145,22 +151,24 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 
 		/* Be nice */
 		cond_resched();
+		down(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 	}
 
 	spin_unlock(&c->erase_completion_lock);
+	up(&c->erase_free_sem);
  done:
 	D1(printk(KERN_DEBUG "jffs2_erase_pending_blocks completed\n"));
-
-	up(&c->erase_free_sem);
 }
 
 static void jffs2_erase_succeeded(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 {
 	D1(printk(KERN_DEBUG "Erase completed successfully at 0x%08x\n", jeb->offset));
+	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	list_move_tail(&jeb->list, &c->erase_complete_list);
 	spin_unlock(&c->erase_completion_lock);
+	up(&c->erase_free_sem);
 	/* Ensure that kupdated calls us again to mark them clean */
 	jffs2_erase_pending_trigger(c);
 }
@@ -174,22 +182,26 @@ static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock
 		   failed too many times. */
 		if (!jffs2_write_nand_badblock(c, jeb, bad_offset)) {
 			/* We'd like to give this block another try. */
+			down(&c->erase_free_sem);
 			spin_lock(&c->erase_completion_lock);
 			list_move(&jeb->list, &c->erase_pending_list);
 			c->erasing_size -= c->sector_size;
 			c->dirty_size += c->sector_size;
 			jeb->dirty_size = c->sector_size;
 			spin_unlock(&c->erase_completion_lock);
+			up(&c->erase_free_sem);
 			return;
 		}
 	}
 
+	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	c->erasing_size -= c->sector_size;
 	c->bad_size += c->sector_size;
 	list_move(&jeb->list, &c->bad_list);
 	c->nr_erasing_blocks--;
 	spin_unlock(&c->erase_completion_lock);
+	up(&c->erase_free_sem);
 	wake_up(&c->erase_wait);
 }
 
@@ -419,6 +431,7 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
 		jffs2_link_node_ref(c, jeb, jeb->offset | REF_NORMAL, c->cleanmarker_size, NULL);
 	}
 
+	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	c->erasing_size -= c->sector_size;
 	c->free_size += jeb->free_size;
@@ -431,23 +444,28 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
 	c->nr_erasing_blocks--;
 	c->nr_free_blocks++;
 	spin_unlock(&c->erase_completion_lock);
+    	up(&c->erase_free_sem);
 	wake_up(&c->erase_wait);
 	return;
 
 filebad:
+	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	/* Stick it on a list (any list) so erase_failed can take it
 	   right off again.  Silly, but shouldn't happen often. */
 	list_add(&jeb->list, &c->erasing_list);
 	spin_unlock(&c->erase_completion_lock);
+	up(&c->erase_free_sem);
 	jffs2_erase_failed(c, jeb, bad_offset);
 	return;
 
 refile:
 	/* Stick it back on the list from whence it came and come back later */
 	jffs2_erase_pending_trigger(c);
+	down(&c->erase_free_sem);    
 	spin_lock(&c->erase_completion_lock);
 	list_add(&jeb->list, &c->erase_complete_list);
 	spin_unlock(&c->erase_completion_lock);
+	up(&c->erase_free_sem);    
 	return;
 }
-- 
1.5.1.3
