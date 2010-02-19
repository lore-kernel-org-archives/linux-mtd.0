From: adrian.hunter@nokia.com (Adrian Hunter)
Date: Fri, 19 Feb 2010 15:39:52 +0100
Subject: [PATCH 2/7] mtd: OneNAND: add enable / disable methods to onenand_chip
Message-ID: <mailman.51.1292242389.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Add enable / disable methods called from get_device() / release_device().
These can be used, for example, to allow the driver to prevent the voltage
regulator from being put to sleep while OneNAND is in use.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    4 ++++
 include/linux/mtd/onenand.h        |    2 ++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index c38bf9c..bde274f 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -948,6 +948,8 @@ static int onenand_get_device(struct mtd_info *mtd, int new_state)
 		if (this->state == FL_READY) {
 			this->state = new_state;
 			spin_unlock(&this->chip_lock);
+			if (this->enable)
+				this->enable(mtd);
 			break;
 		}
 		if (new_state == FL_PM_SUSPENDED) {
@@ -974,6 +976,8 @@ static void onenand_release_device(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
 
+	if (this->state != FL_PM_SUSPENDED && this->disable)
+		this->disable(mtd);
 	/* Release the chip */
 	spin_lock(&this->chip_lock);
 	this->state = FL_READY;
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 6da3fe3..ae418e4 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -118,6 +118,8 @@ struct onenand_chip {
 	int (*chip_probe)(struct mtd_info *mtd);
 	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
 	int (*scan_bbt)(struct mtd_info *mtd);
+	int (*enable)(struct mtd_info *mtd);
+	int (*disable)(struct mtd_info *mtd);
 
 	struct completion	complete;
 	int			irq;
-- 
1.7.0.4
