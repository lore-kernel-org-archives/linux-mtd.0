Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S6g1s-0001F0-KJ
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2012 10:29:34 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] drivers/mtd: docg3 lessen read alignement burden
Date: Sun, 11 Mar 2012 11:28:45 +0100
Message-Id: <1331461726-10087-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The read function was so far requiring the reads to be aligned on page
boundaries, and be page length multiples in size. Relieve these
constraints to ease the userspace ubifs programs runs, which read ubifs
headers of 64 bytes.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index a0f4087..bd9e992 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -734,7 +734,7 @@ err:
  * doc_read_page_getbytes - Reads bytes from a prepared page
  * @docg3: the device
  * @len: the number of bytes to be read (must be a multiple of 4)
- * @buf: the buffer to be filled in
+ * @buf: the buffer to be filled in (or NULL is forget bytes)
  * @first: 1 if first time read, DOC_READADDRESS should be set
  *
  */
@@ -849,7 +849,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 			struct mtd_oob_ops *ops)
 {
 	struct docg3 *docg3 = mtd->priv;
-	int block0, block1, page, ret, ofs = 0;
+	int block0, block1, page, ret, skip, ofs = 0;
 	u8 *oobbuf = ops->oobbuf;
 	u8 *buf = ops->datbuf;
 	size_t len, ooblen, nbdata, nboob;
@@ -869,8 +869,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 
 	doc_dbg("doc_read_oob(from=%lld, mode=%d, data=(%p:%zu), oob=(%p:%zu))\n",
 		from, ops->mode, buf, len, oobbuf, ooblen);
-	if ((len % DOC_LAYOUT_PAGE_SIZE) || (ooblen % DOC_LAYOUT_OOB_SIZE) ||
-	    (from % DOC_LAYOUT_PAGE_SIZE))
+	if (ooblen % DOC_LAYOUT_OOB_SIZE)
 		return -EINVAL;
 
 	ret = -EINVAL;
@@ -882,10 +881,11 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 	ops->oobretlen = 0;
 	ops->retlen = 0;
 	ret = 0;
+	skip = from % DOC_LAYOUT_PAGE_SIZE;
 	while (!ret && (len > 0 || ooblen > 0)) {
-		calc_block_sector(from, &block0, &block1, &page, &ofs,
+		calc_block_sector(from - skip, &block0, &block1, &page, &ofs,
 			docg3->reliable);
-		nbdata = min_t(size_t, len, (size_t)DOC_LAYOUT_PAGE_SIZE);
+		nbdata = min_t(size_t, len, DOC_LAYOUT_PAGE_SIZE - skip);
 		nboob = min_t(size_t, ooblen, (size_t)DOC_LAYOUT_OOB_SIZE);
 		ret = doc_read_page_prepare(docg3, block0, block1, page, ofs);
 		if (ret < 0)
@@ -893,7 +893,10 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 		ret = doc_read_page_ecc_init(docg3, DOC_ECC_BCH_TOTAL_BYTES);
 		if (ret < 0)
 			goto err_in_read;
-		ret = doc_read_page_getbytes(docg3, nbdata, buf, 1);
+		ret = doc_read_page_getbytes(docg3, skip, NULL, 1);
+		if (ret < skip)
+			goto err_in_read;
+		ret = doc_read_page_getbytes(docg3, nbdata, buf, 0);
 		if (ret < nbdata)
 			goto err_in_read;
 		doc_read_page_getbytes(docg3, DOC_LAYOUT_PAGE_SIZE - nbdata,
@@ -950,6 +953,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 		len -= nbdata;
 		ooblen -= nboob;
 		from += DOC_LAYOUT_PAGE_SIZE;
+		skip = 0;
 	}
 
 	return ret;
-- 
1.7.5.4
