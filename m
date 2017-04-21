Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1bSf-0005RT-Bz
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 16:31:11 +0000
Received: by mail-io0-x243.google.com with SMTP id h41so32055226ioi.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Apr 2017 09:30:48 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] mtd: dataflash: Improve coding style in jedec_probe()
Date: Fri, 21 Apr 2017 09:30:22 -0700
Message-Id: <20170421163026.24884-2-andrew.smirnov@gmail.com>
In-Reply-To: <20170421163026.24884-1-andrew.smirnov@gmail.com>
References: <20170421163026.24884-1-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change the following:

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
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-kernel@vger.kernel.org
Acked-by: Marek Vasut <marek.vasut@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

No changes since [v3], [v4]

Changes since [v2]:

	- Re-worded commit message

	- Collected Acked-by from Marek

Not present in v1

[v2] http://lkml.kernel.org/r/20170418142127.23301-2-andrew.smirnov@gmail.com
[v3] http://lkml.kernel.org/r/20170419152305.17226-2-andrew.smirnov@gmail.com
[v4] http://lkml.kernel.org/r/20170420162952.5181-2-andrew.smirnov@gmail.com

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
