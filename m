Received: from mail-pb0-f50.google.com ([209.85.160.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFou0-00062q-Id
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 16:51:46 +0000
Received: by mail-pb0-f50.google.com with SMTP id up1so1207542pbc.9
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2013 09:51:42 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC "v2"] mtd: nand: reintroduce NAND_NO_READRDY as NAND_NEED_READRDY
Date: Wed, 13 Mar 2013 09:51:31 -0700
Message-Id: <1363193491-1843-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This (somewhat) reverts commit 1696e6bc2ae83734e64e206ac99766ea19e9a14e.

In the patch "mtd: nand: kill NAND_NO_READRDY", I overlooked a few
things.

The original documentation for NAND_NO_READRDY included "True for all
large page devices, as they do not support autoincrement." I was
conflating "not support autoincrement" with the NAND_NO_AUTOINCR option,
which was in fact doing nothing. So, when I dropped NAND_NO_AUTOINCR, I
concluded that I then could harmlessly drop NAND_NO_READRDY. But of
course the fact the NAND_NO_AUTOINCR was doing nothing didn't mean
NAND_NO_READRDY was doing nothing...

So, NAND_NO_READRDY is re-introduced as NAND_NEED_READRDY and applied
only to those few remaining small-page NAND which needed it in the first
place.

This is probably a candidate for stable, but there will certainly be
conflicts, as drivers/mtd/nand/nand_ids.c has changed significantly.

Compile-tested only; I don't have a setup that requires this.

Reported-by: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---

This is an attempt at a version 2 of Alexander's RFC patch. I feel like the
original (per NAND chip type) option makes more sense than per driver (where
Alexander sets this option only for the diskonchip driver). But it is certainly
more invasive. And apparently, no one else needs this option (or at least, no
one complains). Perhaps everyone has just moved beyond small-page NAND?

 drivers/mtd/nand/nand_base.c |   16 +++++++++++
 drivers/mtd/nand/nand_ids.c  |   60 +++++++++++++++++++++---------------------
 include/linux/mtd/nand.h     |    8 ++++++
 3 files changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 72eada2..7e64dca 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1550,6 +1550,14 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 					oobreadlen -= toread;
 				}
 			}
+
+			if (chip->options & NAND_NEED_READRDY) {
+				/* Apply delay or wait for ready/busy pin */
+				if (!chip->dev_ready)
+					udelay(chip->chip_delay);
+				else
+					nand_wait_ready(mtd);
+			}
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
@@ -1814,6 +1822,14 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 		len = min(len, readlen);
 		buf = nand_transfer_oob(chip, buf, ops, len);
 
+		if (chip->options & NAND_NEED_READRDY) {
+			/* Apply delay or wait for ready/busy pin */
+			if (!chip->dev_ready)
+				udelay(chip->chip_delay);
+			else
+				nand_wait_ready(mtd);
+		}
+
 		readlen -= len;
 		if (!readlen)
 			break;
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 625bc89..2bf2395 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -22,36 +22,36 @@
  * extended chip ID.
  */
 struct nand_flash_dev nand_flash_ids[] = {
-	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 512, 4, 0x2000, 0),
-	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 512, 4, 0x2000, 0),
-	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE5, 512, 4, 0x2000, 0),
-	LEGACY_ID_NAND("NAND 8MiB 3,3V 8-bit", 0xD6, 512, 8, 0x2000, 0),
-	LEGACY_ID_NAND("NAND 8MiB 3,3V 8-bit", 0xE6, 512, 8, 0x2000, 0),
-
-	LEGACY_ID_NAND("NAND 16MiB 1,8V 8-bit",  0x33, 512, 16, 0x4000, 0),
-	LEGACY_ID_NAND("NAND 16MiB 3,3V 8-bit",  0x73, 512, 16, 0x4000, 0),
-	LEGACY_ID_NAND("NAND 16MiB 1,8V 16-bit", 0x43, 512, 16, 0x4000, NAND_BUSWIDTH_16),
-	LEGACY_ID_NAND("NAND 16MiB 3,3V 16-bit", 0x53, 512, 16, 0x4000, NAND_BUSWIDTH_16),
-
-	LEGACY_ID_NAND("NAND 32MiB 1,8V 8-bit",  0x35, 512, 32, 0x4000, 0),
-	LEGACY_ID_NAND("NAND 32MiB 3,3V 8-bit",  0x75, 512, 32, 0x4000, 0),
-	LEGACY_ID_NAND("NAND 32MiB 1,8V 16-bit", 0x45, 512, 32, 0x4000, NAND_BUSWIDTH_16),
-	LEGACY_ID_NAND("NAND 32MiB 3,3V 16-bit", 0x55, 512, 32, 0x4000, NAND_BUSWIDTH_16),
-
-	LEGACY_ID_NAND("NAND 64MiB 1,8V 8-bit",  0x36, 512, 64, 0x4000, 0),
-	LEGACY_ID_NAND("NAND 64MiB 3,3V 8-bit",  0x76, 512, 64, 0x4000, 0),
-	LEGACY_ID_NAND("NAND 64MiB 1,8V 16-bit", 0x46, 512, 64, 0x4000, NAND_BUSWIDTH_16),
-	LEGACY_ID_NAND("NAND 64MiB 3,3V 16-bit", 0x56, 512, 64, 0x4000, NAND_BUSWIDTH_16),
-
-	LEGACY_ID_NAND("NAND 128MiB 1,8V 8-bit",  0x78, 512, 128, 0x4000, 0),
-	LEGACY_ID_NAND("NAND 128MiB 1,8V 8-bit",  0x39, 512, 128, 0x4000, 0),
-	LEGACY_ID_NAND("NAND 128MiB 3,3V 8-bit",  0x79, 512, 128, 0x4000, 0),
-	LEGACY_ID_NAND("NAND 128MiB 1,8V 16-bit", 0x72, 512, 128, 0x4000, NAND_BUSWIDTH_16),
-	LEGACY_ID_NAND("NAND 128MiB 1,8V 16-bit", 0x49, 512, 128, 0x4000, NAND_BUSWIDTH_16),
-	LEGACY_ID_NAND("NAND 128MiB 3,3V 16-bit", 0x74, 512, 128, 0x4000, NAND_BUSWIDTH_16),
-	LEGACY_ID_NAND("NAND 128MiB 3,3V 16-bit", 0x59, 512, 128, 0x4000, NAND_BUSWIDTH_16),
-
-	LEGACY_ID_NAND("NAND 256MiB 3,3V 8-bit", 0x71, 512, 256, 0x4000, 0),
+	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 512, 4, 0x2000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 512, 4, 0x2000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE5, 512, 4, 0x2000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 8MiB 3,3V 8-bit", 0xD6, 512, 8, 0x2000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 8MiB 3,3V 8-bit", 0xE6, 512, 8, 0x2000, NAND_NEED_READRDY),
+
+	LEGACY_ID_NAND("NAND 16MiB 1,8V 8-bit",  0x33, 512, 16, 0x4000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 16MiB 3,3V 8-bit",  0x73, 512, 16, 0x4000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 16MiB 1,8V 16-bit", 0x43, 512, 16, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+	LEGACY_ID_NAND("NAND 16MiB 3,3V 16-bit", 0x53, 512, 16, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+
+	LEGACY_ID_NAND("NAND 32MiB 1,8V 8-bit",  0x35, 512, 32, 0x4000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 32MiB 3,3V 8-bit",  0x75, 512, 32, 0x4000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 32MiB 1,8V 16-bit", 0x45, 512, 32, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+	LEGACY_ID_NAND("NAND 32MiB 3,3V 16-bit", 0x55, 512, 32, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+
+	LEGACY_ID_NAND("NAND 64MiB 1,8V 8-bit",  0x36, 512, 64, 0x4000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 64MiB 3,3V 8-bit",  0x76, 512, 64, 0x4000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 64MiB 1,8V 16-bit", 0x46, 512, 64, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+	LEGACY_ID_NAND("NAND 64MiB 3,3V 16-bit", 0x56, 512, 64, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+
+	LEGACY_ID_NAND("NAND 128MiB 1,8V 8-bit",  0x78, 512, 128, 0x4000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 128MiB 1,8V 8-bit",  0x39, 512, 128, 0x4000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 128MiB 3,3V 8-bit",  0x79, 512, 128, 0x4000, NAND_NEED_READRDY),
+	LEGACY_ID_NAND("NAND 128MiB 1,8V 16-bit", 0x72, 512, 128, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+	LEGACY_ID_NAND("NAND 128MiB 1,8V 16-bit", 0x49, 512, 128, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+	LEGACY_ID_NAND("NAND 128MiB 3,3V 16-bit", 0x74, 512, 128, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+	LEGACY_ID_NAND("NAND 128MiB 3,3V 16-bit", 0x59, 512, 128, 0x4000, NAND_NEED_READRDY | NAND_BUSWIDTH_16),
+
+	LEGACY_ID_NAND("NAND 256MiB 3,3V 8-bit", 0x71, 512, 256, 0x4000, NAND_NEED_READRDY),
 
 	/*
 	 * These are the new chips with large page size. Their page size and
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 0c40beb..f992b38 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -147,6 +147,14 @@ typedef enum {
 #define NAND_BUSWIDTH_16	0x00000002
 /* Chip has cache program function */
 #define NAND_CACHEPRG		0x00000008
+
+/*
+ * Chip requires ready check on read (for auto-incremented sequential read).
+ * True only for small page devices; large page devices do not support
+ * autoincrement.
+ */
+#define NAND_NEED_READRDY	0x00000100
+
 /* Chip does not allow subpage writes */
 #define NAND_NO_SUBPAGE_WRITE	0x00000200
 
-- 
1.7.9.5
