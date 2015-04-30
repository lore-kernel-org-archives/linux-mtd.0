Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnwQV-0006oI-J0
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 21:55:27 +0000
Message-Id: <35add8df33b17e2354d9496eba8597d9d8488f30.1430430153.git.hramrach@gmail.com>
In-Reply-To: <cover.1430430153.git.hramrach@gmail.com>
References: <cover.1430430153.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Apr 2015 23:13:12 +0200
Subject: [PATCH 3/3] MTD: spi-nor: add flag to not use sector erase.
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, <zajec5@gmail.com>,
 Marek Vasut <marex@denx.de>, Alison Chaiken <alison_chaiken@mentor.com>,
 Michal Suchanek <hramrach@gmail.com>, Ben Hutchings <ben@decadent.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>,
 "grmoore@altera.com" <grmoore@altera.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The sector size of the flash memory is unclear from datasheet or may
possibly vary between chips so add a flag to always use 4k blocks.

Currently 4k blocks are always used when possible but in the future
somebody might want to do some optimizations with sector erase.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index de73cf5..371e91c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -55,6 +55,7 @@ struct flash_info {
 #define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
 #define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
 #define	USE_FSR			0x80	/* use flag status register */
+#define	NO_SPINOR_OP_SE	       0x100	/* do not erase sectors */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -333,6 +334,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* REVISIT in some cases we could speed up erasing large regions
 	 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
 	 * to use "small sector erase", but that's not always optimal.
+	 * The block size for SPINOR_OP_SE is unknown/untested for some flashes.
 	 */
 
 	/* "sector"-at-a-time erase */
@@ -551,7 +553,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
 
 	/* GigaDevice */
-	{ "gd25q41b", INFO(0xc84013, 0, 64 * 1024,  8, SECT_4K) },
+	{ "gd25q41b", INFO(0xc84013, 0, 64 * 1024,  8, SECT_4K | NO_SPINOR_OP_SE) },
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
-- 
2.1.4
