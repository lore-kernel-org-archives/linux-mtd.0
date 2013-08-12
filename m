Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8kwW-0006zg-5y
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 05:45:27 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 10/10] mtd: add a helper to detect the nand type
Date: Mon, 12 Aug 2013 13:42:53 +0800
Message-ID: <1376286173-12581-11-git-send-email-b32955@freescale.com>
In-Reply-To: <1376286173-12581-1-git-send-email-b32955@freescale.com>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <shijie8@gmail.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Huang Shijie <shijie8@gmail.com>

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
index 5a8c858..1911a5d 100644
--- a/drivers/mtd/tests/nandbiterrs.c
+++ b/drivers/mtd/tests/nandbiterrs.c
@@ -355,7 +355,7 @@ static int __init mtd_nandbiterrs_init(void)
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
index 22cc38c..3af8d25 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -405,7 +405,7 @@ static int __init mtd_pagetest_init(void)
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
index effdd41..2a91a23 100644
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
