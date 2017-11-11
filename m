Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eDcjQ-0004Yk-UK
 for linux-mtd@lists.infradead.org; Sat, 11 Nov 2017 20:50:26 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V1] drivers:mtd:spi-nor:checkup FSR error bits
Date: Sat, 11 Nov 2017 20:49:26 +0000
Message-ID: <825c7a1bb1034369b9d592a7b358030c@SIWEX5A.sing.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For the Micron SPI NOR, when the erase/program operation fails, especially,
for the failure results from intending to modify protected space, spi-nor
upper layers still get the return which shows the operation succeeds.
this because spi_nor_fsr_ready() only uses bit.7 to device whether ready.
For the most cases, even the error of erase/program occurs, SPI NOR device
is still ready. The device ready and the error are two different cases.
This patch is to fixup this issue and adding FSR (flag status register)
error bits checkup.
The FSR(flag status register) is a powerful tool to investigate the staus
of device,checking information regarding what is actually doing the memory
and detecting possible error conditions.

Signed-off-by: beanhuo <beanhuo@micron.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 19 +++++++++++++++++--
 include/linux/mtd/spi-nor.h   |  6 +++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bc266f7..200e814 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -330,8 +330,23 @@ static inline int spi_nor_fsr_ready(struct spi_nor *no=
r)
 	int fsr =3D read_fsr(nor);
 	if (fsr < 0)
 		return fsr;
-	else
-		return fsr & FSR_READY;
+
+	if (fsr & (FSR_E_ERR | FSR_P_ERR)) {
+		if (fsr & FSR_E_ERR)
+			dev_err(nor->dev, "Erase operation failed.\n");
+		else
+			dev_err(nor->dev, "Program operation failed.\n");
+
+		if (fsr & FSR_PT_ERR)
+			dev_err(nor->dev,
+			"The operation has attempted to modify the protected"
+			"sector or the locked OPT space.\n");
+
+		nor->write_reg(nor, SPINOR_OP_CLFSR, NULL, 0);
+		return -EIO;
+	}
+
+	return fsr & FSR_READY;
 }
=20
 static int spi_nor_ready(struct spi_nor *nor)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index d0c66a0..46b5608 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -61,6 +61,7 @@
 #define SPINOR_OP_RDSFDP	0x5a	/* Read SFDP */
 #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
+#define SPINOR_OP_CLFSR		0x50	/* Clear flag status register */
=20
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define SPINOR_OP_READ_4B	0x13	/* Read data bytes (low frequency) */
@@ -130,7 +131,10 @@
 #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
=20
 /* Flag Status Register bits */
-#define FSR_READY		BIT(7)
+#define FSR_READY		BIT(7)	/* Device status, 0 =3D Busy,1 =3D Ready */
+#define FSR_E_ERR		BIT(5)	/* Erase operation status */
+#define FSR_P_ERR		BIT(4)	/* Program operation status */
+#define FSR_PT_ERR		BIT(1)	/* Protection error bit */
=20
 /* Configuration Register bits. */
 #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
--=20
2.7.4
