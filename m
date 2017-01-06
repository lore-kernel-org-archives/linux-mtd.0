Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPQw8-0003G8-50
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 09:36:20 +0000
From: linshunquan 00354166 <linshunquan1@hisilicon.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, <marek.vasut@gmail.com>,
 <richard@nod.at>, <cyrille.pitchen@atmel.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>
CC: <xuejiancheng@hisilicon.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <howell.yang@hisilicon.com>, <jalen.hsu@hisilicon.com>,
 <suwenping@hisilicon.com>, <raojun@hisilicon.com>,
 <kevin.lixu@hisilicon.com>, <lvkuanliang@hisilicon.com>,
 linshunquan 00354166 <linshunquan1@hisilicon.com>
Subject: [PATCH v1] mtd: spi nor: modify the boot and flash type of FMC
Date: Fri, 6 Jan 2017 17:12:11 +0800
Message-ID: <1483693931-22249-1-git-send-email-linshunquan1@hisilicon.com>
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

(1) The HiSilicon Flash Memory Controller(FMC) is a multi-functions
 device which supports SPI Nor flash controller, SPI nand Flash
 controller and parallel nand flash controller. So when we are prepare
 to operation SPI Nor, we should make sure the flash type is SPI Nor.

(2) Make sure the boot type is Normal Type before initialize the SPI
    Nor controller.

Signed-off-by: linshunquan 00354166 <linshunquan1@hisilicon.com>
---
 drivers/mtd/spi-nor/hisi-sfc.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index 20378b0..7855024 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -32,6 +32,8 @@
 #define FMC_CFG_OP_MODE_MASK		BIT_MASK(0)
 #define FMC_CFG_OP_MODE_BOOT		0
 #define FMC_CFG_OP_MODE_NORMAL		1
+#define FMC_CFG_OP_MODE_SEL(mode)      ((mode) & 0x1)
+#define FMC_CFG_FLASH_SEL_SPI_NOR	(0x0 << 1)
 #define FMC_CFG_FLASH_SEL(type)		(((type) & 0x3) << 1)
 #define FMC_CFG_FLASH_SEL_MASK		0x6
 #define FMC_ECC_TYPE(type)		(((type) & 0x7) << 5)
@@ -141,10 +143,36 @@ static int get_if_type(enum read_mode flash_read)
 	return if_type;
 }
 
+static void spi_nor_switch_spi_type(struct hifmc_host *host)
+{
+	unsigned int reg;
+
+	reg = readl(host->regbase + FMC_CFG);
+	if ((reg & FMC_CFG_FLASH_SEL_MASK)
+		   	== FMC_CFG_FLASH_SEL_SPI_NOR)
+		return;
+
+	/* if the flash type isn't spi nor, change it */
+	reg &= ~FMC_CFG_FLASH_SEL_MASK;
+	reg |= FMC_CFG_FLASH_SEL(0);
+	writel(reg, host->regbase + FMC_CFG);
+}
+
 static void hisi_spi_nor_init(struct hifmc_host *host)
 {
 	u32 reg;
 
+	/* switch the flash type to spi nor */
+	spi_nor_switch_spi_type(host);
+
+	/* set the boot mode to normal */
+	reg = readl(host->regbase + FMC_CFG);
+	if ((reg & FMC_CFG_OP_MODE_MASK) == FMC_CFG_OP_MODE_BOOT) {
+		reg |= FMC_CFG_OP_MODE_SEL(FMC_CFG_OP_MODE_NORMAL);
+		writel(reg, host->regbase + FMC_CFG);
+	}
+
+	/* set timming */
 	reg = TIMING_CFG_TCSH(CS_HOLD_TIME)
 		| TIMING_CFG_TCSS(CS_SETUP_TIME)
 		| TIMING_CFG_TSHSL(CS_DESELECT_TIME);
@@ -167,6 +195,8 @@ static int hisi_spi_nor_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	if (ret)
 		goto out;
 
+	spi_nor_switch_spi_type(host);
+
 	return 0;
 
 out:
-- 
2.7.4
