Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fccUX-0000Jo-Rd
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 20:10:41 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 17/24] mtd: rawnand: fsl_ifc: Add an __iomem specifier on
 eccstat_regs
Date: Mon,  9 Jul 2018 22:09:38 +0200
Message-Id: <20180709200945.30116-18-boris.brezillon@bootlin.com>
In-Reply-To: <20180709200945.30116-1-boris.brezillon@bootlin.com>
References: <20180709200945.30116-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The local eccstat_regs variable in fsl_ifc_run_command() is missing an
__iomem specifier, and sparce complains about that.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 382b67e97174..75d3c951f61a 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -225,7 +225,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
 		int bufnum = nctrl->page & priv->bufnum_mask;
 		int sector_start = bufnum * chip->ecc.steps;
 		int sector_end = sector_start + chip->ecc.steps - 1;
-		__be32 *eccstat_regs;
+		__be32 __iomem *eccstat_regs;
 
 		eccstat_regs = ifc->ifc_nand.nand_eccstat;
 		eccstat = ifc_in32(&eccstat_regs[sector_start / 4]);
-- 
2.14.1
