Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgIhY-0004Ye-Je
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 23:51:18 +0000
From: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
Subject: [PATCH 1/2] jffs2: Provide forced dirty node cleanup via POLL signal
Date: Fri, 20 Jul 2018 11:50:11 +1200
Message-Id: <bcf5bf66a41e73c0e8608b9cd386d8152ee2a15e.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
In-Reply-To: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
References: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Secure deletion under JFFS2 is complicated by the log of dirty nodes
that may contain obsoleted versions of sensitive data.  There is an
existing mechanism to trigger a single gc step via -HUP signal;
extend this to trigger gc collection of all currently-dirty data via
a -POLL signal.

On receipt of -POLL, the gc will retire the current nextblock, store
the last dirty list entry, and keep continuously cycling collection
until that entry has been cleaned.

Signed-off-by: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
---
 fs/jffs2/background.c  | 31 ++++++++++++++++++++++++++++++-
 fs/jffs2/build.c       |  1 +
 fs/jffs2/jffs2_fs_sb.h |  2 ++
 fs/jffs2/nodelist.h    |  1 +
 fs/jffs2/nodemgmt.c    |  6 +++++-
 5 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 453a6a1fff34..4c29e2d323c4 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -72,15 +72,27 @@ void jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c)
 		wait_for_completion(&c->gc_thread_exit);
 }
 
+static int list_contains(struct list_head *list, struct list_head *entry)
+{
+	struct list_head *ptr;
+
+	list_for_each(ptr, list) {
+		if (ptr == entry)
+			return 1;
+	}
+	return 0;
+}
+
 static int jffs2_garbage_collect_thread(void *_c)
 {
 	struct jffs2_sb_info *c = _c;
 	sigset_t hupmask;
 
-	siginitset(&hupmask, sigmask(SIGHUP));
+	siginitset(&hupmask, sigmask(SIGHUP) | sigmask(SIGPOLL));
 	allow_signal(SIGKILL);
 	allow_signal(SIGSTOP);
 	allow_signal(SIGHUP);
+	allow_signal(SIGPOLL);
 
 	c->gc_task = current;
 	complete(&c->gc_thread_start);
@@ -143,6 +155,15 @@ static int jffs2_garbage_collect_thread(void *_c)
 				jffs2_dbg(1, "%s(): SIGHUP received\n",
 					  __func__);
 				break;
+			case SIGPOLL:
+				if (!c->tidemark) {
+					/* Force retire current half-used block */
+					if (c->nextblock)
+						jffs2_close_nextblock(c, c->nextblock);
+					/* Keep going until we hit the last element in the (now) current dirty list */
+					c->tidemark = c->dirty_list.prev;
+				}
+				break;
 			default:
 				jffs2_dbg(1, "%s(): signal %ld received\n",
 					  __func__, signr);
@@ -156,6 +177,14 @@ static int jffs2_garbage_collect_thread(void *_c)
 			pr_notice("No space for garbage collection. Aborting GC thread\n");
 			goto die;
 		}
+		/* If we're working towards a tidemark, keep going until it's clean */
+		if (c->tidemark && (
+			!list_empty(&c->very_dirty_list) ||
+			list_contains(&c->dirty_list, c->tidemark) ||
+			(&c->gcblock->list) == c->tidemark))
+			goto again;
+		else if (c->tidemark)
+			c->tidemark = NULL;
 	}
  die:
 	spin_lock(&c->erase_completion_lock);
diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
index b288c8ae1236..7d128705648f 100644
--- a/fs/jffs2/build.c
+++ b/fs/jffs2/build.c
@@ -405,6 +405,7 @@ int jffs2_do_mount_fs(struct jffs2_sb_info *c)
 	INIT_LIST_HEAD(&c->bad_used_list);
 	c->highest_ino = 1;
 	c->summary = NULL;
+	c->tidemark = NULL;
 
 	ret = jffs2_sum_init(c);
 	if (ret)
diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index 778275f48a87..25960589e3c0 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -87,6 +87,8 @@ struct jffs2_sb_info {
 
 	uint32_t nospc_dirty_size;
 
+	struct list_head *tidemark;		/* Last dirty block at the time a full sync started */
+
 	uint32_t nr_blocks;
 	struct jffs2_eraseblock *blocks;	/* The whole array of blocks. Used for getting blocks
 						 * from the offset (blocks[ofs / sector_size]) */
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 0637271f3770..73348bc7f545 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -386,6 +386,7 @@ int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 			uint32_t *len, int prio, uint32_t sumsize);
 int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize,
 			uint32_t *len, uint32_t sumsize);
+void jffs2_close_nextblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
 struct jffs2_raw_node_ref *jffs2_add_physical_node_ref(struct jffs2_sb_info *c, 
 						       uint32_t ofs, uint32_t len,
 						       struct jffs2_inode_cache *ic);
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index a7bbe879cfc3..c07c53f69516 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -240,7 +240,7 @@ int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize,
 
 /* Classify nextblock (clean, dirty of verydirty) and force to select an other one */
 
-static void jffs2_close_nextblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
+void jffs2_close_nextblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 {
 
 	if (c->nextblock == NULL) {
@@ -875,6 +875,10 @@ int jffs2_thread_should_wake(struct jffs2_sb_info *c)
 		}
 	}
 
+	/* Pending cleanup, always wake */
+	if (c->tidemark)
+		ret = 1;
+
 	jffs2_dbg(1, "%s(): nr_free_blocks %d, nr_erasing_blocks %d, dirty_size 0x%x, vdirty_blocks %d: %s\n",
 		  __func__, c->nr_free_blocks, c->nr_erasing_blocks,
 		  c->dirty_size, nr_very_dirty, ret ? "yes" : "no");
-- 
2.18.0
