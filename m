Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hv972-0000ct-0e
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 05:44:34 -0400
Subject: Re: [PATCH] JFFS2 appears to "freeze" during erase
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1180948837.30670.3.camel@gentoo-jocke.transmode.se>
References: <1180691482.1468.267.camel@gentoo-jocke.transmode.se>
	<1180721097.25232.43.camel@pmac.infradead.org>
	<1180948837.30670.3.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Jun 2007 11:44:30 +0200
Message-Id: <1180950270.30670.10.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: radbis@googlemail.com,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-06-04 at 11:20 +0200, Joakim Tjernlund wrote:
> On Fri, 2007-06-01 at 19:04 +0100, David Woodhouse wrote:
> > On Fri, 2007-06-01 at 11:51 +0200, Joakim Tjernlund wrote:
> > > This is a old patch from Radoslaw Bisewski(see MTD list). The patch
> > > fixes the long stalls I am seeing in "GC starves write's in 2.6.20" I
> > > sent yesterday. Please apply.
> > 
> > It seems to make sense; I need to convince myself that every other user
> > of the erase_free_sem is actually OK with it. I think
> > jffs2_g_c_deletion_dirent() should be OK, at first glance. I'm less
> > convinced about jffs2_mark_node_obsolete(), where we currently hold the
> > erase_free_sem while we actually mark the node obsolete. Will look into
> > it...
> > 
> 
> looked a litte closer on the new locking in erase.c and wonder
> why not jffs2_erase_succeeded() and jffs2_erase_failed() needs
> to take erase_free_sem?
> 
>  Jocke

Found another bug, here is an addon diff. Also added erase_free_sem to
jffs2_erase_succeeded() and jffs2_erase_failed() as I think it should
take the erase_free_sem there too.

 Jocke

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 5b5c291..45b9f3e 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -93,6 +93,7 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 		c->dirty_size += c->sector_size;
 		jeb->dirty_size = c->sector_size;
 		spin_unlock(&c->erase_completion_lock);
+		up(&c->erase_free_sem);
 		return;
 	}
 
@@ -163,9 +164,11 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
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
@@ -179,22 +182,26 @@ static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock
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
 
