Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NbEr1-0001W0-EE
	for linux-mtd@lists.infradead.org; Sat, 30 Jan 2010 15:03:28 +0000
Received: by fxm22 with SMTP id 22so1374023fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 30 Jan 2010 07:03:18 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 10/17] MTD: nand: make reads using MTD_OOB_RAW affect only ECC
	validation
Date: Sat, 30 Jan 2010 17:02:41 +0200
Message-Id: <1264863768-27606-11-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1264863768-27606-1-git-send-email-maximlevitsky@gmail.com>
References: <1264863768-27606-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This changes the behavier of MTD_OOB_RAW. It used to read both OOB and data
to the data buffer, however you would still need to specify the dummy oob buffer.

This is only used in one place, but makes it hard to read data+oob without ECC
test, thus I removed that behavier, and fixed the user.

Now MTD_OOB_RAW behaves like MTD_OOB_PLACE, but doesn't do ECC validation

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    5 -----
 drivers/mtd/nand/nand_bbt.c  |   26 ++++++++++++++++++++++----
 include/linux/mtd/mtd.h      |    4 +---
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 405c538..8ff36be 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1286,8 +1286,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 			if (unlikely(oob)) {
 
-				/* Raw mode does data:oob:data:oob */
-				if (ops->mode != MTD_OOB_RAW) {
 					int toread = min(oobreadlen,
 								max_oobsize);
 					if (toread) {
@@ -1295,9 +1293,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 							oob, ops, toread);
 						oobreadlen -= toread;
 					}
-				} else
-					buf = nand_transfer_oob(chip,
-						buf, ops, mtd->oobsize);
 			}
 
 			if (!(chip->options & NAND_NO_READRDY)) {
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 55c23e5..387c45c 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -237,15 +237,33 @@ static int scan_read_raw(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 			 size_t len)
 {
 	struct mtd_oob_ops ops;
+	int res;
 
 	ops.mode = MTD_OOB_RAW;
 	ops.ooboffs = 0;
 	ops.ooblen = mtd->oobsize;
-	ops.oobbuf = buf;
-	ops.datbuf = buf;
-	ops.len = len;
 
-	return mtd->read_oob(mtd, offs, &ops);
+
+	while (len > 0) {
+		if (len <= mtd->writesize) {
+			ops.oobbuf = buf + len;
+			ops.datbuf = buf;
+			ops.len = len;
+			return mtd->read_oob(mtd, offs, &ops);
+		} else {
+			ops.oobbuf = buf + mtd->writesize;
+			ops.datbuf = buf;
+			ops.len = mtd->writesize;
+			res = mtd->read_oob(mtd, offs, &ops);
+
+			if (res)
+				return res;
+		}
+
+		buf += mtd->oobsize + mtd->writesize;
+		len -= mtd->writesize;
+	}
+	return 0;
 }
 
 /*
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 662d747..84bb375 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -61,9 +61,7 @@ struct mtd_erase_region_info {
  * MTD_OOB_PLACE:	oob data are placed at the given offset
  * MTD_OOB_AUTO:	oob data are automatically placed at the free areas
  *			which are defined by the ecclayout
- * MTD_OOB_RAW:		mode to read raw data+oob in one chunk. The oob data
- *			is inserted into the data. Thats a raw image of the
- *			flash contents.
+ * MTD_OOB_RAW:		mode to read oob and data without doing ECC checking
  */
 typedef enum {
 	MTD_OOB_PLACE,
-- 
1.6.3.3
