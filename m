Received: from mail-lf0-f65.google.com ([209.85.215.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbb8u-0007E5-Oz
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 22:55:21 +0000
Received: by mail-lf0-f65.google.com with SMTP id x1so10572481lff.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 14:54:56 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V4] mtd: bcm47xxsflash: support reading flash out of mapping
 window
Date: Wed,  8 Feb 2017 23:53:44 +0100
Message-Id: <20170208225344.24010-1-zajec5@gmail.com>
In-Reply-To: <20170123115154.3364-1-zajec5@gmail.com>
References: <20170123115154.3364-1-zajec5@gmail.com>
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
Acked-by: Marek Vasut <marek.vasut@gmail.com>
---
V2: Simplify line writing to buf
    Add some trivial comment for OPCODE_ST_READ4B
    Both requested by Marek
V3: Use as much as possible MMIO access for reads crossing boundary
V4: Add missing buf increment (thanks Brian!)
---
 drivers/mtd/devices/bcm47xxsflash.c | 24 +++++++++++++++++++++---
 drivers/mtd/devices/bcm47xxsflash.h |  3 +++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 4decd8c0360a..e2bd81817df4 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -105,15 +105,33 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			      size_t *retlen, u_char *buf)
 {
 	struct bcm47xxsflash *b47s = mtd->priv;
+	size_t orig_len = len;
 
 	/* Check address range */
 	if ((from + len) > mtd->size)
 		return -EINVAL;
 
-	memcpy_fromio(buf, b47s->window + from, len);
-	*retlen = len;
+	/* Read as much as possible using fast MMIO window */
+	if (from < BCM47XXSFLASH_WINDOW_SZ) {
+		size_t memcpy_len;
 
-	return len;
+		memcpy_len = min(len, (size_t)(BCM47XXSFLASH_WINDOW_SZ - from));
+		memcpy_fromio(buf, b47s->window + from, memcpy_len);
+		from += memcpy_len;
+		len -= memcpy_len;
+		buf += memcpy_len;
+	}
+
+	/* Use indirect access for content out of the window */
+	for (; len; len--) {
+		b47s->cc_write(b47s, BCMA_CC_FLASHADDR, from++);
+		bcm47xxsflash_cmd(b47s, OPCODE_ST_READ4B);
+		*buf++ = b47s->cc_read(b47s, BCMA_CC_FLASHDATA);
+	}
+
+	*retlen = orig_len;
+
+	return orig_len;
 }
 
 static int bcm47xxsflash_write_st(struct mtd_info *mtd, u32 offset, size_t len,
diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
index 1564b62b412e..b2d7b38f75fd 100644
--- a/drivers/mtd/devices/bcm47xxsflash.h
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -3,6 +3,8 @@
 
 #include <linux/mtd/mtd.h>
 
+#define BCM47XXSFLASH_WINDOW_SZ			SZ_16M
+
 /* Used for ST flashes only. */
 #define OPCODE_ST_WREN		0x0006		/* Write Enable */
 #define OPCODE_ST_WRDIS		0x0004		/* Write Disable */
@@ -16,6 +18,7 @@
 #define OPCODE_ST_RES		0x03ab		/* Read Electronic Signature */
 #define OPCODE_ST_CSA		0x1000		/* Keep chip select asserted */
 #define OPCODE_ST_SSE		0x0220		/* Sub-sector Erase */
+#define OPCODE_ST_READ4B	0x6313		/* Read Data Bytes in 4Byte addressing mode */
 
 /* Used for Atmel flashes only. */
 #define OPCODE_AT_READ				0x07e8
-- 
2.11.0
