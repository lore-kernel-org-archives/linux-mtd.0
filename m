Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0U1D-0000VA-DA
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 14:22:13 +0000
Received: by mail-pf0-x242.google.com with SMTP id a188so30876672pfa.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2017 07:21:50 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] mtd: dataflash: Improve coding style in jedec_probe()
Date: Tue, 18 Apr 2017 07:21:26 -0700
Message-Id: <20170418142127.23301-2-andrew.smirnov@gmail.com>
In-Reply-To: <20170418142127.23301-1-andrew.smirnov@gmail.com>
References: <20170418142127.23301-1-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As per request from Marek Vasut, change the following:

   - Replace indentation between type and name of local variable from
     tabs to spaces

   - Replace magic number 0x1F with CFI_MFR_ATMEL macro

   - Replace variable 'tmp' with 'ret' and 'i' where appropriate

   - Reformat multi-line comments and add newlines where appropriate

No functional change intended.

Cc: cphealy@gmail.com
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/mtd/devices/mtd_dataflash.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index a566231..5b7a8c3 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -82,6 +82,7 @@
 #define OP_WRITE_SECURITY_REVC	0x9A
 #define OP_WRITE_SECURITY	0x9B	/* revision D */
 
+#define CFI_MFR_ATMEL		0x1F
 
 struct dataflash {
 	u8			command[4];
@@ -738,14 +739,15 @@ static struct flash_info dataflash_data[] = {
 
 static struct flash_info *jedec_probe(struct spi_device *spi)
 {
-	int			tmp;
-	u8			code = OP_READ_ID;
-	u8			id[3];
-	u32			jedec;
-	struct flash_info	*info;
+	int ret, i;
+	u8 code = OP_READ_ID;
+	u8 id[3];
+	u32 jedec;
+	struct flash_info *info;
 	int status;
 
-	/* JEDEC also defines an optional "extended device information"
+	/*
+	 * JEDEC also defines an optional "extended device information"
 	 * string for after vendor-specific data, after the three bytes
 	 * we use here.  Supporting some chips might require using it.
 	 *
@@ -753,13 +755,14 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
 	 * That's not an error; only rev C and newer chips handle it, and
 	 * only Atmel sells these chips.
 	 */
-	tmp = spi_write_then_read(spi, &code, 1, id, 3);
-	if (tmp < 0) {
+	ret = spi_write_then_read(spi, &code, 1, id, 3);
+	if (ret < 0) {
 		pr_debug("%s: error %d reading JEDEC ID\n",
-			dev_name(&spi->dev), tmp);
-		return ERR_PTR(tmp);
+			dev_name(&spi->dev), ret);
+		return ERR_PTR(ret);
 	}
-	if (id[0] != 0x1f)
+
+	if (id[0] != CFI_MFR_ATMEL)
 		return NULL;
 
 	jedec = id[0];
@@ -768,9 +771,9 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
 	jedec = jedec << 8;
 	jedec |= id[2];
 
-	for (tmp = 0, info = dataflash_data;
-			tmp < ARRAY_SIZE(dataflash_data);
-			tmp++, info++) {
+	for (i = 0, info = dataflash_data;
+			i < ARRAY_SIZE(dataflash_data);
+			i++, info++) {
 		if (info->jedec_id == jedec) {
 			pr_debug("%s: OTP, sector protect%s\n",
 				dev_name(&spi->dev),
-- 
2.9.3
