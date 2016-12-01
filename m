Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYnw-000373-CN
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 14/24] ubifs: Implement encrypt/decrypt for all IO
Date: Thu,  1 Dec 2016 22:21:01 +0100
Message-Id: <1480627271-10441-15-git-send-email-richard@nod.at>
In-Reply-To: <1480627271-10441-1-git-send-email-richard@nod.at>
References: <1480627271-10441-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: David Gstir <david@sigma-star.at>
---
 fs/ubifs/crypto.c  | 51 +++++++++++++++++++++++++++++++++++
 fs/ubifs/file.c    | 14 ++++++++++
 fs/ubifs/journal.c | 78 +++++++++++++++++++++++++++++++++++++-----------------
 fs/ubifs/super.c   |  6 +++--
 fs/ubifs/ubifs.h   | 31 ++++++++++++++++++++--
 5 files changed, 152 insertions(+), 28 deletions(-)

diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 25bb2062b8a3..aefa3c30b73b 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -35,6 +35,57 @@ static int ubifs_key_prefix(struct inode *inode, u8 **key)
 	return sizeof(prefix) - 1;
 }
 
+int ubifs_encrypt(const struct inode *inode, struct ubifs_data_node *dn,
+		  unsigned int in_len, unsigned int *out_len, int block)
+{
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
+	void *p = &dn->data;
+	struct page *ret;
+	unsigned int pad_len = round_up(in_len, UBIFS_CIPHER_BLOCK_SIZE);
+
+	ubifs_assert(pad_len <= *out_len);
+	dn->compr_size = cpu_to_le16(in_len);
+
+	/* pad to full block cipher length */
+	if (pad_len != in_len)
+		memset(p + in_len, 0, pad_len - in_len);
+
+	ret = fscrypt_encrypt_page(inode, virt_to_page(&dn->data), pad_len,
+			offset_in_page(&dn->data), block, GFP_NOFS);
+	if (IS_ERR(ret)) {
+		ubifs_err(c, "fscrypt_encrypt_page failed: %ld", PTR_ERR(ret));
+		return PTR_ERR(ret);
+	}
+	*out_len = pad_len;
+
+	return 0;
+}
+
+int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
+		  unsigned int *out_len, int block)
+{
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
+	int err;
+	unsigned int clen = le16_to_cpu(dn->compr_size);
+	unsigned int dlen = *out_len;
+
+	if (clen <= 0 || clen > UBIFS_BLOCK_SIZE || clen > dlen) {
+		ubifs_err(c, "bad compr_size: %i", clen);
+		return -EINVAL;
+	}
+
+	ubifs_assert(dlen <= UBIFS_BLOCK_SIZE);
+	err = fscrypt_decrypt_page(inode, virt_to_page(&dn->data), dlen,
+			offset_in_page(&dn->data), block);
+	if (err) {
+		ubifs_err(c, "fscrypt_decrypt_page failed: %i", err);
+		return err;
+	}
+	*out_len = clen;
+
+	return 0;
+}
+
 struct fscrypt_operations ubifs_crypt_operations = {
 	.flags			= FS_CFLG_INPLACE_ENCRYPTION,
 	.get_context		= ubifs_crypt_get_context,
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 60e789a9cac8..4c50f8feb0d5 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -78,6 +78,13 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 		goto dump;
 
 	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
+
+	if (ubifs_crypt_is_encrypted(inode)) {
+		err = ubifs_decrypt(inode, dn, &dlen, block);
+		if (err)
+			goto dump;
+	}
+
 	out_len = UBIFS_BLOCK_SIZE;
 	err = ubifs_decompress(c, &dn->data, dlen, addr, &out_len,
 			       le16_to_cpu(dn->compr_type));
@@ -650,6 +657,13 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 
 			dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 			out_len = UBIFS_BLOCK_SIZE;
+
+			if (ubifs_crypt_is_encrypted(inode)) {
+				err = ubifs_decrypt(inode, dn, &dlen, page_block);
+				if (err)
+					goto out_err;
+			}
+
 			err = ubifs_decompress(c, &dn->data, dlen, addr, &out_len,
 					       le16_to_cpu(dn->compr_type));
 			if (err || len != out_len)
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index b5e86c4da48f..167b9e1c80df 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -688,14 +688,18 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 			 const union ubifs_key *key, const void *buf, int len)
 {
 	struct ubifs_data_node *data;
-	int err, lnum, offs, compr_type, out_len;
+	int err, lnum, offs, compr_type, out_len, compr_len;
 	int dlen = COMPRESSED_DATA_NODE_BUF_SZ, allocated = 1;
 	struct ubifs_inode *ui = ubifs_inode(inode);
+	bool encrypted = ubifs_crypt_is_encrypted(inode);
 
 	dbg_jnlk(key, "ino %lu, blk %u, len %d, key ",
 		(unsigned long)key_inum(c, key), key_block(c, key), len);
 	ubifs_assert(len <= UBIFS_BLOCK_SIZE);
 
+	if (encrypted)
+		dlen += UBIFS_CIPHER_BLOCK_SIZE;
+
 	data = kmalloc(dlen, GFP_NOFS | __GFP_NOWARN);
 	if (!data) {
 		/*
@@ -720,9 +724,18 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 	else
 		compr_type = ui->compr_type;
 
-	out_len = dlen - UBIFS_DATA_NODE_SZ;
-	ubifs_compress(c, buf, len, &data->data, &out_len, &compr_type);
-	ubifs_assert(out_len <= UBIFS_BLOCK_SIZE);
+	out_len = compr_len = dlen - UBIFS_DATA_NODE_SZ;
+	ubifs_compress(c, buf, len, &data->data, &compr_len, &compr_type);
+	ubifs_assert(compr_len <= UBIFS_BLOCK_SIZE);
+
+	if (encrypted) {
+		err = ubifs_encrypt(inode, data, compr_len, &out_len, key_block(c, key));
+		if (err)
+			goto out_free;
+
+	} else {
+		data->compr_size = 0;
+	}
 
 	dlen = UBIFS_DATA_NODE_SZ + out_len;
 	data->compr_type = cpu_to_le16(compr_type);
@@ -1241,31 +1254,55 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 }
 
 /**
- * recomp_data_node - re-compress a truncated data node.
+ * truncate_data_node - re-compress/encrypt a truncated data node.
+ * @c: UBIFS file-system description object
+ * @inode: inode which referes to the data node
+ * @block: data block number
  * @dn: data node to re-compress
  * @new_len: new length
  *
  * This function is used when an inode is truncated and the last data node of
- * the inode has to be re-compressed and re-written.
+ * the inode has to be re-compressed/encrypted and re-written.
  */
-static int recomp_data_node(const struct ubifs_info *c,
-			    struct ubifs_data_node *dn, int *new_len)
+static int truncate_data_node(const struct ubifs_info *c, const struct inode *inode,
+			      unsigned int block, struct ubifs_data_node *dn,
+			      int *new_len)
 {
 	void *buf;
-	int err, len, compr_type, out_len;
+	int err, dlen, compr_type, out_len, old_dlen;
 
 	out_len = le32_to_cpu(dn->size);
 	buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
 	if (!buf)
 		return -ENOMEM;
 
-	len = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
+	dlen = old_dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 	compr_type = le16_to_cpu(dn->compr_type);
-	err = ubifs_decompress(c, &dn->data, len, buf, &out_len, compr_type);
-	if (err)
-		goto out;
 
-	ubifs_compress(c, buf, *new_len, &dn->data, &out_len, &compr_type);
+	if (ubifs_crypt_is_encrypted(inode)) {
+		err = ubifs_decrypt(inode, dn, &dlen, block);
+		if (err)
+			goto out;
+	}
+
+	if (compr_type != UBIFS_COMPR_NONE) {
+		err = ubifs_decompress(c, &dn->data, dlen, buf, &out_len, compr_type);
+		if (err)
+			goto out;
+
+		ubifs_compress(c, buf, *new_len, &dn->data, &out_len, &compr_type);
+	}
+
+	if (ubifs_crypt_is_encrypted(inode)) {
+		err = ubifs_encrypt(inode, dn, out_len, &old_dlen, block);
+		if (err)
+			goto out;
+
+		out_len = old_dlen;
+	} else {
+		dn->compr_size = 0;
+	}
+
 	ubifs_assert(out_len <= UBIFS_BLOCK_SIZE);
 	dn->compr_type = cpu_to_le16(compr_type);
 	dn->size = cpu_to_le32(*new_len);
@@ -1337,16 +1374,9 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 			if (le32_to_cpu(dn->size) <= dlen)
 				dlen = 0; /* Nothing to do */
 			else {
-				int compr_type = le16_to_cpu(dn->compr_type);
-
-				if (compr_type != UBIFS_COMPR_NONE) {
-					err = recomp_data_node(c, dn, &dlen);
-					if (err)
-						goto out_free;
-				} else {
-					dn->size = cpu_to_le32(dlen);
-					dlen += UBIFS_DATA_NODE_SZ;
-				}
+				err = truncate_data_node(c, inode, blk, dn, &dlen);
+				if (err)
+					goto out_free;
 			}
 		}
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a31222947265..ae25c908fbe5 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1210,7 +1210,8 @@ static int mount_ubifs(struct ubifs_info *c)
 		bu_init(c);
 
 	if (!c->ro_mount) {
-		c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ,
+		c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ + \
+					       UBIFS_CIPHER_BLOCK_SIZE,
 					       GFP_KERNEL);
 		if (!c->write_reserve_buf)
 			goto out_free;
@@ -1623,7 +1624,8 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		goto out;
 	}
 
-	c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ, GFP_KERNEL);
+	c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ + \
+				       UBIFS_CIPHER_BLOCK_SIZE, GFP_KERNEL);
 	if (!c->write_reserve_buf) {
 		err = -ENOMEM;
 		goto out;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 8d61b2fc3e82..3803f833b712 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -139,6 +139,12 @@
  */
 #define WORST_COMPR_FACTOR 2
 
+#ifdef CONFIG_UBIFS_FS_ENCRYPTION
+#define UBIFS_CIPHER_BLOCK_SIZE FS_CRYPTO_BLOCK_SIZE
+#else
+#define UBIFS_CIPHER_BLOCK_SIZE 0
+#endif
+
 /*
  * How much memory is needed for a buffer where we compress a data node.
  */
@@ -1783,8 +1789,6 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf, int in_len,
 int ubifs_decompress(const struct ubifs_info *c, const void *buf, int len,
 		     void *out, int *out_len, int compr_type);
 
-extern struct fscrypt_operations ubifs_crypt_operations;
-
 #include "debug.h"
 #include "misc.h"
 #include "key.h"
@@ -1812,8 +1816,31 @@ extern struct fscrypt_operations ubifs_crypt_operations;
 #define fscrypt_fname_free_buffer       fscrypt_notsupp_fname_free_buffer
 #define fscrypt_fname_disk_to_usr       fscrypt_notsupp_fname_disk_to_usr
 #define fscrypt_fname_usr_to_disk       fscrypt_notsupp_fname_usr_to_disk
+static inline int ubifs_encrypt(const struct inode *inode,
+				struct ubifs_data_node *dn,
+				unsigned int in_len, unsigned int *out_len,
+				int block)
+{
+	ubifs_assert(0);
+	return -EOPNOTSUPP;
+}
+static inline int ubifs_decrypt(const struct inode *inode,
+				struct ubifs_data_node *dn,
+				unsigned int *out_len, int block)
+{
+	ubifs_assert(0);
+	return -EOPNOTSUPP;
+}
+#else
+/* crypto.c */
+int ubifs_encrypt(const struct inode *inode, struct ubifs_data_node *dn,
+		  unsigned int in_len, unsigned int *out_len, int block);
+int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
+		  unsigned int *out_len, int block);
 #endif
 
+extern struct fscrypt_operations ubifs_crypt_operations;
+
 static inline bool __ubifs_crypt_is_encrypted(struct inode *inode)
 {
 	struct ubifs_inode *ui = ubifs_inode(inode);
-- 
2.7.3
