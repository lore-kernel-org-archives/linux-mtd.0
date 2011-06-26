Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QasAx-0006aK-88
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 16:27:13 +0000
Received: by wyf23 with SMTP id 23so3462583wyf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 09:27:10 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] nand_flash_detect_onfi propagate busw info
Date: Sun, 26 Jun 2011 18:26:55 +0200
Message-Id: <1309105616-3609-5-git-send-email-matthieu.castet@parrot.com>
In-Reply-To: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

there is a bug in nand_flash_detect_onfi, busw need to be passed
by pointer to return it.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5f0a0de..e7c8bdd 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2850,7 +2850,7 @@ static u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise
  */
 static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
-					int busw)
+					int *busw)
 {
 	struct nand_onfi_params *p = &chip->onfi_params;
 	int i;
@@ -2905,9 +2905,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	mtd->erasesize = le32_to_cpu(p->pages_per_block) * mtd->writesize;
 	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
 	chip->chipsize = (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->erasesize;
-	busw = 0;
+	*busw = 0;
 	if (le16_to_cpu(p->features) & 1)
-		busw = NAND_BUSWIDTH_16;
+		*busw = NAND_BUSWIDTH_16;
 
 	chip->options &= ~NAND_CHIPOPTIONS_MSK;
 	chip->options |= (NAND_NO_READRDY |
@@ -2973,7 +2973,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
 		/* Check is chip is ONFI compliant */
-		ret = nand_flash_detect_onfi(mtd, chip, busw);
+		ret = nand_flash_detect_onfi(mtd, chip, &busw);
 		if (ret)
 			goto ident_done;
 	}
-- 
1.7.5.4
