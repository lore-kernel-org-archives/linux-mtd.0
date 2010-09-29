Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P10hg-0000j8-Np
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 17:44:29 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] mtd/nand: introduce NAND_CREATE_EMPTY_BBT
Date: Wed, 29 Sep 2010 19:43:53 +0200
Message-Id: <1285782234-32509-5-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
Cc: tglx@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

it will create an empty BBT table without considering vendor's BBT
information. Vendor's information may be unavailable if the NAND
controller has a different DATA & OOB layout or if this information is
allready purged.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/nand_bbt.c |    3 ++-
 include/linux/mtd/bbm.h     |    2 +-
 include/linux/mtd/nand.h    |    2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 11e4204..fd3295e 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -994,7 +994,8 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 			continue;
 
 		/* Create the table in memory by scanning the chip(s) */
-		create_bbt(mtd, buf, bd, chipsel);
+		if (!(this->options & NAND_CREATE_EMPTY_BBT))
+			create_bbt(mtd, buf, bd, chipsel);
 
 		td->version[i] = 1;
 		if (md)
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index ba15b52..57cc0e6 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -84,7 +84,7 @@ struct nand_bbt_descr {
 #define NAND_BBT_PERCHIP	0x00000080
 /* bbt has a version counter at offset veroffs */
 #define NAND_BBT_VERSION	0x00000100
-/* Create a bbt if none axists */
+/* Create a bbt if none exists */
 #define NAND_BBT_CREATE		0x00000200
 /* Search good / bad pattern through all pages of a block */
 #define NAND_BBT_SCANALLPAGES	0x00000400
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 68caf20..c4b1055 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -218,6 +218,8 @@ typedef enum {
 /* If passed additionally to NAND_USE_FLASH_BBT then BBT code will not touch
  * the OOB area */
 #define NAND_USE_FLASH_BBT_NO_OOB	0x00100000
+/* Create an empty BBT with no vendor information if the BBT is available */
+#define NAND_CREATE_EMPTY_BBT		0x00200000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
1.7.2.3
