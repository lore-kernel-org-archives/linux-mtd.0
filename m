Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TaasN-0001Cb-A0
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2012 23:35:39 +0000
Received: by mail-gg0-f177.google.com with SMTP id y3so581877ggc.36
 for <linux-mtd@lists.infradead.org>; Mon, 19 Nov 2012 15:35:36 -0800 (PST)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [TRIVIAL PATCH] ubi/gluebi: Rename misleading variables
Date: Mon, 19 Nov 2012 20:35:20 -0300
Message-Id: <1353368120-5899-1-git-send-email-elezegarcia@gmail.com>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Both names 'total_read' and 'total_written' are actually used
as the number of bytes left to read and write.
Fix this confusion by renaming both to 'bytes_left'.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/mtd/ubi/gluebi.c |   28 ++++++++++++++--------------
 1 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 4bd4db8..b93807b 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -171,17 +171,17 @@ static void gluebi_put_device(struct mtd_info *mtd)
 static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 		       size_t *retlen, unsigned char *buf)
 {
-	int err = 0, lnum, offs, total_read;
+	int err = 0, lnum, offs, bytes_left;
 	struct gluebi_device *gluebi;
 
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
 	lnum = div_u64_rem(from, mtd->erasesize, &offs);
-	total_read = len;
-	while (total_read) {
+	bytes_left = len;
+	while (bytes_left) {
 		size_t to_read = mtd->erasesize - offs;
 
-		if (to_read > total_read)
-			to_read = total_read;
+		if (to_read > bytes_left)
+			to_read = bytes_left;
 
 		err = ubi_read(gluebi->desc, lnum, buf, offs, to_read);
 		if (err)
@@ -189,11 +189,11 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 		lnum += 1;
 		offs = 0;
-		total_read -= to_read;
+		bytes_left -= to_read;
 		buf += to_read;
 	}
 
-	*retlen = len - total_read;
+	*retlen = len - bytes_left;
 	return err;
 }
 
@@ -211,7 +211,7 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 			size_t *retlen, const u_char *buf)
 {
-	int err = 0, lnum, offs, total_written;
+	int err = 0, lnum, offs, bytes_left;
 	struct gluebi_device *gluebi;
 
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
@@ -220,12 +220,12 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (len % mtd->writesize || offs % mtd->writesize)
 		return -EINVAL;
 
-	total_written = len;
-	while (total_written) {
+	bytes_left = len;
+	while (bytes_left) {
 		size_t to_write = mtd->erasesize - offs;
 
-		if (to_write > total_written)
-			to_write = total_written;
+		if (to_write > bytes_left)
+			to_write = bytes_left;
 
 		err = ubi_leb_write(gluebi->desc, lnum, buf, offs, to_write);
 		if (err)
@@ -233,11 +233,11 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		lnum += 1;
 		offs = 0;
-		total_written -= to_write;
+		bytes_left -= to_write;
 		buf += to_write;
 	}
 
-	*retlen = len - total_written;
+	*retlen = len - bytes_left;
 	return err;
 }
 
-- 
1.7.8.6
