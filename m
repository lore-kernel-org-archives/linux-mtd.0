Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6v-0002SU-1k
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:15 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEB028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:03 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/30] UBIFS: add few commentaries about TNC
Date: Thu,  9 Jun 2011 12:04:51 +0300
Message-Id: <1307610310-28691-12-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Add a couple of comments - while looking into TNC I could not easily figure out
few facts, so it is a good idea to document them in the code.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/tnc_commit.c |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index f50c3e5..d6fab1a 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -89,6 +89,10 @@ static int make_idx_node(struct ubifs_info *c, struct ubifs_idx_node *idx,
 	ubifs_assert(ubifs_zn_dirty(znode));
 	ubifs_assert(ubifs_zn_cow(znode));
 
+	/*
+	 * Note, unlike 'write_index()' we do not add memory barriers here
+	 * because this function is called with @c->tnc_mutex locked.
+	 */
 	__clear_bit(DIRTY_ZNODE, &znode->flags);
 	__clear_bit(COW_ZNODE, &znode->flags);
 
@@ -903,6 +907,28 @@ static int write_index(struct ubifs_info *c)
 		clear_bit(COW_ZNODE, &znode->flags);
 		smp_mb__after_clear_bit();
 
+		/*
+		 * We have marked the znode as clean but have not updated the
+		 * @c->clean_zn_cnt counter. If this znode becomes dirty again
+		 * before 'free_obsolete_znodes()' is called, then
+		 * @c->clean_zn_cnt will be decremented before it gets
+		 * incremented (resulting in 2 decrements for the same znode).
+		 * This means that @c->clean_zn_cnt may become negative for a
+		 * while.
+		 *
+		 * Q: why we cannot increment @c->clean_zn_cnt?
+		 * A: because we do not have the @c->tnc_mutex locked, and the
+		 *    following code would be racy and buggy:
+		 *
+		 *    if (!ubifs_zn_obsolete(znode)) {
+		 *            atomic_long_inc(&c->clean_zn_cnt);
+		 *            atomic_long_inc(&ubifs_clean_zn_cnt);
+		 *    }
+		 *
+		 *    Thus, we just delay the @c->clean_zn_cnt update until we
+		 *    have the mutex locked.
+		 */
+
 		/* Do not access znode from this point on */
 
 		/* Update buffer positions */
-- 
1.7.2.3
