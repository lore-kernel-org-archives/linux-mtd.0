Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SHCd8-0000hu-6w
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2012 11:19:31 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: docg3 fix in-middle of blocks reads
Date: Mon,  9 Apr 2012 13:19:08 +0200
Message-Id: <1333970348-10319-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Corner case reads do not work, and return false data and
ECC. This case is typically seen in a ubifs usage, with a
read of type:
 - docg3 docg3: doc_read_oob(from=14882415, mode=1,
 data=(c30eca40:12), oob=(  (null):0))

This results in the following reads:
 - docg3 docg3: doc_read_data_area(buf=  (null), len=111)
 - docg3 docg3: doc_read_data_area(buf=c30eca40, len=12)
 - docg3 docg3: doc_read_data_area(buf=  (null), len=389)
 - docg3 docg3: doc_read_data_area(buf=  (null), len=0)
 - docg3 docg3: doc_read_data_area(buf=  (null), len=16)

If we suppose that the pages content is :
 - bytes 0 .. 111   : 0x0a
 - bytes 112 .. 255 : 0x0f
Then the returned bytes will be :
 - 111 times 0x0a (correct)
 - 0x0a 2 times and 0x0f 10 times (incorrect, should be
 0x0a,0x0f)
 - 0x0f 389 times (correct)
 - nothing
 - correct OOB

The reason seams that the first 111 bytes read ends between
the 2 docg3 planes, and that the first following read (in
the 12 bytes sequence, read of 16 bit word) returns the byte
of the rightmost plane duplicated in high and lower byte of
the word.

Fix this behaviour by ensuring that if the previous read
ended up in-between the 2 planes, there will be a first 1
byte read to get back to the beginning of leftmost plane.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   34 +++++++++++++++++++++++-----------
 1 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 8272c02..3414031 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -227,7 +227,7 @@ static void doc_read_data_area(struct docg3 *docg3, void *buf, int len,
 	u8 data8, *dst8;
 
 	doc_dbg("doc_read_data_area(buf=%p, len=%d)\n", buf, len);
-	cdr = len & 0x3;
+	cdr = len & 0x1;
 	len4 = len - cdr;
 
 	if (first)
@@ -732,12 +732,24 @@ err:
  * @len: the number of bytes to be read (must be a multiple of 4)
  * @buf: the buffer to be filled in (or NULL is forget bytes)
  * @first: 1 if first time read, DOC_READADDRESS should be set
+ * @last_odd: 1 if last read ended up on an odd byte
+ *
+ * Reads bytes from a prepared page. There is a trickery here : if the last read
+ * ended up on an odd offset in the 1024 bytes double page, ie. between the 2
+ * planes, the first byte must be read apart. If a word (16bit) read was used,
+ * the read would return the byte of plane 2 as low *and* high endian, which
+ * will mess the read.
  *
  */
 static int doc_read_page_getbytes(struct docg3 *docg3, int len, u_char *buf,
-				  int first)
+				  int first, int last_odd)
 {
-	doc_read_data_area(docg3, buf, len, first);
+	if (last_odd && len > 0) {
+		doc_read_data_area(docg3, buf, 1, first);
+		doc_read_data_area(docg3, buf ? buf + 1 : buf, len - 1, 0);
+	} else {
+		doc_read_data_area(docg3, buf, len, first);
+	}
 	doc_delay(docg3, 2);
 	return len;
 }
@@ -887,20 +899,20 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 		ret = doc_read_page_ecc_init(docg3, DOC_ECC_BCH_TOTAL_BYTES);
 		if (ret < 0)
 			goto err_in_read;
-		ret = doc_read_page_getbytes(docg3, skip, NULL, 1);
+		ret = doc_read_page_getbytes(docg3, skip, NULL, 1, 0);
 		if (ret < skip)
 			goto err_in_read;
-		ret = doc_read_page_getbytes(docg3, nbdata, buf, 0);
+		ret = doc_read_page_getbytes(docg3, nbdata, buf, 0, skip % 2);
 		if (ret < nbdata)
 			goto err_in_read;
 		doc_read_page_getbytes(docg3,
 				       DOC_LAYOUT_PAGE_SIZE - nbdata - skip,
-				       NULL, 0);
-		ret = doc_read_page_getbytes(docg3, nboob, oobbuf, 0);
+				       NULL, 0, (skip + nbdata) % 2);
+		ret = doc_read_page_getbytes(docg3, nboob, oobbuf, 0, 0);
 		if (ret < nboob)
 			goto err_in_read;
 		doc_read_page_getbytes(docg3, DOC_LAYOUT_OOB_SIZE - nboob,
-				       NULL, 0);
+				       NULL, 0, nboob % 2);
 
 		doc_get_bch_hw_ecc(docg3, hwecc);
 		eccconf1 = doc_register_readb(docg3, DOC_ECCCONF1);
@@ -1004,7 +1016,7 @@ static int doc_reload_bbt(struct docg3 *docg3)
 						     DOC_LAYOUT_PAGE_SIZE);
 		if (!ret)
 			doc_read_page_getbytes(docg3, DOC_LAYOUT_PAGE_SIZE,
-					       buf, 1);
+					       buf, 1, 0);
 		buf += DOC_LAYOUT_PAGE_SIZE;
 	}
 	doc_read_page_finish(docg3);
@@ -1064,10 +1076,10 @@ static int doc_get_erase_count(struct docg3 *docg3, loff_t from)
 	ret = doc_reset_seq(docg3);
 	if (!ret)
 		ret = doc_read_page_prepare(docg3, block0, block1, page,
-					    ofs + DOC_LAYOUT_WEAR_OFFSET);
+					    ofs + DOC_LAYOUT_WEAR_OFFSET, 0);
 	if (!ret)
 		ret = doc_read_page_getbytes(docg3, DOC_LAYOUT_WEAR_SIZE,
-					     buf, 1);
+					     buf, 1, 0);
 	doc_read_page_finish(docg3);
 
 	if (ret || (buf[0] != DOC_ERASE_MARK) || (buf[2] != DOC_ERASE_MARK))
-- 
1.7.5.4
