Received: from mail-bl2nam02on0046.outbound.protection.outlook.com
 ([104.47.38.46] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMQ8k-0006fN-Ss
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 03:12:57 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <boris.brezillon@free-electrons.com>, <marek.vasut@gmail.com>,
 <richard@nod.at>, <cyrille.pitchen@wedev4u.fr>
CC: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv3 1/2] mtd: spi-nor: add an API to restore the status of SPI
 flash chip
Date: Wed, 6 Dec 2017 10:53:41 +0800
Message-ID: <20171206025342.7266-2-Zhiqiang.Hou@nxp.com>
In-Reply-To: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
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

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Add this API to restore the status of SPI flash chip to the default
such as addressing mode, whenever detach the driver from device or
reboot the system.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V3:
 - no change.

 Documentation/mtd/spi-nor.txt |  3 +++
 drivers/mtd/spi-nor/spi-nor.c | 10 ++++++++++
 include/linux/mtd/spi-nor.h   |  6 ++++++
 3 files changed, 19 insertions(+)

diff --git a/Documentation/mtd/spi-nor.txt b/Documentation/mtd/spi-nor.txt
index 548d6306ebca..da1fbff5a24c 100644
--- a/Documentation/mtd/spi-nor.txt
+++ b/Documentation/mtd/spi-nor.txt
@@ -60,3 +60,6 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
 initialize the necessary fields for spi_nor{}. Please see
 drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to fsl-quadspi.c
 when you want to write a new driver for a SPI NOR controller.
+Another API is spi_nor_restore(), this is used to restore the status of SPI
+flash chip such as addressing mode. Call it whenever detach the driver from
+device or reboot the system.
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bc266f70a15b..4a925378d434 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2713,6 +2713,16 @@ static void spi_nor_resume(struct mtd_info *mtd)
 		dev_err(dev, "resume() failed\n");
 }
 
+void spi_nor_restore(struct spi_nor *nor)
+{
+	/* restore the addressing mode */
+	if ((nor->addr_width == 4) &&
+	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
+	    !(nor->info->flags & SPI_NOR_4B_OPCODES))
+		set_4byte(nor, nor->info, 0);
+}
+EXPORT_SYMBOL_GPL(spi_nor_restore);
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index d0c66a0975cf..0a182c3d0884 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -399,4 +399,10 @@ struct spi_nor_hwcaps {
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps);
 
+/*
+ * spi_nor_restore_addr_mode() - restore the status of SPI NOR
+ * @nor:	the spi_nor structure
+ */
+void spi_nor_restore(struct spi_nor *nor);
+
 #endif
-- 
2.14.1
