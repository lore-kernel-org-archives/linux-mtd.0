Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffiGs-00082c-FW
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:57:21 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 3/4] mtd: rawnand: orion: Handle cases where
 __LINUX_ARM_ARCH__ is not defined
Date: Wed, 18 Jul 2018 10:56:51 +0200
Message-Id: <20180718085652.30391-4-boris.brezillon@bootlin.com>
In-Reply-To: <20180718085652.30391-1-boris.brezillon@bootlin.com>
References: <20180718085652.30391-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make sure __LINUX_ARM_ARCH__ is defined before testing its value.
This is needed if we want to allow selection of this driver when
COMPILE_TEST=y.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 27cc902545f3..52d435285a3f 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -52,7 +52,7 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	void __iomem *io_base = chip->IO_ADDR_R;
-#if __LINUX_ARM_ARCH__ >= 5
+#if defined(__LINUX_ARM_ARCH__) && __LINUX_ARM_ARCH__ >= 5
 	uint64_t *buf64;
 #endif
 	int i = 0;
@@ -61,7 +61,7 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 		*buf++ = readb(io_base);
 		len--;
 	}
-#if __LINUX_ARM_ARCH__ >= 5
+#if defined(__LINUX_ARM_ARCH__) && __LINUX_ARM_ARCH__ >= 5
 	buf64 = (uint64_t *)buf;
 	while (i < len/8) {
 		/*
-- 
2.14.1
