Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZs5-0005LO-AX
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:42:13 +0000
Received: from mgw-mx03.nokia.com (mgw-mx03.nokia.com [192.100.122.230])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m8U7gAVw010034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2008 10:42:10 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: remove unneeded unlikely()
Date: Tue, 30 Sep 2008 12:18:58 +0300
Message-Id: <1222766358-21886-3-git-send-email-dedekind@infradead.org>
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hirofumi Nakagawa <hnakagawa@miraclelinux.com>

IS_ERR() macro already has unlikely(), so do not use constructions
like 'if (unlikely(IS_ERR())'.

Signed-off-by: Hirofumi Nakagawa <hnakagawa@miraclelinux.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/find.c  |    4 ++--
 fs/ubifs/gc.c    |    8 ++++----
 fs/ubifs/tnc.c   |    4 ++--
 fs/ubifs/xattr.c |    2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 47814cd..717d79c 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -901,11 +901,11 @@ static int get_idx_gc_leb(struct ubifs_info *c)
 	 * it is needed now for this commit.
 	 */
 	lp = ubifs_lpt_lookup_dirty(c, lnum);
-	if (unlikely(IS_ERR(lp)))
+	if (IS_ERR(lp))
 		return PTR_ERR(lp);
 	lp = ubifs_change_lp(c, lp, LPROPS_NC, LPROPS_NC,
 			     lp->flags | LPROPS_INDEX, -1);
-	if (unlikely(IS_ERR(lp)))
+	if (IS_ERR(lp))
 		return PTR_ERR(lp);
 	dbg_find("LEB %d, dirty %d and free %d flags %#x",
 		 lp->lnum, lp->dirty, lp->free, lp->flags);
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 02aba36..a6b633a 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -653,7 +653,7 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 	 */
 	while (1) {
 		lp = ubifs_fast_find_freeable(c);
-		if (unlikely(IS_ERR(lp))) {
+		if (IS_ERR(lp)) {
 			err = PTR_ERR(lp);
 			goto out;
 		}
@@ -665,7 +665,7 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 		if (err)
 			goto out;
 		lp = ubifs_change_lp(c, lp, c->leb_size, 0, lp->flags, 0);
-		if (unlikely(IS_ERR(lp))) {
+		if (IS_ERR(lp)) {
 			err = PTR_ERR(lp);
 			goto out;
 		}
@@ -680,7 +680,7 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 	/* Record index freeable LEBs for unmapping after commit */
 	while (1) {
 		lp = ubifs_fast_find_frdi_idx(c);
-		if (unlikely(IS_ERR(lp))) {
+		if (IS_ERR(lp)) {
 			err = PTR_ERR(lp);
 			goto out;
 		}
@@ -696,7 +696,7 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 		/* Don't release the LEB until after the next commit */
 		flags = (lp->flags | LPROPS_TAKEN) ^ LPROPS_INDEX;
 		lp = ubifs_change_lp(c, lp, c->leb_size, 0, flags, 1);
-		if (unlikely(IS_ERR(lp))) {
+		if (IS_ERR(lp)) {
 			err = PTR_ERR(lp);
 			kfree(idx_gc);
 			goto out;
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 7634c59..ba13c92 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -284,7 +284,7 @@ static struct ubifs_znode *dirty_cow_znode(struct ubifs_info *c,
 	}
 
 	zn = copy_znode(c, znode);
-	if (unlikely(IS_ERR(zn)))
+	if (IS_ERR(zn))
 		return zn;
 
 	if (zbr->len) {
@@ -1128,7 +1128,7 @@ static struct ubifs_znode *dirty_cow_bottom_up(struct ubifs_info *c,
 			ubifs_assert(znode == c->zroot.znode);
 			znode = dirty_cow_znode(c, &c->zroot);
 		}
-		if (unlikely(IS_ERR(znode)) || !p)
+		if (IS_ERR(znode) || !p)
 			break;
 		ubifs_assert(path[p - 1] >= 0);
 		ubifs_assert(path[p - 1] < znode->child_cnt);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 649bec7..cfd31e2 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -446,7 +446,7 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		int type;
 
 		xent = ubifs_tnc_next_ent(c, &key, &nm);
-		if (unlikely(IS_ERR(xent))) {
+		if (IS_ERR(xent)) {
 			err = PTR_ERR(xent);
 			break;
 		}
-- 
1.5.4.1
