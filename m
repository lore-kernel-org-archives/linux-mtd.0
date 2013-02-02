Received: from mail-pb0-f43.google.com ([209.85.160.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U1leC-0000v8-1i
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2013 22:33:20 +0000
Received: by mail-pb0-f43.google.com with SMTP id jt11so2648472pbb.30
 for <linux-mtd@lists.infradead.org>; Sat, 02 Feb 2013 14:33:18 -0800 (PST)
From: Adam Thomas <adamthomas1111@gmail.com>
To: adrian.hunter@intel.com
Subject: [PATCH v2 1/2] UBIFS: fix use of freed ubifs_orphan objects
Date: Sat,  2 Feb 2013 22:32:31 +0000
Message-Id: <1359844351-5889-2-git-send-email-adamthomas1111@gmail.com>
In-Reply-To: <1359844351-5889-1-git-send-email-adamthomas1111@gmail.com>
References: <510BC1D9.8040308@intel.com>
 <1359844351-5889-1-git-send-email-adamthomas1111@gmail.com>
Cc: linux-mtd@lists.infradead.org, adamthomas1111@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The last orphan in the cnext list has its cnext set to NULL. Because
of that, ubifs_delete_orphan assumes that it is not on the cnext list
and frees it immediately instead of adding it to the dnext list. The
freed orphan is later modified by write_orph_node.

This can cause various inconsistencies including directory entries
that cannot be removed and this error:

UBIFS error (pid 20685): layout_cnodes: LPT out of space at LEB 14:129009 needing 17, done_ltab 1, done_lsave 1

This is a regression introduced by
"7074e5eb UBIFS: remove invalid reference to list iterator variable".

This change adds an explicit flag to ubifs_orphan indicating whether
it is pending commit.

Signed-off-by: Adam Thomas <adamthomas1111@gmail.com>
---
 fs/ubifs/orphan.c |    7 ++++++-
 fs/ubifs/ubifs.h  |    4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 769701c..8534d9c 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -132,7 +132,7 @@ void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
 					(unsigned long)inum);
 				return;
 			}
-			if (o->cnext) {
+			if (o->cmt) {
 				o->dnext = c->orph_dnext;
 				c->orph_dnext = o;
 				spin_unlock(&c->orphan_lock);
@@ -172,7 +172,9 @@ int ubifs_orphan_start_commit(struct ubifs_info *c)
 	last = &c->orph_cnext;
 	list_for_each_entry(orphan, &c->orph_new, new_list) {
 		ubifs_assert(orphan->new);
+		ubifs_assert(!orphan->cmt);
 		orphan->new = 0;
+		orphan->cmt = 1;
 		*last = orphan;
 		last = &orphan->cnext;
 	}
@@ -299,7 +301,9 @@ static int write_orph_node(struct ubifs_info *c, int atomic)
 	cnext = c->orph_cnext;
 	for (i = 0; i < cnt; i++) {
 		orphan = cnext;
+		ubifs_assert(orphan->cmt);
 		orph->inos[i] = cpu_to_le64(orphan->inum);
+		orphan->cmt = 0;
 		cnext = orphan->cnext;
 		orphan->cnext = NULL;
 	}
@@ -378,6 +382,7 @@ static int consolidate(struct ubifs_info *c)
 		list_for_each_entry(orphan, &c->orph_list, list) {
 			if (orphan->new)
 				continue;
+			orphan->cmt = 1;
 			*last = orphan;
 			last = &orphan->cnext;
 			cnt += 1;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index d133c27..c16fff7 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -904,6 +904,7 @@ struct ubifs_budget_req {
  * @dnext: next orphan to delete
  * @inum: inode number
  * @new: %1 => added since the last commit, otherwise %0
+ * @cmt: %1 => commit pending, otherwise %0
  */
 struct ubifs_orphan {
 	struct rb_node rb;
@@ -912,7 +913,8 @@ struct ubifs_orphan {
 	struct ubifs_orphan *cnext;
 	struct ubifs_orphan *dnext;
 	ino_t inum;
-	int new;
+	unsigned new:1;
+	unsigned cmt:1;
 };
 
 /**
-- 
1.7.9.5
