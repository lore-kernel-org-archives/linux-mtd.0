Received: from mail-eopbgr40076.outbound.protection.outlook.com ([40.107.4.76]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvfNG-0005Hl-F5
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2018 09:06:06 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com
Cc: computersforpeace@gmail.com, frieder.schrempf@exceet.de,
 linux-kernel@vger.kernel.org, david.wolfe@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH 2/2] mtd: spi-nor: add entry for mt35xu512aba flash
Date: Fri, 31 Aug 2018 14:33:02 +0530
Message-Id: <1535706182-26804-3-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1535706182-26804-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1535706182-26804-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Add entry for mt35xu512aba Micron NOR flash.
This flash is having uniform sector erase size of 128KB, have
support of FSR(flag status register), flash size is 64MB and
supports 4-byte commands.

Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 33a55bc..6042df8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1113,6 +1113,9 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 
+	/* Micron */
+	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512, SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES) },
+
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
 	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
-- 
1.9.1
