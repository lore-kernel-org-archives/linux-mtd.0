Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOjEv-0005le-BL
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 07:10:27 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4 08/12] mtd: nand: add a helper to detect the nand type
Date: Wed, 25 Sep 2013 14:58:17 +0800
Message-ID: <1380092301-21924-9-git-send-email-b32955@freescale.com>
In-Reply-To: <1380092301-21924-1-git-send-email-b32955@freescale.com>
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This helper detects that whether the mtd's type is nand type.

Now, it's clear that the MTD_NANDFLASH stands for SLC nand only.
So use the mtd_type_is_nand() to replace the old check method
to do the nand type (include the SLC and MLC) check.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/inftlcore.c         |    2 +-
 drivers/mtd/nftlcore.c          |    2 +-
 drivers/mtd/ssfdc.c             |    2 +-
 drivers/mtd/tests/nandbiterrs.c |    2 +-
 drivers/mtd/tests/oobtest.c     |    2 +-
 drivers/mtd/tests/pagetest.c    |    2 +-
 drivers/mtd/tests/subpagetest.c |    2 +-
 include/linux/mtd/mtd.h         |    5 +++++
 8 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 3af3514..b66b541 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -50,7 +50,7 @@ static void inftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	struct INFTLrecord *inftl;
 	unsigned long temp;
 
-	if (mtd->type != MTD_NANDFLASH || mtd->size > UINT_MAX)
+	if (!mtd_type_is_nand(mtd) || mtd->size > UINT_MAX)
 		return;
 	/* OK, this is moderately ugly.  But probably safe.  Alternatives? */
 	if (memcmp(mtd->name, "DiskOnChip", 10))
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index c5f4ebf..46f27de 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -50,7 +50,7 @@ static void nftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	struct NFTLrecord *nftl;
 	unsigned long temp;
 
-	if (mtd->type != MTD_NANDFLASH || mtd->size > UINT_MAX)
+	if (!mtd_type_is_nand(mtd) || mtd->size > UINT_MAX)
 		return;
 	/* OK, this is moderately ugly.  But probably safe.  Alternatives? */
 	if (memcmp(mtd->name, "DiskOnChip", 10))
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index ab2a52a..daf82ba 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -290,7 +290,7 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	int cis_sector;
 
 	/* Check for small page NAND flash */
-	if (mtd->type != MTD_NANDFLASH || mtd->oobsize != OOB_SIZE ||
+	if (!mtd_type_is_nand(mtd) || mtd->oobsize != OOB_SIZE ||
 	    mtd->size > UINT_MAX)
 		return;
 
diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
index 3cd3aab..6f97615 100644
--- a/drivers/mtd/tests/nandbiterrs.c
+++ b/drivers/mtd/tests/nandbiterrs.c
@@ -349,7 +349,7 @@ static int __init mtd_nandbiterrs_init(void)
 		goto exit_mtddev;
 	}
 
-	if (mtd->type != MTD_NANDFLASH) {
+	if (!mtd_type_is_nand(mtd)) {
 		pr_info("this test requires NAND flash\n");
 		err = -ENODEV;
 		goto exit_nand;
diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index ff35c46..2e9e2d1 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -289,7 +289,7 @@ static int __init mtd_oobtest_init(void)
 		return err;
 	}
 
-	if (mtd->type != MTD_NANDFLASH) {
+	if (!mtd_type_is_nand(mtd)) {
 		pr_info("this test requires NAND flash\n");
 		goto out;
 	}
diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index 44b96e9..ed2d3f6 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -353,7 +353,7 @@ static int __init mtd_pagetest_init(void)
 		return err;
 	}
 
-	if (mtd->type != MTD_NANDFLASH) {
+	if (!mtd_type_is_nand(mtd)) {
 		pr_info("this test requires NAND flash\n");
 		goto out;
 	}
diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index e2c0adf..a876371 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -299,7 +299,7 @@ static int __init mtd_subpagetest_init(void)
 		return err;
 	}
 
-	if (mtd->type != MTD_NANDFLASH) {
+	if (!mtd_type_is_nand(mtd)) {
 		pr_info("this test requires NAND flash\n");
 		goto out;
 	}
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f9bfe52..88409b8 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -354,6 +354,11 @@ static inline int mtd_has_oob(const struct mtd_info *mtd)
 	return mtd->_read_oob && mtd->_write_oob;
 }
 
+static inline int mtd_type_is_nand(const struct mtd_info *mtd)
+{
+	return mtd->type == MTD_NANDFLASH || mtd->type == MTD_MLCNANDFLASH;
+}
+
 static inline int mtd_can_have_bb(const struct mtd_info *mtd)
 {
 	return !!mtd->_block_isbad;
-- 
1.7.1
