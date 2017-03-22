Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgxI-000638-Mp
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:09:45 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v2 22/53] mtd: nand: denali: simplify multi device fixup code
Date: Wed, 22 Mar 2017 23:07:29 +0900
Message-Id: <1490191680-14481-23-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The available configuration of the IP bus width is x8 or x16, so the
possible value for denali->devnum is 1 or 2.

If the value is 1, there is nothing to do.  Fixup parameters only
when denali->devnum is 2.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Simplify the code given 1 or 2 is possible for denali->devnum

 drivers/mtd/nand/denali.c | 46 ++++++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 4e63d57..abf8997 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1458,7 +1458,7 @@ static void denali_drv_init(struct denali_nand_info *denali)
 	denali->irq_status = 0;
 }
 
-static void denali_multidev_fixup(struct denali_nand_info *denali)
+static int denali_multidev_fixup(struct denali_nand_info *denali)
 {
 	struct nand_chip *chip = &denali->nand;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -1472,20 +1472,32 @@ static void denali_multidev_fixup(struct denali_nand_info *denali)
 	 */
 	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
 
-	mtd->size <<= denali->devnum - 1;
-	mtd->erasesize <<= denali->devnum - 1;
-	mtd->writesize <<= denali->devnum - 1;
-	mtd->oobsize <<= denali->devnum - 1;
-	chip->chipsize <<= denali->devnum - 1;
-	chip->page_shift += denali->devnum - 1;
-	chip->phys_erase_shift += denali->devnum - 1;
-	chip->bbt_erase_shift += denali->devnum - 1;
-	chip->chip_shift += denali->devnum - 1;
-	chip->pagemask <<= denali->devnum - 1;
-	chip->ecc.size *= denali->devnum;
-	chip->ecc.bytes *= denali->devnum;
-	chip->ecc.strength *= denali->devnum;
-	denali->bbtskipbytes *= denali->devnum;
+	if (denali->devnum == 1)
+		return 0;
+
+	if (denali->devnum != 2) {
+		dev_err(denali->dev, "unsupported number of devices %d\n",
+			denali->devnum);
+		return -EINVAL;
+	}
+
+	/* 2 chips in parallel */
+	mtd->size <<= 1;
+	mtd->erasesize <<= 1;
+	mtd->writesize <<= 1;
+	mtd->oobsize <<= 1;
+	chip->chipsize <<= 1;
+	chip->page_shift += 1;
+	chip->phys_erase_shift += 1;
+	chip->bbt_erase_shift += 1;
+	chip->chip_shift += 1;
+	chip->pagemask <<= 1;
+	chip->ecc.size <<= 1;
+	chip->ecc.bytes <<= 1;
+	chip->ecc.strength <<= 1;
+	denali->bbtskipbytes <<= 1;
+
+	return 0;
 }
 
 int denali_init(struct denali_nand_info *denali)
@@ -1623,7 +1635,9 @@ int denali_init(struct denali_nand_info *denali)
 	chip->ecc.write_oob = denali_write_oob;
 	chip->erase = denali_erase;
 
-	denali_multidev_fixup(denali);
+	ret = denali_multidev_fixup(denali);
+	if (ret)
+		goto failed_req_irq;
 
 	ret = nand_scan_tail(mtd);
 	if (ret)
-- 
2.7.4
