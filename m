Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62Ew-00056v-61
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:23:06 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 24/29] ubifs: Rename tnc_read_node_nm
Date: Sun, 13 Nov 2016 22:21:07 +0100
Message-Id: <1479072072-6844-25-git-send-email-richard@nod.at>
In-Reply-To: <1479072072-6844-1-git-send-email-richard@nod.at>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

tnc_read_hashed_node() is a better name since we read a node
by a given hash, not a name.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/tnc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 0d0030461cb4..0d751297873e 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -378,7 +378,7 @@ static void lnc_free(struct ubifs_zbranch *zbr)
 }
 
 /**
- * tnc_read_node_nm - read a "hashed" leaf node.
+ * tnc_read_hashed_node - read a "hashed" leaf node.
  * @c: UBIFS file-system description object
  * @zbr: key and position of the node
  * @node: node is returned here
@@ -388,8 +388,8 @@ static void lnc_free(struct ubifs_zbranch *zbr)
  * added to LNC. Returns zero in case of success or a negative negative error
  * code in case of failure.
  */
-static int tnc_read_node_nm(struct ubifs_info *c, struct ubifs_zbranch *zbr,
-			    void *node)
+static int tnc_read_hashed_node(struct ubifs_info *c, struct ubifs_zbranch *zbr,
+				void *node)
 {
 	int err;
 
@@ -1454,7 +1454,7 @@ int ubifs_tnc_locate(struct ubifs_info *c, const union ubifs_key *key,
 		 * In this case the leaf node cache gets used, so we pass the
 		 * address of the zbranch and keep the mutex locked
 		 */
-		err = tnc_read_node_nm(c, zt, node);
+		err = tnc_read_hashed_node(c, zt, node);
 		goto out;
 	}
 	if (safely) {
@@ -1817,7 +1817,7 @@ static int do_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
 		goto out_unlock;
 	}
 
-	err = tnc_read_node_nm(c, &znode->zbranch[n], node);
+	err = tnc_read_hashed_node(c, &znode->zbranch[n], node);
 
 out_unlock:
 	mutex_unlock(&c->tnc_mutex);
@@ -2815,7 +2815,7 @@ struct ubifs_dent_node *ubifs_tnc_next_ent(struct ubifs_info *c,
 		goto out_free;
 	}
 
-	err = tnc_read_node_nm(c, zbr, dent);
+	err = tnc_read_hashed_node(c, zbr, dent);
 	if (unlikely(err))
 		goto out_free;
 
-- 
2.7.3
