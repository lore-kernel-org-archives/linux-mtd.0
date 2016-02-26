From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 punnaiah choudary kalluri <punnaia@xilinx.com>,
 Priit Laes <plaes@plaes.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-api@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 09/52] mtd: nand: fsl_ifc: use mtd_ooblayout_xxx() helpers
 where appropriate
Date: Fri, 26 Feb 2016 01:57:17 +0100
Message-Id: <1456448280-27788-10-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1456448280-27788-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1456448280-27788-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd_ooblayout_xxx() helper functions have been added to avoid direct
accesses to the ecclayout field, and thus ease for future reworks.
Use these helpers in all places where the oobfree[] and eccpos[] arrays
where directly accessed.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 43f5a3a..2e970ac 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -257,18 +257,22 @@ static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
 	u8 __iomem *addr = priv->vbase + bufnum * (mtd->writesize * 2);
 	u32 __iomem *mainarea = (u32 __iomem *)addr;
 	u8 __iomem *oob = addr + mtd->writesize;
-	int i;
+	struct mtd_oob_region oobregion = { };
+	int i, section = 0;
 
 	for (i = 0; i < mtd->writesize / 4; i++) {
 		if (__raw_readl(&mainarea[i]) != 0xffffffff)
 			return 0;
 	}
 
-	for (i = 0; i < chip->ecc.layout->eccbytes; i++) {
-		int pos = chip->ecc.layout->eccpos[i];
+	mtd_ooblayout_ecc(mtd, section++, &oobregion);
+	while (oobregion.length) {
+		for (i = 0; i < oobregion.length; i++) {
+			if (__raw_readb(&oob[oobregion.offset + i]) != 0xff)
+				return 0;
+		}
 
-		if (__raw_readb(&oob[pos]) != 0xff)
-			return 0;
+		mtd_ooblayout_ecc(mtd, section++, &oobregion);
 	}
 
 	return 1;
-- 
2.1.4
