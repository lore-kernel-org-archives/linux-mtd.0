Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTFTP-0008Nj-7O
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 22:09:56 +0000
Received: by mail-lf0-x242.google.com with SMTP id q89so14209034lfi.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 14:09:34 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: bcm47xxsflash: support reading flash out of mapping
 window
Date: Mon, 16 Jan 2017 23:09:16 +0100
Message-Id: <20170116220916.2603-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

For reading flash content we use MMIO but it's possible to read only
first 16 MiB this way. It's simply an arch design/limitation.
To support flash sizes bigger than 16 MiB implement indirect access
using ChipCommon registers.
This has been tested using MX25L25635F.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/devices/bcm47xxsflash.c | 12 +++++++++++-
 drivers/mtd/devices/bcm47xxsflash.h |  3 +++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 4decd8c..5d57119 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -110,7 +110,17 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if ((from + len) > mtd->size)
 		return -EINVAL;
 
-	memcpy_fromio(buf, b47s->window + from, len);
+	if (from + len <= BCM47XXSFLASH_WINDOW_SIZE) {
+		memcpy_fromio(buf, b47s->window + from, len);
+	} else {
+		size_t i;
+
+		for (i = 0; i < len; i++) {
+			b47s->cc_write(b47s, BCMA_CC_FLASHADDR, from++);
+			bcm47xxsflash_cmd(b47s, OPCODE_ST_READ4B);
+			*(buf++) = b47s->cc_read(b47s, BCMA_CC_FLASHDATA) & 0xff;
+		}
+	}
 	*retlen = len;
 
 	return len;
diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
index 1564b62..d8d1093 100644
--- a/drivers/mtd/devices/bcm47xxsflash.h
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -3,6 +3,8 @@
 
 #include <linux/mtd/mtd.h>
 
+#define BCM47XXSFLASH_WINDOW_SIZE		SZ_16M
+
 /* Used for ST flashes only. */
 #define OPCODE_ST_WREN		0x0006		/* Write Enable */
 #define OPCODE_ST_WRDIS		0x0004		/* Write Disable */
@@ -16,6 +18,7 @@
 #define OPCODE_ST_RES		0x03ab		/* Read Electronic Signature */
 #define OPCODE_ST_CSA		0x1000		/* Keep chip select asserted */
 #define OPCODE_ST_SSE		0x0220		/* Sub-sector Erase */
+#define OPCODE_ST_READ4B	0x6313
 
 /* Used for Atmel flashes only. */
 #define OPCODE_AT_READ				0x07e8
-- 
2.10.1
