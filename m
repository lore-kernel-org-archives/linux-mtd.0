Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyG2K-0002E1-QS
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 12:39:05 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 10/25] ubifs: add separate functions to init/crc a node
Date: Fri,  7 Sep 2018 14:36:31 +0200
Message-Id: <20180907123646.12688-11-s.hauer@pengutronix.de>
In-Reply-To: <20180907123646.12688-1-s.hauer@pengutronix.de>
References: <20180907123646.12688-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When adding authentication support we will embed a HMAC into some
nodes. To prepare these nodes we have to first initialize the nodes,
then add a HMAC and finally add a CRC. To accomplish this add separate
ubifs_init_node/ubifs_crc_node functions.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/io.c    | 42 +++++++++++++++++++++++++++---------------
 fs/ubifs/ubifs.h |  2 ++
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 099bec94b820..4bd61fe146e0 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -365,20 +365,8 @@ static unsigned long long next_sqnum(struct ubifs_info *c)
 	return sqnum;
 }
 
-/**
- * ubifs_prepare_node - prepare node to be written to flash.
- * @c: UBIFS file-system description object
- * @node: the node to pad
- * @len: node length
- * @pad: if the buffer has to be padded
- *
- * This function prepares node at @node to be written to the media - it
- * calculates node CRC, fills the common header, and adds proper padding up to
- * the next minimum I/O unit if @pad is not zero.
- */
-void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int pad)
+void ubifs_init_node(struct ubifs_info *c, void *node, int len, int pad)
 {
-	uint32_t crc;
 	struct ubifs_ch *ch = node;
 	unsigned long long sqnum = next_sqnum(c);
 
@@ -389,8 +377,6 @@ void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int pad)
 	ch->group_type = UBIFS_NO_NODE_GROUP;
 	ch->sqnum = cpu_to_le64(sqnum);
 	ch->padding[0] = ch->padding[1] = 0;
-	crc = crc32(UBIFS_CRC32_INIT, node + 8, len - 8);
-	ch->crc = cpu_to_le32(crc);
 
 	if (pad) {
 		len = ALIGN(len, 8);
@@ -399,6 +385,32 @@ void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int pad)
 	}
 }
 
+void ubifs_crc_node(struct ubifs_info *c, void *node, int len)
+{
+	struct ubifs_ch *ch = node;
+	uint32_t crc;
+
+	crc = crc32(UBIFS_CRC32_INIT, node + 8, len - 8);
+	ch->crc = cpu_to_le32(crc);
+}
+
+/**
+ * ubifs_prepare_node - prepare node to be written to flash.
+ * @c: UBIFS file-system description object
+ * @node: the node to pad
+ * @len: node length
+ * @pad: if the buffer has to be padded
+ *
+ * This function prepares node at @node to be written to the media - it
+ * calculates node CRC, fills the common header, and adds proper padding up to
+ * the next minimum I/O unit if @pad is not zero.
+ */
+void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int pad)
+{
+	ubifs_init_node(c, node, len, pad);
+	ubifs_crc_node(c, node, len);
+}
+
 /**
  * ubifs_prep_grp_node - prepare node of a group to be written to flash.
  * @c: UBIFS file-system description object
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 93e1c34c097f..0422865661b1 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1494,6 +1494,8 @@ int ubifs_write_node(struct ubifs_info *c, void *node, int len, int lnum,
 		     int offs);
 int ubifs_check_node(const struct ubifs_info *c, const void *buf, int lnum,
 		     int offs, int quiet, int must_chk_crc);
+void ubifs_init_node(struct ubifs_info *c, void *buf, int len, int pad);
+void ubifs_crc_node(struct ubifs_info *c, void *buf, int len);
 void ubifs_prepare_node(struct ubifs_info *c, void *buf, int len, int pad);
 void ubifs_prep_grp_node(struct ubifs_info *c, void *node, int len, int last);
 int ubifs_io_init(struct ubifs_info *c);
-- 
2.18.0
