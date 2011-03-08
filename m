Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwsJ6-0008ST-PB
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 08:30:18 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v3 7/7] UBIFS: use max_write_size during recovery
Date: Tue,  8 Mar 2011 10:32:48 +0200
Message-Id: <1299573168-27760-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1299573168-27760-1-git-send-email-dedekind1@gmail.com>
References: <1299573168-27760-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When recovering from unclean reboots UBIFS scans the journal and checks nodes.
If a corrupted node is found, UBIFS tries to check if this is the last node
in the LEB or not. This is is done by checking if there only 0xFF bytes
starting from the next min. I/O unit. However, since now we write in
c->max_write_size, we should actually check for 0xFFs starting from the
next max. write unit.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |   23 ++++++++++-------------
 1 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index e2714f8..936f2cb 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -38,7 +38,7 @@
  * UBIFS writes only to erased LEBs, so it writes only to the flash space
  * containing only 0xFFs. UBIFS also always writes strictly from the beginning
  * of the LEB to the end. And UBIFS assumes that the underlying flash media
- * writes in @c->min_io_unit bytes at a time.
+ * writes in @c->max_write_size bytes at a time.
  *
  * Hence, if UBIFS finds a corrupted node at offset X, it expects only the min.
  * I/O unit corresponding to offset X to contain corrupted data, all the
@@ -379,8 +379,9 @@ int ubifs_write_rcvrd_mst_node(struct ubifs_info *c)
  * @offs: offset to check
  *
  * This function returns %1 if @offs was in the last write to the LEB whose data
- * is in @buf, otherwise %0 is returned.  The determination is made by checking
- * for subsequent empty space starting from the next @c->min_io_size boundary.
+ * is in @buf, otherwise %0 is returned. The determination is made by checking
+ * for subsequent empty space starting from the next @c->max_write_size
+ * boundary.
  */
 static int is_last_write(const struct ubifs_info *c, void *buf, int offs)
 {
@@ -388,10 +389,10 @@ static int is_last_write(const struct ubifs_info *c, void *buf, int offs)
 	uint8_t *p;
 
 	/*
-	 * Round up to the next @c->min_io_size boundary i.e. @offs is in the
-	 * last wbuf written. After that should be empty space.
+	 * Round up to the next @c->max_write_size boundary i.e. @offs is in
+	 * the last wbuf written. After that should be empty space.
 	 */
-	empty_offs = ALIGN(offs + 1, c->min_io_size);
+	empty_offs = ALIGN(offs + 1, c->max_write_size);
 	check_len = c->leb_size - empty_offs;
 	p = buf + empty_offs - offs;
 	return is_empty(p, check_len);
@@ -446,7 +447,7 @@ static int no_more_nodes(const struct ubifs_info *c, void *buf, int len,
 	int skip, dlen = le32_to_cpu(ch->len);
 
 	/* Check for empty space after the corrupt node's common header */
-	skip = ALIGN(offs + UBIFS_CH_SZ, c->min_io_size) - offs;
+	skip = ALIGN(offs + UBIFS_CH_SZ, c->max_write_size) - offs;
 	if (is_empty(buf + skip, len - skip))
 		return 1;
 	/*
@@ -458,7 +459,7 @@ static int no_more_nodes(const struct ubifs_info *c, void *buf, int len,
 		return 0;
 	}
 	/* Now we know the corrupt node's length we can skip over it */
-	skip = ALIGN(offs + dlen, c->min_io_size) - offs;
+	skip = ALIGN(offs + dlen, c->max_write_size) - offs;
 	/* After which there should be empty space */
 	if (is_empty(buf + skip, len - skip))
 		return 1;
@@ -857,12 +858,8 @@ struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
 static int recover_head(const struct ubifs_info *c, int lnum, int offs,
 			void *sbuf)
 {
-	int len, err;
+	int len = c->max_write_size, err;
 
-	if (c->min_io_size > 1)
-		len = c->min_io_size;
-	else
-		len = 512;
 	if (offs + len > c->leb_size)
 		len = c->leb_size - offs;
 
-- 
1.7.2.3
