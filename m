Received: from mail-am5eur03on0721.outbound.protection.outlook.com
 ([2a01:111:f400:fe08::721]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEh0l-0004NE-Hq
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 20:09:01 +0000
From: Jane Wan <Jane.Wan@nokia.com>
To: Boris.Brezillon@bootlin.com, miquel.raynal@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 marek.vasut@gmail.com, yamada.masahiro@socionext.com,
 prabhakar.kushwaha@nxp.com, shawnguo@kernel.org, jagdish.gediya@nxp.com,
 shreeya.patel23498@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ties.bos@nokia.com, Jane Wan <Jane.Wan@nokia.com>
Subject: [PATCH v2 1/2] mtd: rawnand: fsl_ifc: fix FSL NAND driver to read all
 ONFI parameter pages
Date: Fri,  4 May 2018 13:08:12 -0700
Message-Id: <1525464493-5006-1-git-send-email-Jane.Wan@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Per ONFI specification (Rev. 4.0), if the CRC of the first parameter page
read is not valid, the host should read redundant parameter page copies.
Fix FSL NAND driver to read the two redundant copies which are mandatory
in the specification.

Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 61aae02..98aac1f 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -342,9 +342,16 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 
 	case NAND_CMD_READID:
 	case NAND_CMD_PARAM: {
+		/*
+		 * For READID, read 8 bytes that are currently used.
+		 * For PARAM, read all 3 copies of 256-bytes pages.
+		 */
+		int len = 8;
 		int timing = IFC_FIR_OP_RB;
-		if (command == NAND_CMD_PARAM)
+		if (command == NAND_CMD_PARAM) {
 			timing = IFC_FIR_OP_RBCD;
+			len = 256 * 3;
+		}
 
 		ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
 			  (IFC_FIR_OP_UA  << IFC_NAND_FIR0_OP1_SHIFT) |
@@ -354,12 +361,8 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 			  &ifc->ifc_nand.nand_fcr0);
 		ifc_out32(column, &ifc->ifc_nand.row3);
 
-		/*
-		 * although currently it's 8 bytes for READID, we always read
-		 * the maximum 256 bytes(for PARAM)
-		 */
-		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
-		ifc_nand_ctrl->read_bytes = 256;
+		ifc_out32(len, &ifc->ifc_nand.nand_fbcr);
+		ifc_nand_ctrl->read_bytes = len;
 
 		set_addr(mtd, 0, 0, 0);
 		fsl_ifc_run_command(mtd);
-- 
1.7.9.5
