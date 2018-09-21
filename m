Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3Hs5-0007i7-Lw
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2018 09:37:11 +0000
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Han Xu <han.xu@nxp.com>,
	Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 stable@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: fsl-quadspi: Don't let -EINVAL on the bus
Date: Fri, 21 Sep 2018 11:32:53 +0200
Message-Id: <20180921093252.9115-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fsl_qspi_get_seqid() may return -EINVAL, but fsl_qspi_init_ahb_read()
doesn't check for error codes with the result that -EINVAL could find
itself signalled over the bus.

In conjunction with the LS1046A SoC's A-009283 errata
("Illegal accesses to SPI flash memory can result in a system hang")
this illegal access to SPI flash memory results in a system hang
if userspace attempts reading later on.

Avoid this by always checking fsl_qspi_get_seqid()'s return value
and bail out otherwise.

Cc: stable@vger.kernel.org
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 7d9620c7ff6c..1bb42e40c38b 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -543,6 +543,9 @@ fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsigned int addr, int len)
 
 	/* trigger the LUT now */
 	seqid = fsl_qspi_get_seqid(q, cmd);
+	if (seqid < 0)
+		return seqid;
+
 	qspi_writel(q, (seqid << QUADSPI_IPCR_SEQID_SHIFT) | len,
 			base + QUADSPI_IPCR);
 
@@ -671,7 +674,7 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi *q)
  * causes the controller to clear the buffer, and use the sequence pointed
  * by the QUADSPI_BFGENCR[SEQID] to initiate a read from the flash.
  */
-static void fsl_qspi_init_ahb_read(struct fsl_qspi *q)
+static int fsl_qspi_init_ahb_read(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
 	int seqid;
@@ -696,8 +699,12 @@ static void fsl_qspi_init_ahb_read(struct fsl_qspi *q)
 
 	/* Set the default lut sequence for AHB Read. */
 	seqid = fsl_qspi_get_seqid(q, q->nor[0].read_opcode);
+	if (seqid < 0)
+		return seqid;
+
 	qspi_writel(q, seqid << QUADSPI_BFGENCR_SEQID_SHIFT,
 		q->iobase + QUADSPI_BFGENCR);
+	return 0;
 }
 
 /* This function was used to prepare and enable QSPI clock */
@@ -805,9 +812,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 	fsl_qspi_init_lut(q);
 
 	/* Init for AHB read */
-	fsl_qspi_init_ahb_read(q);
-
-	return 0;
+	return fsl_qspi_init_ahb_read(q);
 }
 
 static const struct of_device_id fsl_qspi_dt_ids[] = {
-- 
2.19.0
