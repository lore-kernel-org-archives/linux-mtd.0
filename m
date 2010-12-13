Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PS7P9-000344-0a
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2010 12:21:26 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 13 Dec 2010 14:20:57 +0200
Message-Id: <20101213122057.20685.68480.sendpatchset@ahunter-work.research.nokia.com>
In-Reply-To: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
Subject: [PATCH 2/7] mtd: OneNAND: add enable / disable methods to onenand_chip
Cc: Tony Lindgren <tony@atomide.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 16b760999cb79f9cf71728c9253f1399717be63a Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Fri, 19 Feb 2010 15:39:52 +0100
Subject: [PATCH 2/7] mtd: OneNAND: add enable / disable methods to onenand_chip

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
