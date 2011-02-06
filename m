Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm4St-0007t5-Lj
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 13:15:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH v2 5/5] UBIFS: use max_write_size during recovery
Date: Sun,  6 Feb 2011 15:17:50 +0200
Message-Id: <1296998270-19853-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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
 fs/ubifs/recovery.c |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 77e9b87..4278ae7 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -362,8 +362,9 @@ int ubifs_write_rcvrd_mst_node(struct ubifs_info *c)
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
@@ -371,10 +372,10 @@ static int is_last_write(const struct ubifs_info *c, void *buf, int offs)
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
@@ -836,12 +837,8 @@ struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
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
