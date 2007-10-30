Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Imv3s-0004jI-GP
	for linux-mtd@lists.infradead.org; Tue, 30 Oct 2007 13:39:38 -0400
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] NULLify ->raw after jffs2_mark_node_obsolete().
Date: Tue, 30 Oct 2007 18:39:24 +0100
Message-Id: <1193765964-30069-2-git-send-email-Joakim.Tjernlund@transmode.se>
In-Reply-To: <1193765964-30069-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1193765964-30069-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Per Davids request, NULLify ->raw pointers to catch
errors early.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/build.c     |    1 +
 fs/jffs2/fs.c        |    1 +
 fs/jffs2/gc.c        |    6 ++++++
 fs/jffs2/nodelist.c  |   16 ++++++++++++----
 fs/jffs2/nodemgmt.c  |    2 +-
 fs/jffs2/readinode.c |   10 ++++++++--
 fs/jffs2/write.c     |    2 ++
 7 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
index 722a6b6..0564d0e 100644
--- a/fs/jffs2/build.c
+++ b/fs/jffs2/build.c
@@ -65,6 +65,7 @@ static void jffs2_build_inode_pass1(struct jffs2_sb_info *c,
 			dbg_fsbuild("child \"%s\" (ino #%u) of dir ino #%u doesn't exist!\n",
 				  fd->name, fd->ino, ic->ino);
 			jffs2_mark_node_obsolete(c, fd->raw);
+			fd->raw = NULL;
 			continue;
 		}
 
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index ed85f9a..8746c87 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -159,6 +159,7 @@ int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
 	}
 	if (old_metadata) {
 		jffs2_mark_node_obsolete(c, old_metadata->raw);
+		old_metadata->raw = NULL;
 		jffs2_free_full_dnode(old_metadata);
 	}
 	jffs2_free_raw_inode(ri);
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 32ff037..308d25d 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -265,6 +265,7 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 		} else {
 			/* Just mark it obsolete */
 			jffs2_mark_node_obsolete(c, raw);
+			jeb->gc_node = NULL;
 		}
 		up(&c->alloc_sem);
 		goto eraseit_lock;
@@ -767,6 +768,7 @@ static int jffs2_garbage_collect_metadata(struct jffs2_sb_info *c, struct jffs2_
 		goto out;
 	}
 	jffs2_mark_node_obsolete(c, fn->raw);
+	fn->raw = NULL;
 	jffs2_free_full_dnode(fn);
 	f->metadata = new_fn;
  out:
@@ -928,6 +930,7 @@ static int jffs2_garbage_collect_deletion_dirent(struct jffs2_sb_info *c, struct
 		printk(KERN_WARNING "Deletion dirent \"%s\" not found in list for ino #%u\n", fd->name, f->inocache->ino);
 	}
 	jffs2_mark_node_obsolete(c, fd->raw);
+	fd->raw = NULL;
 	jffs2_free_full_dirent(fd);
 	return 0;
 }
@@ -1035,6 +1038,7 @@ static int jffs2_garbage_collect_hole(struct jffs2_sb_info *c, struct jffs2_eras
 		jffs2_add_full_dnode_to_inode(c, f, new_fn);
 		if (f->metadata) {
 			jffs2_mark_node_obsolete(c, f->metadata->raw);
+			f->metadata->raw = NULL;
 			jffs2_free_full_dnode(f->metadata);
 			f->metadata = NULL;
 		}
@@ -1076,6 +1080,7 @@ static int jffs2_garbage_collect_hole(struct jffs2_sb_info *c, struct jffs2_eras
 	}
 
 	jffs2_mark_node_obsolete(c, fn->raw);
+	fn->raw = NULL;
 	jffs2_free_full_dnode(fn);
 
 	return 0;
@@ -1294,6 +1299,7 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 		offset += datalen;
 		if (f->metadata) {
 			jffs2_mark_node_obsolete(c, f->metadata->raw);
+			f->metadata->raw = NULL;
 			jffs2_free_full_dnode(f->metadata);
 			f->metadata = NULL;
 		}
diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 4bf8608..1272280 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -34,13 +34,19 @@ void jffs2_add_fd_to_list(struct jffs2_sb_info *c, struct jffs2_full_dirent *new
 			if (new->version < (*prev)->version) {
 				dbg_dentlist("Eep! Marking new dirent node is obsolete, old is \"%s\", ino #%u\n",
 					(*prev)->name, (*prev)->ino);
-				jffs2_mark_node_obsolete(c, new->raw);
+				if (new->raw) {
+					jffs2_mark_node_obsolete(c, new->raw);
+					new->raw = NULL;
+				}
 				jffs2_free_full_dirent(new);
 			} else {
 				dbg_dentlist("marking old dirent \"%s\", ino #%u bsolete\n",
 					(*prev)->name, (*prev)->ino);
 				new->next = (*prev)->next;
-				jffs2_mark_node_obsolete(c, ((*prev)->raw));
+				if ((*prev)->raw) { /* Can be true during mount if a is unmarked in flash */
+					jffs2_mark_node_obsolete(c, ((*prev)->raw));
+					(*prev)->raw = NULL;
+				}
 				jffs2_free_full_dirent(*prev);
 				*prev = new;
 			}
@@ -104,6 +110,7 @@ static void jffs2_obsolete_node_frag(struct jffs2_sb_info *c,
 			dbg_fragtree2("marking old node @0x%08x (0x%04x-0x%04x) obsolete\n",
 				ref_offset(this->node->raw), this->node->ofs, this->node->ofs+this->node->size);
 			jffs2_mark_node_obsolete(c, this->node->raw);
+			this->node->raw = NULL;
 			jffs2_free_full_dnode(this->node);
 		} else {
 			dbg_fragtree2("marking old node @0x%08x (0x%04x-0x%04x) REF_NORMAL. frags is %d\n",
@@ -582,9 +589,10 @@ void jffs2_kill_fragtree(struct rb_root *root, struct jffs2_sb_info *c)
 		if (frag->node && !(--frag->node->frags)) {
 			/* Not a hole, and it's the final remaining frag
 			   of this node. Free the node */
-			if (c)
+			if (c) {
 				jffs2_mark_node_obsolete(c, frag->node->raw);
-
+				frag->node->raw = NULL;
+			}
 			jffs2_free_full_dnode(frag->node);
 		}
 		parent = frag_parent(frag);
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index a0313fa..0058baf 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -385,7 +385,7 @@ static int jffs2_do_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 		   won't try to refile it to the dirty_list.
 		*/
 		spin_unlock(&c->erase_completion_lock);
-		jffs2_mark_node_obsolete(c, jeb->first_node);
+		jffs2_mark_node_obsolete(c, jeb->first_node); /* Can't NULLify jeb->first_node, SEGV faults */
 		spin_lock(&c->erase_completion_lock);
 	}
 
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index e1e1f36..0c5e7af 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -165,6 +165,7 @@ static int check_tn_node(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info *t
 	} else if (unlikely(ret > 0)) {
 		dbg_readinode("CRC error, mark it obsolete.\n");
 		jffs2_mark_node_obsolete(c, tn->fn->raw);
+		tn->fn->raw = NULL;
 	}
 
 	return ret;
@@ -197,6 +198,7 @@ static struct jffs2_tmp_dnode_info *jffs2_lookup_tn(struct rb_root *tn_root, uin
 static void jffs2_kill_tn(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info *tn)
 {
 	jffs2_mark_node_obsolete(c, tn->fn->raw);
+	tn->fn->raw = NULL;
 	jffs2_free_full_dnode(tn->fn);
 	jffs2_free_tmp_dnode_info(tn);
 }
@@ -493,8 +495,10 @@ static int jffs2_build_inode_fragtree(struct jffs2_sb_info *c,
 					JFFS2_ERROR("Add node to tree failed %d\n", ret);
 					while (1) {
 						vers_next = tn_prev(this);
-						if (check_tn_node(c, this))
+						if (check_tn_node(c, this)) {
 							jffs2_mark_node_obsolete(c, this->fn->raw);
+							this->fn->raw = NULL;
+						}
 						jffs2_free_full_dnode(this->fn);
 						jffs2_free_tmp_dnode_info(this);
 						this = vers_next;
@@ -1412,8 +1416,10 @@ void jffs2_do_clear_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f)
 		jffs2_set_inocache_state(c, f->inocache, INO_STATE_CLEARING);
 
 	if (f->metadata) {
-		if (deleted)
+		if (deleted) {
 			jffs2_mark_node_obsolete(c, f->metadata->raw);
+			f->metadata->raw = NULL;
+		}
 		jffs2_free_full_dnode(f->metadata);
 	}
 
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index 6f97dbe..c6de136 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -394,6 +394,7 @@ int jffs2_write_inode_range(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 		ret = jffs2_add_full_dnode_to_inode(c, f, fn);
 		if (f->metadata) {
 			jffs2_mark_node_obsolete(c, f->metadata->raw);
+			f->metadata->raw = NULL;
 			jffs2_free_full_dnode(f->metadata);
 			f->metadata = NULL;
 		}
@@ -401,6 +402,7 @@ int jffs2_write_inode_range(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 			/* Eep */
 			D1(printk(KERN_DEBUG "Eep. add_full_dnode_to_inode() failed in commit_write, returned %d\n", ret));
 			jffs2_mark_node_obsolete(c, fn->raw);
+			fn->raw = NULL;
 			jffs2_free_full_dnode(fn);
 
 			up(&f->sem);
-- 
1.5.3.4
