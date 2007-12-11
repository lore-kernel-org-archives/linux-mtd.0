Date: Tue, 11 Dec 2007 11:44:45 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: dwmw2@infradead.org
Subject: [PATCH] [MTD][OneNAND] Detect the MLC OneNAND from Technology
	Register (0xF006h)
Message-ID: <20071211024445.GA3144@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Set correct values if the detected chip is MLC

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 18c79ee..bfc8399 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2571,8 +2571,8 @@ static void onenand_resume(struct mtd_info *mtd)
  */
 int onenand_scan(struct mtd_info *mtd, int maxchips)
 {
-	int i;
 	struct onenand_chip *this = mtd->priv;
+	int i, MLC;
 
 	if (!this->read_word)
 		this->read_word = onenand_readw;
@@ -2628,6 +2628,7 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	this->state = FL_READY;
 	init_waitqueue_head(&this->wq);
 	spin_lock_init(&this->chip_lock);
+	MLC = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
 
 	/*
 	 * Allow subpage writes up to oobsize.
@@ -2652,6 +2653,10 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 		break;
 	}
 
+	/* Don't allow the sub-page write in MLC */
+	if (MLC)
+		mtd->subpage_sft = 0;
+
 	this->subpagesize = mtd->writesize >> mtd->subpage_sft;
 
 	/*
@@ -2670,6 +2675,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	/* Fill in remaining MTD driver data */
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
+	if (MLC)
+		mtd->flags &= ~MTD_OOB_WRITEABLE;
 	mtd->erase = onenand_erase;
 	mtd->point = NULL;
 	mtd->unpoint = NULL;
-- 
1.5.0.6
