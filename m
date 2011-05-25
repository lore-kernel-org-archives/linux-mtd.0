Received: from mms3.broadcom.com ([216.31.210.19])
	by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QPMGj-00059Q-Rq
	for linux-mtd@lists.infradead.org; Wed, 25 May 2011 22:09:35 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: generalized error messages with __func__
Date: Wed, 25 May 2011 14:59:00 -0700
Message-ID: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These simple printk error messages can be a little simpler to maintain
when they use the __func__ identifier.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c  |    8 ++++----
 drivers/mtd/nand/rtc_from4.c |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index ccbeaa1..7936a6c 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1164,7 +1164,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	/* Allocate memory (2bit per block) and clear the memory bad block table */
 	this->bbt = kzalloc(len, GFP_KERNEL);
 	if (!this->bbt) {
-		printk(KERN_ERR "nand_scan_bbt: Out of memory\n");
+		printk(KERN_ERR "%s: Out of memory\n", __func__);
 		return -ENOMEM;
 	}
 
@@ -1187,7 +1187,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	len += (len >> this->page_shift) * mtd->oobsize;
 	buf = vmalloc(len);
 	if (!buf) {
-		printk(KERN_ERR "nand_bbt: Out of memory\n");
+		printk(KERN_ERR "%s: Out of memory\n", __func__);
 		kfree(this->bbt);
 		this->bbt = NULL;
 		return -ENOMEM;
@@ -1237,7 +1237,7 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 	len += (len >> this->page_shift) * mtd->oobsize;
 	buf = kmalloc(len, GFP_KERNEL);
 	if (!buf) {
-		printk(KERN_ERR "nand_update_bbt: Out of memory\n");
+		printk(KERN_ERR "%s: Out of memory\n", __func__);
 		return -ENOMEM;
 	}
 
@@ -1351,7 +1351,7 @@ static int nand_create_default_bbt_descr(struct nand_chip *this)
 	}
 	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
 	if (!bd) {
-		printk(KERN_ERR "nand_create_default_bbt_descr: Out of memory\n");
+		printk(KERN_ERR "%s: Out of memory\n", __func__);
 		return -ENOMEM;
 	}
 	bd->options = this->options & BBT_SCAN_OPTIONS;
diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index c9f9127..7e02c94 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -444,7 +444,7 @@ static int rtc_from4_errstat(struct mtd_info *mtd, struct nand_chip *this,
 		len = mtd->writesize;
 		buf = kmalloc(len, GFP_KERNEL);
 		if (!buf) {
-			printk(KERN_ERR "rtc_from4_errstat: Out of memory!\n");
+			printk(KERN_ERR "%s: Out of memory!\n", __func__);
 			er_stat = 1;
 			goto out;
 		}
-- 
1.7.0.4
