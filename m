Received: from mail-cys01nam02on0067.outbound.protection.outlook.com
 ([104.47.37.67] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eIBD2-0001wP-0Y
 for linux-mtd@lists.infradead.org; Fri, 24 Nov 2017 10:27:49 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <boris.brezillon@free-electrons.com>, <marek.vasut@gmail.com>,
 <richard@nod.at>, <cyrille.pitchen@wedev4u.fr>
CC: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCH 1/2] mtd: spi-nor: add a API to restore the addressing mode
Date: Fri, 24 Nov 2017 18:08:47 +0800
Message-ID: <20171124100848.1828-2-Zhiqiang.Hou@nxp.com>
In-Reply-To: <20171124100848.1828-1-Zhiqiang.Hou@nxp.com>
References: <20171124100848.1828-1-Zhiqiang.Hou@nxp.com>
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

It's better to restore the addressing mode of the SPI flash
whenever remove the driver or reboot the system.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
 include/linux/mtd/spi-nor.h   | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bc266f70a15b..801cbe99b059 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2713,6 +2713,14 @@ static void spi_nor_resume(struct mtd_info *mtd)
 		dev_err(dev, "resume() failed\n");
 }
 
+void spi_nor_restore_addr_mode(struct spi_nor *nor)
+{
+	if ((nor->addr_width == 4) &&
+	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
+	    !(nor->info->flags & SPI_NOR_4B_OPCODES))
+		set_4byte(nor, nor->info, 0);
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index d0c66a0975cf..fe9357da2049 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -398,5 +398,6 @@ struct spi_nor_hwcaps {
  */
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps);
+void spi_nor_restore_addr_mode(struct spi_nor *nor);
 
 #endif
-- 
2.14.1
