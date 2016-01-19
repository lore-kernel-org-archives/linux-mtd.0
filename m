Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aLXnf-0000JO-Gb
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2016 15:02:28 +0000
Received: by mail-wm0-x233.google.com with SMTP id 123so95112278wmz.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jan 2016 07:02:06 -0800 (PST)
From: adamsomerville@gmail.com
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Gabor Juhos <juhosg@openwrt.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jagan Teki <jteki@openedev.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Furquan Shaikh <furquan@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Adam Somerville <adamsomerville@gmail.com>
Subject: [RFC] spi-nor: fix cross die reads on Micron multi-die devices
Date: Tue, 19 Jan 2016 15:01:50 +0000
Message-Id: <1453215710-10803-1-git-send-email-adamsomerville@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Adam Somerville <adamsomerville@gmail.com>

So as far as I can see there is a bug in the spi-nor driver when
issuing die boundary crossing reads on Micron multi-die devices.
Micron N25Q512A, N25Q00AA and probably any other Micron multi-die
devices do not support a single read request that crosses a die
boundary.

The current behaviour is that the address on the device wraps back
to the start of the first die, with any data returned beyond the
boundary being from the start of the first die.

To reproduce run:
(assuming mtd0 is at offset 0 and spans across die boundary)

mtd_debug read /dev/mtd0 0x1FFFFF0 32 bad

and compare to:

mtd_debug read /dev/mtd0 0x1FFFFF0 16 good1
mtd_debug read /dev/mtd0 0x2000000 16 good2

Instead we should split the read request in to 1 read per die.

Tested on Cyclone 5 SOC with cadence-qspi connected to Micron n25q512ax3

Signed-off-by: Adam Somerville <adamsomerville@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c |   21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ed0c19c..68dc20e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -903,10 +903,19 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 	return ERR_PTR(-ENODEV);
 }
 
+/*
+ * Micron multi-die devices do not support cross die boundary
+ * reads. Split the read request in to 1 read per die
+ */
+#define MIN_READ_BOUNDARY 0x2000000
+#define DIST_TO_BOUNDARY(x)	\
+		(MIN_READ_BOUNDARY - ((u32)x & (MIN_READ_BOUNDARY - 1)))
+
 static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	size_t read_len;
 	int ret;
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
@@ -915,7 +924,17 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
-	ret = nor->read(nor, from, len, retlen, buf);
+	do {
+		read_len = min(len, DIST_TO_BOUNDARY(from));
+
+		ret = nor->read(nor, from, read_len, retlen, buf);
+		if (ret)
+			break;
+
+		from += read_len;
+		buf += read_len;
+		len -= read_len;
+	} while (len > 0);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
 	return ret;
-- 
1.7.9.5
