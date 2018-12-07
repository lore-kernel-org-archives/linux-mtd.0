Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPf-0000zf-Bn
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:21 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 09/34] mtd: spi-nor: Add a flag to skip spi_nor_setup()
Date: Fri,  7 Dec 2018 10:26:12 +0100
Message-Id: <20181207092637.18687-10-boris.brezillon@bootlin.com>
In-Reply-To: <20181207092637.18687-1-boris.brezillon@bootlin.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some manufacturers select the opcode to use in their fixups()
method, and they don't want the generic selection logic to override
their values. Add a flag to allow that.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 7 +++++++
 include/linux/mtd/spi-nor.h   | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f6b1c9b8079a..30dbddabec74 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3502,6 +3502,13 @@ static int spi_nor_setup(struct spi_nor *nor,
 	u32 ignored_mask, shared_mask;
 	int err;
 
+	/*
+	 * Some manufacturers select the opcode to use in their fixups()
+	 * method, and explicitly ask to skip the generic selection logic.
+	 */
+	if (nor->flags & SNOR_F_SKIP_SETUP)
+		return 0;
+
 	/*
 	 * Keep only the hardware capabilities supported by both the SPI
 	 * controller and the SPI flash memory.
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 2c8fbd5d614d..8c64f1dcd35e 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -235,6 +235,7 @@ enum spi_nor_option_flags {
 	SNOR_F_4B_OPCODES	= BIT(6),
 	SNOR_F_HAS_LOCK		= BIT(7),
 	SNOR_F_CLR_SW_PROT_BITS	= BIT(8),
+	SNOR_F_SKIP_SETUP	= BIT(9),
 };
 
 /**
-- 
2.17.1
