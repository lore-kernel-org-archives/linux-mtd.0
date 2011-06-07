Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QU5Hq-0002Fj-OL
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 23:02:17 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 1/4] mtd: remove printk's for [kv][mz]alloc failures
Date: Tue, 7 Jun 2011 16:01:54 -0700
Message-ID: <1307487717-25402-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
References: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a memory allocation fails, the kernel will print out a backtrace
automatically. These print statements are unnecessary.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/cmdlinepart.c         |    3 ---
 drivers/mtd/inftlcore.c           |    4 +---
 drivers/mtd/nand/nand_bbt.c       |   13 +++----------
 drivers/mtd/nand/rtc_from4.c      |    1 -
 drivers/mtd/nftlcore.c            |    4 +---
 drivers/mtd/onenand/onenand_bbt.c |    4 +---
 drivers/mtd/ssfdc.c               |   10 ++--------
 7 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index e790f38..be0c121 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -188,10 +188,7 @@ static struct mtd_partition * newpart(char *s,
 			     extra_mem_size;
 		parts = kzalloc(alloc_size, GFP_KERNEL);
 		if (!parts)
-		{
-			printk(KERN_ERR ERRP "out of memory\n");
 			return NULL;
-		}
 		extra_mem = (unsigned char *)(parts + *num_parts);
 	}
 	/* enter this partition (offset will be calculated later if it is zero at this point) */
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index d7592e6..c9a31e6 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -67,10 +67,8 @@ static void inftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 	inftl = kzalloc(sizeof(*inftl), GFP_KERNEL);
 
-	if (!inftl) {
-		printk(KERN_WARNING "INFTL: Out of memory for data structures\n");
+	if (!inftl)
 		return;
-	}
 
 	inftl->mbd.mtd = mtd;
 	inftl->mbd.devnum = -1;
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index ba40166..8875d6d 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1121,10 +1121,8 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	 * table.
 	 */
 	this->bbt = kzalloc(len, GFP_KERNEL);
-	if (!this->bbt) {
-		printk(KERN_ERR "nand_scan_bbt: Out of memory\n");
+	if (!this->bbt)
 		return -ENOMEM;
-	}
 
 	/*
 	 * If no primary table decriptor is given, scan the device to build a
@@ -1146,7 +1144,6 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	len += (len >> this->page_shift) * mtd->oobsize;
 	buf = vmalloc(len);
 	if (!buf) {
-		printk(KERN_ERR "nand_bbt: Out of memory\n");
 		kfree(this->bbt);
 		this->bbt = NULL;
 		return -ENOMEM;
@@ -1195,10 +1192,8 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 	len = (1 << this->bbt_erase_shift);
 	len += (len >> this->page_shift) * mtd->oobsize;
 	buf = kmalloc(len, GFP_KERNEL);
-	if (!buf) {
-		printk(KERN_ERR "nand_update_bbt: Out of memory\n");
+	if (!buf)
 		return -ENOMEM;
-	}
 
 	writeops = md != NULL ? 0x03 : 0x01;
 
@@ -1307,10 +1302,8 @@ static int nand_create_default_bbt_descr(struct nand_chip *this)
 		return -EINVAL;
 	}
 	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
-	if (!bd) {
-		printk(KERN_ERR "nand_create_default_bbt_descr: Out of memory\n");
+	if (!bd)
 		return -ENOMEM;
-	}
 	bd->options = this->bbt_options;
 	bd->offs = this->badblockpos;
 	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index c9f9127..a07da2a 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -444,7 +444,6 @@ static int rtc_from4_errstat(struct mtd_info *mtd, struct nand_chip *this,
 		len = mtd->writesize;
 		buf = kmalloc(len, GFP_KERNEL);
 		if (!buf) {
-			printk(KERN_ERR "rtc_from4_errstat: Out of memory!\n");
 			er_stat = 1;
 			goto out;
 		}
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index b155666..f3b3239 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -67,10 +67,8 @@ static void nftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 	nftl = kzalloc(sizeof(struct NFTLrecord), GFP_KERNEL);
 
-	if (!nftl) {
-		printk(KERN_WARNING "NFTL: out of memory for data structures\n");
+	if (!nftl)
 		return;
-	}
 
 	nftl->mbd.mtd = mtd;
 	nftl->mbd.devnum = -1;
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index fc2c16a..09a7d1f 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -188,10 +188,8 @@ int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	len = this->chipsize >> (this->erase_shift + 2);
 	/* Allocate memory (2bit per block) and clear the memory bad block table */
 	bbm->bbt = kzalloc(len, GFP_KERNEL);
-	if (!bbm->bbt) {
-		printk(KERN_ERR "onenand_scan_bbt: Out of memory\n");
+	if (!bbm->bbt)
 		return -ENOMEM;
-	}
 
 	/* Set the bad block position */
 	bbm->badblockpos = ONENAND_BADBLOCK_POS;
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 5cd1897..00d1405 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -304,11 +304,8 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 		return;
 
 	ssfdc = kzalloc(sizeof(struct ssfdcr_record), GFP_KERNEL);
-	if (!ssfdc) {
-		printk(KERN_WARNING
-			"SSFDC_RO: out of memory for data structures\n");
+	if (!ssfdc)
 		return;
-	}
 
 	ssfdc->mbd.mtd = mtd;
 	ssfdc->mbd.devnum = -1;
@@ -342,11 +339,8 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	/* Allocate logical block map */
 	ssfdc->logic_block_map = kmalloc(sizeof(ssfdc->logic_block_map[0]) *
 					 ssfdc->map_len, GFP_KERNEL);
-	if (!ssfdc->logic_block_map) {
-		printk(KERN_WARNING
-			"SSFDC_RO: out of memory for data structures\n");
+	if (!ssfdc->logic_block_map)
 		goto out_err;
-	}
 	memset(ssfdc->logic_block_map, 0xff, sizeof(ssfdc->logic_block_map[0]) *
 		ssfdc->map_len);
 
-- 
1.7.0.4
