Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyG2K-0002E7-Qa
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 12:39:04 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 12/25] ubifs: Create functions to embed a HMAC in a node
Date: Fri,  7 Sep 2018 14:36:33 +0200
Message-Id: <20180907123646.12688-13-s.hauer@pengutronix.de>
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

With authentication support some nodes (master node, super block node)
get a HMAC embedded into them. This patch adds functions to prepare and
write such a node.
The difficulty is that besides the HMAC the nodes also have a CRC which
must stay valid. This means we first have to initialize all fields in
the node, then calculate the HMAC (not covering the CRC) and finally
calculate the CRC.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/io.c    | 72 ++++++++++++++++++++++++++++++++++++++++++++----
 fs/ubifs/ubifs.h |  4 +++
 2 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 4bd61fe146e0..d124117efd42 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -394,6 +394,39 @@ void ubifs_crc_node(struct ubifs_info *c, void *node, int len)
 	ch->crc = cpu_to_le32(crc);
 }
 
+/**
+ * ubifs_prepare_node_hmac - prepare node to be written to flash.
+ * @c: UBIFS file-system description object
+ * @node: the node to pad
+ * @len: node length
+ * @hmac_offs: offset of the HMAC in the node
+ * @pad: if the buffer has to be padded
+ *
+ * This function prepares node at @node to be written to the media - it
+ * calculates node CRC, fills the common header, and adds proper padding up to
+ * the next minimum I/O unit if @pad is not zero. if @hmac_offs is positive then
+ * a HMAC is inserted into the node at the given offset.
+ *
+ * This function returns 0 for success or a negative error code otherwise.
+ */
+int ubifs_prepare_node_hmac(struct ubifs_info *c, void *node, int len,
+			    int hmac_offs, int pad)
+{
+	int err;
+
+	ubifs_init_node(c, node, len, pad);
+
+	if (hmac_offs > 0) {
+		err = ubifs_node_insert_hmac(c, node, len, hmac_offs);
+		if (err)
+			return err;
+	}
+
+	ubifs_crc_node(c, node, len);
+
+	return 0;
+}
+
 /**
  * ubifs_prepare_node - prepare node to be written to flash.
  * @c: UBIFS file-system description object
@@ -407,8 +440,11 @@ void ubifs_crc_node(struct ubifs_info *c, void *node, int len)
  */
 void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int pad)
 {
-	ubifs_init_node(c, node, len, pad);
-	ubifs_crc_node(c, node, len);
+	/*
+	 * Deliberately ignore return value since this function can only fail
+	 * when a hmac offset is given.
+	 */
+	ubifs_prepare_node_hmac(c, node, len, 0, pad);
 }
 
 /**
@@ -861,12 +897,13 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 }
 
 /**
- * ubifs_write_node - write node to the media.
+ * ubifs_write_node_hmac - write node to the media.
  * @c: UBIFS file-system description object
  * @buf: the node to write
  * @len: node length
  * @lnum: logical eraseblock number
  * @offs: offset within the logical eraseblock
+ * @hmac_offs: offset of the HMAC within the node
  *
  * This function automatically fills node magic number, assigns sequence
  * number, and calculates node CRC checksum. The length of the @buf buffer has
@@ -874,8 +911,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
  * appends padding node and padding bytes if needed. Returns zero in case of
  * success and a negative error code in case of failure.
  */
-int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
-		     int offs)
+int ubifs_write_node_hmac(struct ubifs_info *c, void *buf, int len, int lnum,
+			  int offs, int hmac_offs)
 {
 	int err, buf_len = ALIGN(len, c->min_io_size);
 
@@ -890,7 +927,10 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
 	if (c->ro_error)
 		return -EROFS;
 
-	ubifs_prepare_node(c, buf, len, 1);
+	err = ubifs_prepare_node_hmac(c, buf, len, hmac_offs, 1);
+	if (err)
+		return err;
+
 	err = ubifs_leb_write(c, lnum, buf, offs, buf_len);
 	if (err)
 		ubifs_dump_node(c, buf);
@@ -898,6 +938,26 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
 	return err;
 }
 
+/**
+ * ubifs_write_node - write node to the media.
+ * @c: UBIFS file-system description object
+ * @buf: the node to write
+ * @len: node length
+ * @lnum: logical eraseblock number
+ * @offs: offset within the logical eraseblock
+ *
+ * This function automatically fills node magic number, assigns sequence
+ * number, and calculates node CRC checksum. The length of the @buf buffer has
+ * to be aligned to the minimal I/O unit size. This function automatically
+ * appends padding node and padding bytes if needed. Returns zero in case of
+ * success and a negative error code in case of failure.
+ */
+int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
+		     int offs)
+{
+	return ubifs_write_node_hmac(c, buf, len, lnum, offs, -1);
+}
+
 /**
  * ubifs_read_node_wbuf - read node from the media or write-buffer.
  * @wbuf: wbuf to check for un-written data
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 3300f68c4097..42e904b060f9 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1710,11 +1710,15 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
 			 int lnum, int offs);
 int ubifs_write_node(struct ubifs_info *c, void *node, int len, int lnum,
 		     int offs);
+int ubifs_write_node_hmac(struct ubifs_info *c, void *buf, int len, int lnum,
+			  int offs, int hmac_offs);
 int ubifs_check_node(const struct ubifs_info *c, const void *buf, int lnum,
 		     int offs, int quiet, int must_chk_crc);
 void ubifs_init_node(struct ubifs_info *c, void *buf, int len, int pad);
 void ubifs_crc_node(struct ubifs_info *c, void *buf, int len);
 void ubifs_prepare_node(struct ubifs_info *c, void *buf, int len, int pad);
+int ubifs_prepare_node_hmac(struct ubifs_info *c, void *node, int len,
+			    int hmac_offs, int pad);
 void ubifs_prep_grp_node(struct ubifs_info *c, void *node, int len, int last);
 int ubifs_io_init(struct ubifs_info *c);
 void ubifs_pad(const struct ubifs_info *c, void *buf, int pad);
-- 
2.18.0
