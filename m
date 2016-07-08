Received: from mail-sn1nam02on0088.outbound.protection.outlook.com
 ([104.47.36.88] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLW84-00065E-9z
 for linux-mtd@lists.infradead.org; Fri, 08 Jul 2016 13:47:41 +0000
From: P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, =?UTF-8?q?Ezequiel=20Garc=C3=ADa?=
 <ezequiel@vanguardiasur.com.ar>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marex@denx.de>, Jagan Teki
 <jteki@openedev.com>, Furquan Shaikh <furquan@google.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Michal
 Simek" <michals@xilinx.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 Harini Katakam <harinik@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>,
 "P L Sai Krishna" <lakshmis@xilinx.com>
Subject: [LINUX PATCH] mtd: spi-nor: Added support for n25q00a.
Date: Fri, 8 Jul 2016 19:16:55 +0530
Message-ID: <1467985615-35153-1-git-send-email-lakshmis@xilinx.com>
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

Add Micron (n25q00a) 1Gbit NOR Flash in the list of supported
devices.
This part is different from n25q00 in Memory Type.
Memory Type for n25q00 - BAh
Memory Type for n25q00a - BBh

Signed-off-by: P L Sai Krishna <lakshmis@xilinx.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c52e455..15a6b41 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -871,6 +871,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
-- 
2.1.1
