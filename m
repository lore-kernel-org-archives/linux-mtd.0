Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OlnKX-0008OK-5J
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 18:25:42 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: Fix regression in BBM detection
Date: Wed, 18 Aug 2010 11:25:04 -0700
Message-ID: <1282155904-10113-1-git-send-email-norris@broadcom.com>
In-Reply-To: <4C6AC037.7070205@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, awg@embtoolkit.org,
	mike@it-loops.com, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit c7b28e25cb9beb943aead770ff14551b55fa8c79 caused a regression
in detection of factory-set bad block markers, especially for certain
small-page NAND. This fix removes some unneeded constraints on using
NAND_SMALL_BADBLOCK_POS, making the detection code more correct.

This regression can be seen, for example, in Hynix HY27US081G1M and
similar.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c7473..a22ed7b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2934,14 +2934,10 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32)) + 32 - 1;
 
 	/* Set the bad block position */
-	if (!(busw & NAND_BUSWIDTH_16) && (*maf_id == NAND_MFR_STMICRO ||
-				(*maf_id == NAND_MFR_SAMSUNG &&
-				 mtd->writesize == 512) ||
-				*maf_id == NAND_MFR_AMD))
-		chip->badblockpos = NAND_SMALL_BADBLOCK_POS;
-	else
+	if (mtd->writesize > 512 || (busw & NAND_BUSWIDTH_16))
 		chip->badblockpos = NAND_LARGE_BADBLOCK_POS;
-
+	else
+		chip->badblockpos = NAND_SMALL_BADBLOCK_POS;
 
 	/* Get chip options, preserve non chip based options */
 	chip->options &= ~NAND_CHIPOPTIONS_MSK;
-- 
1.7.0.4
