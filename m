Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYnw-00036d-CO
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:17 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 12/24] ubifs: Introduce new data node field, compr_size
Date: Thu,  1 Dec 2016 22:20:59 +0100
Message-Id: <1480627271-10441-13-git-send-email-richard@nod.at>
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

When data of a data node is compressed and encrypted
we need to store the size of the compressed data because
before encryption we may have to add padding bytes.

For the new field we consume the last two padding bytes
in struct ubifs_data_node. Two bytes are fine because
the data length is at most 4096.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c     | 11 -----------
 fs/ubifs/ubifs-media.h |  6 ++----
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 91bc76dc559e..b5e86c4da48f 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -82,15 +82,6 @@ static inline void zero_dent_node_unused(struct ubifs_dent_node *dent)
 }
 
 /**
- * zero_data_node_unused - zero out unused fields of an on-flash data node.
- * @data: the data node to zero out
- */
-static inline void zero_data_node_unused(struct ubifs_data_node *data)
-{
-	memset(data->padding, 0, 2);
-}
-
-/**
  * zero_trun_node_unused - zero out unused fields of an on-flash truncation
  *                         node.
  * @trun: the truncation node to zero out
@@ -722,7 +713,6 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 	data->ch.node_type = UBIFS_DATA_NODE;
 	key_write(c, key, &data->key);
 	data->size = cpu_to_le32(len);
-	zero_data_node_unused(data);
 
 	if (!(ui->flags & UBIFS_COMPR_FL))
 		/* Compression is disabled for this inode */
@@ -1357,7 +1347,6 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 					dn->size = cpu_to_le32(dlen);
 					dlen += UBIFS_DATA_NODE_SZ;
 				}
-				zero_data_node_unused(dn);
 			}
 		}
 	}
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index aa302b11aec8..e46331dcca4c 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -553,18 +553,16 @@ struct ubifs_dent_node {
  * @key: node key
  * @size: uncompressed data size in bytes
  * @compr_type: compression type (%UBIFS_COMPR_NONE, %UBIFS_COMPR_LZO, etc)
- * @padding: reserved for future, zeroes
+ * @compr_size: compressed data size in bytes, only valid when data is encrypted
  * @data: data
  *
- * Note, do not forget to amend 'zero_data_node_unused()' function when
- * changing the padding fields.
  */
 struct ubifs_data_node {
 	struct ubifs_ch ch;
 	__u8 key[UBIFS_MAX_KEY_LEN];
 	__le32 size;
 	__le16 compr_type;
-	__u8 padding[2]; /* Watch 'zero_data_node_unused()' if changing! */
+	__le16 compr_size;
 	__u8 data[];
 } __packed;
 
-- 
2.7.3
