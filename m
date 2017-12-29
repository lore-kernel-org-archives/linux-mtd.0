Received: from mail-bn3nam01on0620.outbound.protection.outlook.com
 ([2a01:111:f400:fe41::620]
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUtGD-00008s-39
 for linux-mtd@lists.infradead.org; Fri, 29 Dec 2017 11:55:43 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <marek.vasut@gmail.com>, <cyrille.pitchen@wedev4u.fr>,
 <poonam.aggrwal@nxp.com>, <suresh.gupta@nxp.com>, <ashish.kumar@nxp.com>,
 <yogeshnarayan.gaur@nxp.com>, <rajat.srivastava@nxp.com>,
 <fabio.estevam@nxp.com>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [RFC 2/3] mtd: spi-nor: Implement anyreg functions for fsl-quadspi
Date: Fri, 29 Dec 2017 17:23:51 +0530
Message-ID: <1514548432-13302-3-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1514548432-13302-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1514548432-13302-1-git-send-email-prabhakar.kushwaha@nxp.com>
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
index a77f114..98bef6a 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -922,6 +922,22 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
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
@@ -1154,6 +1170,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
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
