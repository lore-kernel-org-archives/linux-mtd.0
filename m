Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hu3n5-0001Am-38
	for linux-mtd@lists.infradead.org; Fri, 01 Jun 2007 05:51:31 -0400
Subject: [PATCH] JFFS2 appears to "freeze" during erase
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Jun 2007 11:51:22 +0200
Message-Id: <1180691482.1468.267.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: radbis@googlemail.com
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a old patch from Radoslaw Bisewski(see MTD list). The patch
fixes the long stalls I am seeing in "GC starves write's in 2.6.20" I
sent yesterday. Please apply.

 Jocke

>From 7bff3d25d1e2dd561f0c48421df80ceb0e9eac04 Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Fri, 1 Jun 2007 11:40:25 +0200
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
---
 fs/jffs2/erase.c |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index ad01210..6d4b7ce 100644
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
 
@@ -84,6 +86,7 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	if (ret == -ENOMEM || ret == -EAGAIN) {
 		/* Erase failed immediately. Refile it on the list */
 		D1(printk(KERN_DEBUG "Erase at 0x%08x failed: %d. Refiling on erase_pending_list\n", jeb->offset, ret));
+		down(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 		list_move(&jeb->list, &c->erase_pending_list);
 		c->erasing_size -= c->sector_size;
@@ -116,6 +119,7 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 			jeb = list_entry(c->erase_complete_list.next, struct jffs2_eraseblock, list);
 			list_del(&jeb->list);
 			spin_unlock(&c->erase_completion_lock);
+			up(&c->erase_free_sem);
 			jffs2_mark_erased_block(c, jeb);
 
 			if (!--count) {
@@ -136,6 +140,7 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 			jffs2_free_jeb_node_refs(c, jeb);
 			list_add(&jeb->list, &c->erasing_list);
 			spin_unlock(&c->erase_completion_lock);
+			up(&c->erase_free_sem);
 
 			jffs2_erase_block(c, jeb);
 
@@ -145,14 +150,14 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 
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
@@ -419,6 +424,7 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
 		jffs2_link_node_ref(c, jeb, jeb->offset | REF_NORMAL, c->cleanmarker_size, NULL);
 	}
 
+	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	c->erasing_size -= c->sector_size;
 	c->free_size += jeb->free_size;
@@ -432,22 +438,27 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
 	c->nr_free_blocks++;
 	spin_unlock(&c->erase_completion_lock);
 	wake_up(&c->erase_wait);
+    	up(&c->erase_free_sem);
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
