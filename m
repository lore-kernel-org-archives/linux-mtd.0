Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGr-0004Wr-7r
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:50:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 24/26] ubifs: Implement UBIFS_FLG_DOUBLE_HASH
Date: Fri, 21 Oct 2016 14:48:39 +0200
Message-Id: <1477054121-10198-25-git-send-email-richard@nod.at>
In-Reply-To: <1477054121-10198-1-git-send-email-richard@nod.at>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This feature flag indicates that all directory entry nodes have a 32bit
cookie set and therefore UBIFS is allowed to perform lookups by hash.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c     | 14 +++++++++++---
 fs/ubifs/sb.c          |  2 ++
 fs/ubifs/tnc.c         |  3 +++
 fs/ubifs/ubifs-media.h |  3 +++
 fs/ubifs/ubifs.h       |  2 ++
 5 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index dcecfbfbf40e..c8a483a0df2c 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -501,6 +501,14 @@ static void mark_inode_clean(struct ubifs_info *c, struct ubifs_inode *ui)
 	ui->dirty = 0;
 }
 
+static void set_dent_cookie(struct ubifs_info *c, struct ubifs_dent_node *dent)
+{
+	if (c->double_hash)
+		dent->cookie = prandom_u32();
+	else
+		dent->cookie = 0;
+}
+
 /**
  * ubifs_jnl_update - update inode.
  * @c: UBIFS file-system description object
@@ -589,7 +597,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	dent->nlen = cpu_to_le16(fname_len(nm));
 	memcpy(dent->name, fname_name(nm), fname_len(nm));
 	dent->name[fname_len(nm)] = '\0';
-	dent->cookie = prandom_u32();
+	set_dent_cookie(c, dent);
 
 	zero_dent_node_unused(dent);
 	ubifs_prep_grp_node(c, dent, dlen, 0);
@@ -993,7 +1001,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	dent->nlen = cpu_to_le16(fname_len(new_nm));
 	memcpy(dent->name, fname_name(new_nm), fname_len(new_nm));
 	dent->name[fname_len(new_nm)] = '\0';
-	dent->cookie = prandom_u32();
+	set_dent_cookie(c, dent);
 	zero_dent_node_unused(dent);
 	ubifs_prep_grp_node(c, dent, dlen1, 0);
 
@@ -1006,7 +1014,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	dent2->nlen = cpu_to_le16(fname_len(old_nm));
 	memcpy(dent2->name, fname_name(old_nm), fname_len(old_nm));
 	dent2->name[fname_len(old_nm)] = '\0';
-	dent2->cookie = prandom_u32();
+	set_dent_cookie(c, dent2);
 	zero_dent_node_unused(dent2);
 	ubifs_prep_grp_node(c, dent2, dlen2, 0);
 
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 3cbb904a6d7d..4a2b4c361587 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -163,6 +163,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	tmp64 = (long long)max_buds * c->leb_size;
 	if (big_lpt)
 		sup_flags |= UBIFS_FLG_BIGLPT;
+	sup_flags |= UBIFS_FLG_DOUBLE_HASH;
 
 	sup->ch.node_type  = UBIFS_SB_NODE;
 	sup->key_hash      = UBIFS_KEY_HASH_R5;
@@ -620,6 +621,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	memcpy(&c->uuid, &sup->uuid, 16);
 	c->big_lpt = !!(sup_flags & UBIFS_FLG_BIGLPT);
 	c->space_fixup = !!(sup_flags & UBIFS_FLG_SPACE_FIXUP);
+	c->double_hash = !!(sup_flags & UBIFS_FLG_DOUBLE_HASH);
 
 	/* Automatically increase file system size to the maximum size */
 	c->old_leb_cnt = c->leb_cnt;
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 1eaf994addb4..02205a68f851 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -1939,6 +1939,9 @@ int ubifs_tnc_lookup_dh(struct ubifs_info *c, const union ubifs_key *key,
 	int err;
 	const struct ubifs_dent_node *dent = node;
 
+	if (!c->double_hash)
+		return -EOPNOTSUPP;
+
 	/*
 	 * We assume that in most of the cases there are no name collisions and
 	 * 'ubifs_tnc_lookup()' returns us the right direntry.
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index 249124d9a801..0cbdc6b70a00 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -418,10 +418,13 @@ enum {
  *
  * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
  * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs needed
+ * UBIFS_FLG_DOUBLE_HASH: store a 32bit cookie in directory entry nodes to
+ *			  support 64bit cookies for lookups by hash
  */
 enum {
 	UBIFS_FLG_BIGLPT = 0x02,
 	UBIFS_FLG_SPACE_FIXUP = 0x04,
+	UBIFS_FLG_DOUBLE_HASH = 0x08,
 };
 
 /**
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 294e4047bcc0..59d55887b3d8 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1014,6 +1014,7 @@ struct ubifs_debug_info;
  *
  * @big_lpt: flag that LPT is too big to write whole during commit
  * @space_fixup: flag indicating that free space in LEBs needs to be cleaned up
+ * @double_hash: flag indicating that we can do lookups by hash
  * @no_chk_data_crc: do not check CRCs when reading data nodes (except during
  *                   recovery)
  * @bulk_read: enable bulk-reads
@@ -1256,6 +1257,7 @@ struct ubifs_info {
 
 	unsigned int big_lpt:1;
 	unsigned int space_fixup:1;
+	unsigned int double_hash:1;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
 	unsigned int default_compr:2;
-- 
2.7.3
