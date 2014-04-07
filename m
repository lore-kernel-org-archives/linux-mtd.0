Date: Mon, 7 Apr 2014 11:58:12 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Message-ID: <1775366863.831876.1396889892458.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1142754398.830922.1396889085115.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 1/2] mtd: fsl_ifc_nand: Use void type for IFC buffer
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The IFC buffer is accessed via 8-bit and 16-bit accessors. Changing
the 'addr' member of 'struct fsl_ifc_nand_ctrl' from 'u8 __iomem *' to
'void __iomem *' eliminates the need for explicit casts when the
16-bit accessors are used.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 50d9161..79941c4 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -57,7 +57,7 @@ struct fsl_ifc_nand_ctrl {
 	struct nand_hw_control controller;
 	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
-	u8 __iomem *addr;	/* Address of assigned IFC buffer	*/
+	void __iomem *addr;	/* Address of assigned IFC buffer	*/
 	unsigned int page;	/* Last page written to / read from	*/
 	unsigned int read_bytes;/* Number of bytes read during command	*/
 	unsigned int column;	/* Saved column from SEQIN		*/
@@ -637,7 +637,7 @@ static void fsl_ifc_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
 		len = bufsize - ifc_nand_ctrl->index;
 	}
 
-	memcpy_toio(&ifc_nand_ctrl->addr[ifc_nand_ctrl->index], buf, len);
+	memcpy_toio(ifc_nand_ctrl->addr + ifc_nand_ctrl->index, buf, len);
 	ifc_nand_ctrl->index += len;
 }
 
@@ -649,13 +649,16 @@ static uint8_t fsl_ifc_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
 	struct fsl_ifc_mtd *priv = chip->priv;
+	unsigned int offset;
 
 	/*
 	 * If there are still bytes in the IFC buffer, then use the
 	 * next byte.
 	 */
-	if (ifc_nand_ctrl->index < ifc_nand_ctrl->read_bytes)
-		return in_8(&ifc_nand_ctrl->addr[ifc_nand_ctrl->index++]);
+	if (ifc_nand_ctrl->index < ifc_nand_ctrl->read_bytes) {
+		offset = ifc_nand_ctrl->index++;
+		return in_8(ifc_nand_ctrl->addr + offset);
+	}
 
 	dev_err(priv->dev, "%s: beyond end of buffer\n", __func__);
 	return ERR_BYTE;
@@ -676,8 +679,7 @@ static uint8_t fsl_ifc_read_byte16(struct mtd_info *mtd)
 	 * next byte.
 	 */
 	if (ifc_nand_ctrl->index < ifc_nand_ctrl->read_bytes) {
-		data = in_be16((uint16_t __iomem *)&ifc_nand_ctrl->
-			       addr[ifc_nand_ctrl->index]);
+		data = in_be16(ifc_nand_ctrl->addr + ifc_nand_ctrl->index);
 		ifc_nand_ctrl->index += 2;
 		return (uint8_t) data;
 	}
@@ -702,7 +704,7 @@ static void fsl_ifc_read_buf(struct mtd_info *mtd, u8 *buf, int len)
 
 	avail = min((unsigned int)len,
 			ifc_nand_ctrl->read_bytes - ifc_nand_ctrl->index);
-	memcpy_fromio(buf, &ifc_nand_ctrl->addr[ifc_nand_ctrl->index], avail);
+	memcpy_fromio(buf, ifc_nand_ctrl->addr + ifc_nand_ctrl->index, avail);
 	ifc_nand_ctrl->index += avail;
 
 	if (len > avail)
-- 
1.7.9.5
