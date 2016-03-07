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
 Harvey Hunt <harvey.hunt@imgtec.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 11/52] mtd: nand: lpc32xx: use mtd_ooblayout_xxx() helpers
 where appropriate
Date: Mon,  7 Mar 2016 10:47:01 +0100
Message-Id: <1457344062-11633-12-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1457344062-11633-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1457344062-11633-1-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/lpc32xx_slc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 3b8f373..10cf8e62 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -604,7 +604,8 @@ static int lpc32xx_nand_read_page_syndrome(struct mtd_info *mtd,
 					   int oob_required, int page)
 {
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
-	int stat, i, status;
+	struct mtd_oob_region oobregion = { };
+	int stat, i, status, error;
 	uint8_t *oobecc, tmpecc[LPC32XX_ECC_SAVE_SIZE];
 
 	/* Issue read command */
@@ -620,7 +621,11 @@ static int lpc32xx_nand_read_page_syndrome(struct mtd_info *mtd,
 	lpc32xx_slc_ecc_copy(tmpecc, (uint32_t *) host->ecc_buf, chip->ecc.steps);
 
 	/* Pointer to ECC data retrieved from NAND spare area */
-	oobecc = chip->oob_poi + chip->ecc.layout->eccpos[0];
+	error = mtd_ooblayout_ecc(mtd, 0, &oobregion);
+	if (error)
+		return error;
+
+	oobecc = chip->oob_poi + oobregion.offset;
 
 	for (i = 0; i < chip->ecc.steps; i++) {
 		stat = chip->ecc.correct(mtd, buf, oobecc,
@@ -666,7 +671,8 @@ static int lpc32xx_nand_write_page_syndrome(struct mtd_info *mtd,
 					    int oob_required, int page)
 {
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
-	uint8_t *pb = chip->oob_poi + chip->ecc.layout->eccpos[0];
+	struct mtd_oob_region oobregion = { };
+	uint8_t *pb;
 	int error;
 
 	/* Write data, calculate ECC on outbound data */
@@ -678,6 +684,11 @@ static int lpc32xx_nand_write_page_syndrome(struct mtd_info *mtd,
 	 * The calculated ECC needs some manual work done to it before
 	 * committing it to NAND. Process the calculated ECC and place
 	 * the resultant values directly into the OOB buffer. */
+	error = mtd_ooblayout_ecc(mtd, 0, &oobregion);
+	if (error)
+		return error;
+
+	pb = chip->oob_poi + oobregion.offset;
 	lpc32xx_slc_ecc_copy(pb, (uint32_t *)host->ecc_buf, chip->ecc.steps);
 
 	/* Write ECC data to device */
-- 
2.1.4
