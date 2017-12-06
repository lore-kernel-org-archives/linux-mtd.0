Received: from mail-bl2nam02on0066.outbound.protection.outlook.com
 ([104.47.38.66] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMUt2-0001Km-0d
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:17:01 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [RFC 10/10] mtd: spi-nor: Implement anyreg functions for fsl-quadspi
Date: Wed, 6 Dec 2017 13:45:41 +0530
Message-ID: <1512548141-3319-11-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

Read Any Register and Write Any Register commands provides a way to
read or write all device registers - non-volatile and volatile.
These commands are followed by a 3- or 4-byte address, followed by
a number of latency (dummy) cycles set by volatile configuration
registers. Then the selected register contents are returned or written.

This patch update quadspi controller driver to implement above behavior.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 5477d78..5164eab 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -854,6 +854,22 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	return ret;
 }
 
+static int fsl_qspi_read_anyreg(struct spi_nor *nor, u8 opcode, u32 offset,
+				u8 *buf, int len)
+{
+	/* TODO: It will be updated during controller changes*/
+
+	return 0;
+}
+
+static int fsl_qspi_write_anyreg(struct spi_nor *nor, u8 opcode, u32 offset,
+				 u8 *buf, int len)
+{
+	/* TODO: It will be updated during controller changes*/
+
+	return 0;
+}
+
 static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
 			      size_t len, const u_char *buf)
 {
@@ -1075,6 +1091,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		/* fill the hooks */
 		nor->read_reg = fsl_qspi_read_reg;
 		nor->write_reg = fsl_qspi_write_reg;
+		nor->read_anyreg = fsl_qspi_read_anyreg;
+		nor->write_anyreg = fsl_qspi_write_anyreg;
 		nor->read = fsl_qspi_read;
 		nor->write = fsl_qspi_write;
 		nor->erase = fsl_qspi_erase;
-- 
2.7.4
