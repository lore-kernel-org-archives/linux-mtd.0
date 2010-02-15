Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ngxk6-0001wK-MI
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 09:59:55 +0000
In-Reply-To: <OFB070621F.38B903A2-ONC12576C9.004A7C7A-C12576C9.004A9FC9@LocalDomain>
References: <DIIE.00001DD8002443BF@mail.auerswald.de>	
	<OF36A0B5DE.926C06F6-ONC12576C8.004392D1-C12576C8.0044B7AA@transmode.se>
	<1265979582.29027.5.camel@localhost>
	<OFB070621F.38B903A2-ONC12576C9.004A7C7A-C12576C9.004A9FC9@LocalDomain>
Subject: Re: Why erase_pending_blocks in write_super? (was: [PATCH] JFFS2:
	Erase max 3 EB's in ...)
Message-ID: <OF31A7A7A1.E667331A-ONC12576CB.003684CC-C12576CB.0036C19A@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 15 Feb 2010 10:58:05 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Kai-Uwe Bloem <kai-uwe.bloem@auerswald.de>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund/Transmode wrote on 2010/02/13 14:35:05:
>
> Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/02/12 13:59:42:
> >
> > On Fri, 2010-02-12 at 13:30 +0100, Joakim Tjernlund wrote:
> > > > So, can you please enlighten me? What's the advantage of having the pending
> > > > list erased in write_super? Can I possibly remove it without experiencing
> > > > other problems?
> > >
> > > Me too wants to know :)
> >
> > I believe there is no reason. This is why I suggested to move it to the
> > BGT.

> This is a fist pass. Seems to work but probably need more work.
> What do you think?

Here is the second pass ontop, just to show what I am
doing. I will wrap it up into one patch one we agree.

>From f8b82929c5e9a3d18f7d38a5a6a48127646d7ac9 Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Mon, 15 Feb 2010 09:08:48 +0100
Subject: [PATCH] s/jffs2_erase_pending_trigger/jffs2_garbage_collect_trigger/

Since erasing is done in GC now, trigger GC instead.
jffs2_erase_pending_trigger() renamed to jffs2_dirty_trigger() and
used by wbuf. Remove call jffs2_garbage_collect_trigger() in
write_super()
---
 fs/jffs2/erase.c    |    4 +---
 fs/jffs2/gc.c       |    2 +-
 fs/jffs2/nodemgmt.c |    4 ++--
 fs/jffs2/os-linux.h |    2 +-
 fs/jffs2/scan.c     |    2 +-
 fs/jffs2/super.c    |    1 -
 fs/jffs2/wbuf.c     |    8 ++++----
 7 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 1ca2559..fdf9418 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -172,8 +172,6 @@ static void jffs2_erase_succeeded(struct jffs2_sb_info *c, struct jffs2_eraseblo
 	list_move_tail(&jeb->list, &c->erase_complete_list);
 	spin_unlock(&c->erase_completion_lock);
 	mutex_unlock(&c->erase_free_sem);
-	/* Ensure that kupdated calls us again to mark them clean */
-	jffs2_erase_pending_trigger(c);
 }

 static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t bad_offset)
@@ -492,7 +490,7 @@ filebad:

 refile:
 	/* Stick it back on the list from whence it came and come back later */
-	jffs2_erase_pending_trigger(c);
+	jffs2_garbage_collect_trigger(c);
 	mutex_lock(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	list_move(&jeb->list, &c->erase_complete_list);
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 3b6f2fa..005659f 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -435,7 +435,7 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 		list_add_tail(&c->gcblock->list, &c->erase_pending_list);
 		c->gcblock = NULL;
 		c->nr_erasing_blocks++;
-		jffs2_erase_pending_trigger(c);
+		jffs2_garbage_collect_trigger(c);
 	}
 	spin_unlock(&c->erase_completion_lock);

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 155fd63..190b5ce 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -218,7 +218,7 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)
 			ejeb = list_entry(c->erasable_list.next, struct jffs2_eraseblock, list);
 			list_move_tail(&ejeb->list, &c->erase_pending_list);
 			c->nr_erasing_blocks++;
-			jffs2_erase_pending_trigger(c);
+			jffs2_garbage_collect_trigger(c);
 			D1(printk(KERN_DEBUG "jffs2_find_nextblock: Triggering erase of erasable block at 0x%08x\n",
 				  ejeb->offset));
 		}
@@ -612,7 +612,7 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 				D1(printk(KERN_DEBUG "...and adding to erase_pending_list\n"));
 				list_add_tail(&jeb->list, &c->erase_pending_list);
 				c->nr_erasing_blocks++;
-				jffs2_erase_pending_trigger(c);
+				jffs2_garbage_collect_trigger(c);
 			} else {
 				/* Sometimes, however, we leave it elsewhere so it doesn't get
 				   immediately reused, and we spread the load a bit. */
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index a7f03b7..4d03ce0 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -141,7 +141,7 @@ void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c);
 #endif /* WRITEBUFFER */

 /* erase.c */
-static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
+static inline void jffs2_dirty_trigger(struct jffs2_sb_info *c)
 {
 	OFNI_BS_2SFFJ(c)->s_dirt = 1;
 }
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 2a0681b..d6bdcfc 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -260,7 +260,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 			ret = -EIO;
 			goto out;
 		}
-		jffs2_erase_pending_trigger(c);
+		jffs2_garbage_collect_trigger(c);
 	}
 	ret = 0;
  out:
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 5162329..511e2d6 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -63,7 +63,6 @@ static void jffs2_write_super(struct super_block *sb)

 	if (!(sb->s_flags & MS_RDONLY)) {
 		D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
-		jffs2_garbage_collect_trigger(c);
 		jffs2_flush_wbuf_gc(c, 0);
 	}

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 5ef7bac..07ee154 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -84,7 +84,7 @@ static void jffs2_wbuf_dirties_inode(struct jffs2_sb_info *c, uint32_t ino)
 	struct jffs2_inodirty *new;

 	/* Mark the superblock dirty so that kupdated will flush... */
-	jffs2_erase_pending_trigger(c);
+	jffs2_dirty_trigger(c);

 	if (jffs2_wbuf_pending_for_ino(c, ino))
 		return;
@@ -121,7 +121,7 @@ static inline void jffs2_refile_wbuf_blocks(struct jffs2_sb_info *c)
 			D1(printk(KERN_DEBUG "...and adding to erase_pending_list\n"));
 			list_add_tail(&jeb->list, &c->erase_pending_list);
 			c->nr_erasing_blocks++;
-			jffs2_erase_pending_trigger(c);
+			jffs2_garbage_collect_trigger(c);
 		} else {
 			/* Sometimes, however, we leave it elsewhere so it doesn't get
 			   immediately reused, and we spread the load a bit. */
@@ -152,7 +152,7 @@ static void jffs2_block_refile(struct jffs2_sb_info *c, struct jffs2_eraseblock
 		D1(printk("Refiling block at %08x to erase_pending_list\n", jeb->offset));
 		list_add(&jeb->list, &c->erase_pending_list);
 		c->nr_erasing_blocks++;
-		jffs2_erase_pending_trigger(c);
+		jffs2_garbage_collect_trigger(c);
 	}

 	if (!jffs2_prealloc_raw_node_refs(c, jeb, 1)) {
@@ -543,7 +543,7 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 		D1(printk(KERN_DEBUG "Failing block at %08x is now empty. Moving to erase_pending_list\n", jeb->offset));
 		list_move(&jeb->list, &c->erase_pending_list);
 		c->nr_erasing_blocks++;
-		jffs2_erase_pending_trigger(c);
+		jffs2_garbage_collect_trigger(c);
 	}

 	jffs2_dbg_acct_sanity_check_nolock(c, jeb);
--
1.6.4.4
