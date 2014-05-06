Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhWjY-0003jm-8I
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 04:12:01 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/1] mtd: eLBC NAND: fixes subpage write support
Date: Tue, 6 May 2014 09:41:32 +0530
Message-ID: <1399349492-3006-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Scott Wood <scottwood@freescale.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Helmut Schaa <helmut.schaa@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As subpage write is enabled by default for all drivers, nand_write_subpage_hwecc
causes a crash if the driver did not register ecc->hwctl or ecc->calculate.
This behavior was introduced in
   commit 837a6ba4f3b6d23026674e6af6b6849a4634fff9
   "mtd: nand: subpage write support for hardware based ECC schemes".

This fixes a crash by emulating subpage write support by padding sub-page data
with 0xff on either sides to make it full page compatible.

CC: <stable@vger.kernel.org> # 3.10.x+

Reported-by: Helmut Schaa <helmut.schaa@googlemail.com>
Tested-by: Helmut Schaa <helmut.schaa@googlemail.com>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index ec549cd..545a5c0 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -723,6 +723,19 @@ static int fsl_elbc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
+/* ECC will be calculated automatically, and errors will be detected in
+ * waitfunc.
+ */
+static int fsl_elbc_write_subpage(struct mtd_info *mtd, struct nand_chip *chip,
+				uint32_t offset, uint32_t data_len,
+				const uint8_t *buf, int oob_required)
+{
+	fsl_elbc_write_buf(mtd, buf, mtd->writesize);
+	fsl_elbc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+	return 0;
+}
+
 static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 {
 	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
@@ -761,6 +774,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 
 	chip->ecc.read_page = fsl_elbc_read_page;
 	chip->ecc.write_page = fsl_elbc_write_page;
+	chip->ecc.write_subpage = fsl_elbc_write_subpage;
 
 	/* If CS Base Register selects full hardware ECC then use it */
 	if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
-- 
1.8.5.1.163.gd7aced9
