From: Yunhui Cui <B56489@freescale.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <han.xu@freescale.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <yao.yuan@nxp.com>
Subject: [PATCH v2 4/4] mtd:spi_nor: Disable Micron flash HW protection
Date: Mon, 1 Feb 2016 19:30:08 +0800
Message-ID: <1454326208-4533-4-git-send-email-B56489@freescale.com>
In-Reply-To: <1454326208-4533-1-git-send-email-B56489@freescale.com>
References: <1454326208-4533-1-git-send-email-B56489@freescale.com>
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

For Micron family ,The status register write enable/disable bit,
provides hardware data protection for the device.
When the enable/disable bit is set to 1, the status register
nonvolatile bits become read-only and the WRITE STATUS REGISTER
operation will not execute.

Signed-off-by: Yunhui Cui <B56489@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ed0c19c..917f814 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -39,6 +39,7 @@
 
 #define SPI_NOR_MAX_ID_LEN	6
 #define SPI_NOR_MAX_ADDR_WIDTH	4
+#define SPI_NOR_MICRON_WRITE_ENABLE	0x7f
 
 struct flash_info {
 	char		*name;
@@ -1238,6 +1239,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		write_sr(nor, 0);
 	}
 
+	if (JEDEC_MFR(info) == SNOR_MFR_MICRON) {
+		ret = read_sr(nor);
+		ret &= SPI_NOR_MICRON_WRITE_ENABLE;
+
+		write_enable(nor);
+		write_sr(nor, ret);
+	}
+
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
 	mtd->priv = nor;
-- 
2.1.0.27.g96db324
