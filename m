Received: from mail-oa0-x22e.google.com ([2607:f8b0:4003:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vbi1y-0005GV-LD
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 02:30:43 +0000
Received: by mail-oa0-f46.google.com with SMTP id g12so2410002oah.19
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2013 19:30:19 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand_bbt: kill NAND_BBT_SCANALLPAGES
Date: Wed, 30 Oct 2013 22:29:35 -0400
Message-Id: <1383186575-31328-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the last user of NAND_BBT_SCANALLPAGES has been removed, let's
kill this peculiar BBT feature flag.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Documentation/DocBook/mtdnand.tmpl |  2 --
 drivers/mtd/nand/nand_bbt.c        | 37 +++----------------------------------
 include/linux/mtd/bbm.h            |  2 --
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/Documentation/DocBook/mtdnand.tmpl b/Documentation/DocBook/mtdnand.tmpl
index a248f42a121e..cd11926e07c7 100644
--- a/Documentation/DocBook/mtdnand.tmpl
+++ b/Documentation/DocBook/mtdnand.tmpl
@@ -1222,8 +1222,6 @@ in this page</entry>
 #define NAND_BBT_VERSION	0x00000100
 /* Create a bbt if none axists */
 #define NAND_BBT_CREATE		0x00000200
-/* Search good / bad pattern through all pages of a block */
-#define NAND_BBT_SCANALLPAGES	0x00000400
 /* Write bbt if neccecary */
 #define NAND_BBT_WRITE		0x00001000
 /* Read and write back block contents when writing bbt */
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index c75b6a7c6ea4..c0615d1526f9 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -412,25 +412,6 @@ static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 	}
 }
 
-/* Scan a given block full */
-static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
-			   loff_t offs, uint8_t *buf, size_t readlen,
-			   int scanlen, int numpages)
-{
-	int ret, j;
-
-	ret = scan_read_oob(mtd, buf, offs, readlen);
-	/* Ignore ECC errors when checking for BBM */
-	if (ret && !mtd_is_bitflip_or_eccerr(ret))
-		return ret;
-
-	for (j = 0; j < numpages; j++, buf += scanlen) {
-		if (check_pattern(buf, scanlen, mtd->writesize, bd))
-			return 1;
-	}
-	return 0;
-}
-
 /* Scan a given block partially */
 static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 			   loff_t offs, uint8_t *buf, int numpages)
@@ -477,24 +458,17 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	struct nand_bbt_descr *bd, int chip)
 {
 	struct nand_chip *this = mtd->priv;
-	int i, numblocks, numpages, scanlen;
+	int i, numblocks, numpages;
 	int startblock;
 	loff_t from;
-	size_t readlen;
 
 	pr_info("Scanning device for bad blocks\n");
 
-	if (bd->options & NAND_BBT_SCANALLPAGES)
-		numpages = 1 << (this->bbt_erase_shift - this->page_shift);
-	else if (bd->options & NAND_BBT_SCAN2NDPAGE)
+	if (bd->options & NAND_BBT_SCAN2NDPAGE)
 		numpages = 2;
 	else
 		numpages = 1;
 
-	/* We need only read few bytes from the OOB area */
-	scanlen = 0;
-	readlen = bd->len;
-
 	if (chip == -1) {
 		numblocks = mtd->size >> this->bbt_erase_shift;
 		startblock = 0;
@@ -519,12 +493,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		BUG_ON(bd->options & NAND_BBT_NO_OOB);
 
-		if (bd->options & NAND_BBT_SCANALLPAGES)
-			ret = scan_block_full(mtd, bd, from, buf, readlen,
-					      scanlen, numpages);
-		else
-			ret = scan_block_fast(mtd, bd, from, buf, numpages);
-
+		ret = scan_block_fast(mtd, bd, from, buf, numpages);
 		if (ret < 0)
 			return ret;
 
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 95fc482cef36..36bb6a503f19 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -91,8 +91,6 @@ struct nand_bbt_descr {
  * with NAND_BBT_CREATE.
  */
 #define NAND_BBT_CREATE_EMPTY	0x00000400
-/* Search good / bad pattern through all pages of a block */
-#define NAND_BBT_SCANALLPAGES	0x00000800
 /* Write bbt if neccecary */
 #define NAND_BBT_WRITE		0x00002000
 /* Read and write back block contents when writing bbt */
-- 
1.8.1.2
