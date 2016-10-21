Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZH7-0004ln-OK
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:50:25 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 22/26] ubifs: Add full hash lookup support
Date: Fri, 21 Oct 2016 14:48:37 +0200
Message-Id: <1477054121-10198-23-git-send-email-richard@nod.at>
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

UBIFS stores a 32bit hash of every file, for traditional lookups by name
this scheme is fine since UBIFS can first try to find the file by the
hash of the filename and upon collisions it can walk through all entries
with the same hash and do a string compare.
When filesnames are encrypted fscrypto will ask the filesystem for a
unique cookie, based on this cookie the filesystem has to be able to
locate the target file again. With 32bit hashes this is impossible
because the chance for collisions is very high. Do deal with that we
store a 32bit cookie directly in the UBIFS directory entry node such
that we get a 64bit cookie (32bit from filename hash and the dent
cookie). For a lookup by hash UBIFS finds the entry by the first 32bit
and then compares the dent cookie. If it does not match, it has to do a
linear search of the whole directory and compares all dent cookies until
the correct entry is found.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c         |  7 +++-
 fs/ubifs/journal.c     |  1 -
 fs/ubifs/tnc.c         | 99 +++++++++++++++++++++++++++++++++++++++++++++++++-
 fs/ubifs/ubifs-media.h |  5 ++-
 fs/ubifs/ubifs.h       |  2 +
 5 files changed, 107 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 2f33be5ca57c..4b2db102a0a9 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -253,7 +253,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 		ubifs_assert(fname_len(&nm) == 0);
 		ubifs_assert(fname_name(&nm) == NULL);
 		dent_key_init_hash(c, &key, dir->i_ino, nm.hash);
-		err = ubifs_tnc_lookup(c, &key, dent);
+		err = ubifs_tnc_lookup_dh(c, &key, dent, nm.minor_hash);
 	} else {
 		dent_key_init(c, &key, dir->i_ino, &nm);
 		err = ubifs_tnc_lookup_nm(c, &key, dent, &nm);
@@ -521,7 +521,10 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 		if (encrypted) {
 			fstr.len = fstr_real_len;
 
-			err = fscrypt_fname_disk_to_usr(dir, key_hash_flash(c, &dent->key), 0, &nm.disk_name, &fstr);
+			err = fscrypt_fname_disk_to_usr(dir, key_hash_flash(c,
+							&dent->key),
+							le32_to_cpu(dent->cookie),
+							&nm.disk_name, &fstr);
 			if (err < 0)
 				goto out;
 		} else {
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index eb1cef8032e7..50696c6e0ae2 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -78,7 +78,6 @@ static inline void zero_ino_node_unused(struct ubifs_ino_node *ino)
 static inline void zero_dent_node_unused(struct ubifs_dent_node *dent)
 {
 	dent->padding1 = 0;
-	memset(dent->padding2, 0, 4);
 }
 
 /**
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 0d751297873e..1eaf994addb4 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -1783,7 +1783,7 @@ int ubifs_tnc_bulk_read(struct ubifs_info *c, struct bu_info *bu)
  * @node: the node is returned here
  * @nm: node name
  *
- * This function look up and reads a node which contains name hash in the key.
+ * This function looks up and reads a node which contains name hash in the key.
  * Since the hash may have collisions, there may be many nodes with the same
  * key, so we have to sequentially look to all of them until the needed one is
  * found. This function returns zero in case of success, %-ENOENT if the node
@@ -1831,7 +1831,7 @@ out_unlock:
  * @node: the node is returned here
  * @nm: node name
  *
- * This function look up and reads a node which contains name hash in the key.
+ * This function looks up and reads a node which contains name hash in the key.
  * Since the hash may have collisions, there may be many nodes with the same
  * key, so we have to sequentially look to all of them until the needed one is
  * found. This function returns zero in case of success, %-ENOENT if the node
@@ -1859,9 +1859,104 @@ int ubifs_tnc_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
 	 * Unluckily, there are hash collisions and we have to iterate over
 	 * them look at each direntry with colliding name hash sequentially.
 	 */
+
 	return do_lookup_nm(c, key, node, nm);
 }
 
+static int do_lookup_dh(struct ubifs_info *c, const union ubifs_key *key,
+			struct ubifs_dent_node *dent, uint32_t cookie)
+{
+	int n, err, type = key_type(c, key);
+	struct ubifs_znode *znode;
+	struct ubifs_zbranch *zbr;
+	union ubifs_key *cur_key, start_key;
+
+	ubifs_assert(is_hash_key(c, key));
+
+	lowest_dent_key(c, &start_key, key_inum(c, key));
+	cur_key = &start_key;
+
+	for (;;) {
+		mutex_lock(&c->tnc_mutex);
+
+		err = ubifs_lookup_level0(c, cur_key, &znode, &n);
+		if (unlikely(err < 0))
+			goto out_unlock;
+
+		if (!err) {
+			err = tnc_next(c, &znode, &n);
+			if (err)
+				goto out_unlock;
+		}
+
+		zbr = &znode->zbranch[n];
+		cur_key = &zbr->key;
+
+		if (key_inum(c, cur_key) != key_inum(c, key) ||
+		    key_type(c, cur_key) != type) {
+			err = -ENOENT;
+			goto out_unlock;
+		}
+
+		err = tnc_read_hashed_node(c, zbr, dent);
+		if (err)
+			goto out_unlock;
+
+		if (key_hash(c, key) == key_hash(c, cur_key) &&
+		    le32_to_cpu(dent->cookie) == cookie) {
+			/* We found the entry. :-) */
+			err = 0;
+			goto out_unlock;
+		}
+
+		mutex_unlock(&c->tnc_mutex);
+	}
+
+	ubifs_assert(0);
+
+out_unlock:
+	mutex_unlock(&c->tnc_mutex);
+	return err;
+}
+
+/**
+ * ubifs_tnc_lookup_dh - look up a "double hashed" node.
+ * @c: UBIFS file-system description object
+ * @key: node key to lookup
+ * @node: the node is returned here
+ * @cookie: node cookie for collision resolution
+ *
+ * This function looks up and reads a node which contains name hash in the key.
+ * Since the hash may have collisions, there may be many nodes with the same
+ * key, so we have to sequentially look to all of them until the needed one
+ * with the same cookie value is found.
+ * This function returns zero in case of success, %-ENOENT if the node
+ * was not found, and a negative error code in case of failure.
+ */
+int ubifs_tnc_lookup_dh(struct ubifs_info *c, const union ubifs_key *key,
+			void *node, uint32_t cookie)
+{
+	int err;
+	const struct ubifs_dent_node *dent = node;
+
+	/*
+	 * We assume that in most of the cases there are no name collisions and
+	 * 'ubifs_tnc_lookup()' returns us the right direntry.
+	 */
+	err = ubifs_tnc_lookup(c, key, node);
+	if (err)
+		return err;
+
+	if (le32_to_cpu(dent->cookie) == cookie)
+		return 0;
+
+	/*
+	 * Unluckily, there are hash collisions and we have to iterate over
+	 * them look at each direntry with colliding name hash sequentially.
+	 */
+	return do_lookup_dh(c, key, node, cookie);
+}
+
 /**
  * correct_parent_keys - correct parent znodes' keys.
  * @c: UBIFS file-system description object
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index e46331dcca4c..249124d9a801 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -530,7 +530,8 @@ struct ubifs_ino_node {
  * @padding1: reserved for future, zeroes
  * @type: type of the target inode (%UBIFS_ITYPE_REG, %UBIFS_ITYPE_DIR, etc)
  * @nlen: name length
- * @padding2: reserved for future, zeroes
+ * @cookie: A 32bits random number, used to construct a 64bits
+ *          identifier.
  * @name: zero-terminated name
  *
  * Note, do not forget to amend 'zero_dent_node_unused()' function when
@@ -543,7 +544,7 @@ struct ubifs_dent_node {
 	__u8 padding1;
 	__u8 type;
 	__le16 nlen;
-	__u8 padding2[4]; /* Watch 'zero_dent_node_unused()' if changing! */
+	__le32 cookie;
 	__u8 name[];
 } __packed;
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index f91ef52a4523..3f68b26b120f 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1573,6 +1573,8 @@ int ubifs_lookup_level0(struct ubifs_info *c, const union ubifs_key *key,
 			struct ubifs_znode **zn, int *n);
 int ubifs_tnc_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
 			void *node, const struct fscrypt_name *nm);
+int ubifs_tnc_lookup_dh(struct ubifs_info *c, const union ubifs_key *key,
+			void *node, uint32_t secondary_hash);
 int ubifs_tnc_locate(struct ubifs_info *c, const union ubifs_key *key,
 		     void *node, int *lnum, int *offs);
 int ubifs_tnc_add(struct ubifs_info *c, const union ubifs_key *key, int lnum,
-- 
2.7.3
