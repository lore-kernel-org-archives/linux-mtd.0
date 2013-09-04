Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmS-0004mc-MA
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:20 +0000
Received: by mail-ie0-f178.google.com with SMTP id f4so1523897iea.9
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:55 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/12] mtd: onenand: remove unused variable assignments
Date: Wed,  4 Sep 2013 11:25:25 -0700
Message-Id: <1378319126-24473-12-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These variable assignments are never used (the variables are either
never used or are overwritten before use). This resolves some compiler
warnings like the following:

    drivers/mtd/onenand/onenand_base.c: In function 'flexonenand_get_boundary':
    drivers/mtd/onenand/onenand_base.c:3532:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    drivers/mtd/onenand/onenand_base.c: In function 'onenand_probe':
    drivers/mtd/onenand/onenand_base.c:3838:6: warning: variable 'maf_id' set but not used [-Wunused-but-set-variable]

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 7b7c1d2..1de33b5 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3525,7 +3525,7 @@ static int flexonenand_get_boundary(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
 	unsigned die, bdry;
-	int ret, syscfg, locked;
+	int syscfg, locked;
 
 	/* Disable ECC */
 	syscfg = this->read_word(this->base + ONENAND_REG_SYS_CFG1);
@@ -3536,7 +3536,7 @@ static int flexonenand_get_boundary(struct mtd_info *mtd)
 		this->wait(mtd, FL_SYNCING);
 
 		this->command(mtd, FLEXONENAND_CMD_READ_PI, die, 0);
-		ret = this->wait(mtd, FL_READING);
+		this->wait(mtd, FL_READING);
 
 		bdry = this->read_word(this->base + ONENAND_DATARAM);
 		if ((bdry >> FLEXONENAND_PI_UNLOCK_SHIFT) == 3)
@@ -3546,7 +3546,7 @@ static int flexonenand_get_boundary(struct mtd_info *mtd)
 		this->boundary[die] = bdry & FLEXONENAND_PI_MASK;
 
 		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
-		ret = this->wait(mtd, FL_RESETING);
+		this->wait(mtd, FL_RESETING);
 
 		printk(KERN_INFO "Die %d boundary: %d%s\n", die,
 		       this->boundary[die], locked ? "(Locked)" : "(Unlocked)");
@@ -3730,7 +3730,7 @@ static int flexonenand_set_boundary(struct mtd_info *mtd, int die,
 
 	/* Check is boundary is locked */
 	this->command(mtd, FLEXONENAND_CMD_READ_PI, die, 0);
-	ret = this->wait(mtd, FL_READING);
+	this->wait(mtd, FL_READING);
 
 	thisboundary = this->read_word(this->base + ONENAND_DATARAM);
 	if ((thisboundary >> FLEXONENAND_PI_UNLOCK_SHIFT) != 3) {
@@ -3831,7 +3831,7 @@ static int onenand_chip_probe(struct mtd_info *mtd)
 static int onenand_probe(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
-	int maf_id, dev_id, ver_id;
+	int dev_id, ver_id;
 	int density;
 	int ret;
 
@@ -3839,8 +3839,7 @@ static int onenand_probe(struct mtd_info *mtd)
 	if (ret)
 		return ret;
 
-	/* Read manufacturer and device IDs from Register */
-	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
+	/* Device and version IDs from Register */
 	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
 	ver_id = this->read_word(this->base + ONENAND_REG_VERSION_ID);
 	this->technology = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
-- 
1.8.4
