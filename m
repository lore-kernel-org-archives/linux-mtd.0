Received: from mail-pa0-f43.google.com ([209.85.220.43])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS07j-00062M-CH
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 09:57:35 +0000
Received: by pacgr6 with SMTP id gr6so154254488pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 02:57:14 -0700 (PDT)
From: Jagan Teki <jteki@openedev.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jteki@openedev.com>,
 Hou Zhiqiang <B48286@freescale.com>,
 "Mingkai.Hu" <Mingkai.Hu@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/3] mtd: spi-nor: sf: Add clear flag status register support
Date: Wed, 19 Aug 2015 15:26:45 +0530
Message-Id: <1439978205-6092-3-git-send-email-jteki@openedev.com>
In-Reply-To: <1439978205-6092-1-git-send-email-jteki@openedev.com>
References: <1439978205-6092-1-git-send-email-jteki@openedev.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The clear flag status register operation was required by Micron
SPI-NOR chips, which support FSR. And if an error bit of FSR
have been set like protection, voltage, erase, and program,
it must be cleared by the clear FSR operation.

Signed-off-by: Jagan Teki <jteki@openedev.com>
Cc: Hou Zhiqiang <B48286@freescale.com>
Cc: Mingkai.Hu <Mingkai.Hu@freescale.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 35 +++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |  9 +++++++++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f954d03..c5c472d5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -100,6 +100,28 @@ static int read_fsr(struct spi_nor *nor)
 }
 
 /*
+ * Read the clear flag status register.
+ * The clear flag status register operation was required by Micron
+ * SPI-NOR chips, which support FSR. And if an error bit of FSR
+ * have been set like protection, voltage, erase, and program,
+ * it must be cleared by the clear FSR operation.
+ * Returns zero for FSR bits cleared and negative if error occurred.
+ */
+static int read_cfsr(struct spi_nor *nor)
+{
+	int ret;
+	u8 val;
+
+	ret = nor->read_reg(nor, SPINOR_OP_RDCFSR, &val, 1);
+	if (ret < 0) {
+		pr_err("error %d reading CFSR\n", ret);
+		return ret;
+	}
+
+	return val;
+}
+
+/*
  * Read configuration register, returning its value in the
  * location. Return the configuration register value.
  * Returns negative if error occured.
@@ -209,10 +231,15 @@ static inline int spi_nor_sr_ready(struct spi_nor *nor)
 static inline int spi_nor_fsr_ready(struct spi_nor *nor)
 {
 	int fsr = read_fsr(nor);
-	if (fsr < 0)
-		return fsr;
-	else
-		return fsr & FSR_READY;
+	if (fsr & FSR_ERR_MASK) {
+		pr_err("flag status(0x%x) error occured\n", fsr);
+		int cfsr = read_cfsr(nor);
+		if (cfsr < 0)
+			return cfsr;
+		return -1;
+	}
+
+	return fsr & FSR_READY;
 }
 
 static int spi_nor_ready(struct spi_nor *nor)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index c5a58c4..36c1681 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -35,6 +35,7 @@
 #define SPINOR_OP_RDID		0x9f	/* Read JEDEC ID */
 #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
+#define SPINOR_OP_RDCFSR	0x50	/* Read clear flag status register */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define SPINOR_OP_READ4		0x13	/* Read data bytes (low frequency) */
@@ -74,6 +75,14 @@
 /* Enhanced Volatile Configuration Register bits */
 #define EVCR_QUAD_EN_MICRON    0x80    /* Micron Quad I/O */
 
+/* Flag Status Register Error bits */
+#define FSR_ERR_PROT		0x2	/* Protection */
+#define FSR_ERR_VOLT		0x8	/* Voltage on Vpp */
+#define FSR_ERR_PROG		0x10	/* Program operation */
+#define FSR_ERR_ERASE		0x20	/* Erase operation */
+#define FSR_ERR_MASK		(FSR_ERR_PROT | FSR_ERR_VOLT | \
+				FSR_ERR_PROG | FSR_ERR_ERASE)
+
 /* Flag Status Register bits */
 #define FSR_READY		0x80
 
-- 
1.9.1
