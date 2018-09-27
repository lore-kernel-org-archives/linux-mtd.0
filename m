Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5YAD-000430-ND
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 15:25:15 +0000
From: Colin King <colin.king@canonical.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][mtd-next] mtd: rawnand: fix spelling mistake "card_registred"
 -> "card_registered"
Date: Thu, 27 Sep 2018 16:24:31 +0100
Message-Id: <20180927152431.6031-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake struct field name, rename it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/r852.c | 14 +++++++-------
 drivers/mtd/nand/raw/r852.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index b08aa0a5a074..39be65b35ac2 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -637,7 +637,7 @@ static int r852_register_nand_device(struct r852_device *dev)
 {
 	struct mtd_info *mtd = nand_to_mtd(dev->chip);
 
-	WARN_ON(dev->card_registred);
+	WARN_ON(dev->card_registered);
 
 	mtd->dev.parent = &dev->pci_dev->dev;
 
@@ -654,7 +654,7 @@ static int r852_register_nand_device(struct r852_device *dev)
 		goto error3;
 	}
 
-	dev->card_registred = 1;
+	dev->card_registered = 1;
 	return 0;
 error3:
 	nand_release(dev->chip);
@@ -672,13 +672,13 @@ static void r852_unregister_nand_device(struct r852_device *dev)
 {
 	struct mtd_info *mtd = nand_to_mtd(dev->chip);
 
-	if (!dev->card_registred)
+	if (!dev->card_registered)
 		return;
 
 	device_remove_file(&mtd->dev, &dev_attr_media_type);
 	nand_release(dev->chip);
 	r852_engine_disable(dev);
-	dev->card_registred = 0;
+	dev->card_registered = 0;
 }
 
 /* Card state updater */
@@ -692,7 +692,7 @@ static void r852_card_detect_work(struct work_struct *work)
 	dev->card_unstable = 0;
 
 	/* False alarm */
-	if (dev->card_detected == dev->card_registred)
+	if (dev->card_detected == dev->card_registered)
 		goto exit;
 
 	/* Read media properties */
@@ -1033,7 +1033,7 @@ static int r852_resume(struct device *device)
 
 
 	/* If card status changed, just do the work */
-	if (dev->card_detected != dev->card_registred) {
+	if (dev->card_detected != dev->card_registered) {
 		dbg("card was %s during low power state",
 			dev->card_detected ? "added" : "removed");
 
@@ -1043,7 +1043,7 @@ static int r852_resume(struct device *device)
 	}
 
 	/* Otherwise, initialize the card */
-	if (dev->card_registred) {
+	if (dev->card_registered) {
 		r852_engine_enable(dev);
 		dev->chip->select_chip(dev->chip, 0);
 		nand_reset_op(dev->chip);
diff --git a/drivers/mtd/nand/raw/r852.h b/drivers/mtd/nand/raw/r852.h
index 1eed2fc2fa42..bc67f5bf67e8 100644
--- a/drivers/mtd/nand/raw/r852.h
+++ b/drivers/mtd/nand/raw/r852.h
@@ -129,7 +129,7 @@ struct r852_device {
 	/* card status area */
 	struct delayed_work card_detect_work;
 	struct workqueue_struct *card_workqueue;
-	int card_registred;		/* card registered with mtd */
+	int card_registered;		/* card registered with mtd */
 	int card_detected;		/* card detected in slot */
 	int card_unstable;		/* whenever the card is inserted,
 					   is not known yet */
-- 
2.17.1
