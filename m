Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOfVa-0004Co-4c
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 05:52:45 +0000
Received: by mail-pa0-x241.google.com with SMTP id pv5so1442065pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 21:52:24 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH 5/8] mtd: spi-nor: use BIT() for flash_info flags
Date: Wed, 27 Jan 2016 21:51:44 -0800
Message-Id: <1453960307-10181-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's a little easier to read and make sure there are no collisions
(IMO).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 46da6bb706fa..ac930e902ee3 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -61,14 +61,14 @@ struct flash_info {
 	u16		addr_width;
 
 	u16		flags;
-#define	SECT_4K			0x01	/* SPINOR_OP_BE_4K works uniformly */
-#define	SPI_NOR_NO_ERASE	0x02	/* No erase command needed */
-#define	SST_WRITE		0x04	/* use SST byte programming */
-#define	SPI_NOR_NO_FR		0x08	/* Can't do fastread */
-#define	SECT_4K_PMC		0x10	/* SPINOR_OP_BE_4K_PMC works uniformly */
-#define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
-#define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
-#define	USE_FSR			0x80	/* use flag status register */
+#define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
+#define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
+#define SST_WRITE		BIT(2)	/* use SST byte programming */
+#define SPI_NOR_NO_FR		BIT(3)	/* Can't do fastread */
+#define SECT_4K_PMC		BIT(4)	/* SPINOR_OP_BE_4K_PMC works uniformly */
+#define SPI_NOR_DUAL_READ	BIT(5)	/* Flash supports Dual Read */
+#define SPI_NOR_QUAD_READ	BIT(6)	/* Flash supports Quad Read */
+#define USE_FSR			BIT(7)	/* use flag status register */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
-- 
1.7.9.5
