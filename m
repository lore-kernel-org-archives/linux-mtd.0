Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1EyY-0000B7-Pc
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 16:30:38 +0000
Received: by mail-oi0-x242.google.com with SMTP id m34so2227084oik.2
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 09:30:14 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] mtd: dataflash: Make use of "extened device
 information"
Date: Thu, 20 Apr 2017 09:29:51 -0700
Message-Id: <20170420162952.5181-5-andrew.smirnov@gmail.com>
In-Reply-To: <20170420162952.5181-1-andrew.smirnov@gmail.com>
References: <20170420162952.5181-1-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In anticipation of supporting chips that need it, extend the size of
struct flash_info's 'jedec_id' field to make room 2 byte of extended
device information as well as add code to fetch this data during
jedec_probe().

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

Changes since [v3]:

	- Convert patch to use SUP_EXTID flag and avoid patching
          dataflash_data table

Changes since [v2]:

	- Make 'id' have same size as 'jedec'

	- Get rid of eid_mask variable in favour of using GENMASK
          in-place

Changes since [v1]:

	- Formatting

[v1] http://lkml.kernel.org/r/20170411161722.11164-1-andrew.smirnov@gmail.com
[v2] http://lkml.kernel.org/r/20170418142127.23301-3-andrew.smirnov@gmail.com
[v3] http://lkml.kernel.org/r/20170419152305.17226-5-andrew.smirnov@gmail.com

 drivers/mtd/devices/mtd_dataflash.c | 88 ++++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 2d3e403..9342cc47 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -84,6 +84,9 @@
 
 #define CFI_MFR_ATMEL		0x1F
 
+#define DATAFLASH_SHIFT_EXTID	24
+#define DATAFLASH_SHIFT_ID	40
+
 struct dataflash {
 	u8			command[4];
 	char			name[24];
@@ -687,7 +690,7 @@ struct flash_info {
 	/* JEDEC id has a high byte of zero plus three data bytes:
 	 * the manufacturer id, then a two byte device id.
 	 */
-	u32		jedec_id;
+	u64		jedec_id;
 
 	/* The size listed here is what works with OP_ERASE_PAGE. */
 	unsigned	nr_pages;
@@ -695,6 +698,7 @@ struct flash_info {
 	u16		pageoffset;
 
 	u16		flags;
+#define SUP_EXTID	BIT(3)
 #define SUP_POW2PS	0x0002		/* supports 2^N byte pages */
 #define IS_POW2PS	0x0001		/* uses 2^N byte pages */
 };
@@ -734,42 +738,18 @@ static struct flash_info dataflash_data[] = {
 	{ "at45db642d",  0x1f2800, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS},
 };
 
-static struct flash_info *jedec_probe(struct spi_device *spi)
+static struct flash_info *jedec_lookup(struct spi_device *spi,
+				       u64 jedec, bool use_extid)
 {
-	int ret;
-	u8 code = OP_READ_ID;
-	u8 id[3];
-	u32 jedec;
 	struct flash_info *info;
 	int status;
 
-	/*
-	 * JEDEC also defines an optional "extended device information"
-	 * string for after vendor-specific data, after the three bytes
-	 * we use here.  Supporting some chips might require using it.
-	 *
-	 * If the vendor ID isn't Atmel's (0x1f), assume this call failed.
-	 * That's not an error; only rev C and newer chips handle it, and
-	 * only Atmel sells these chips.
-	 */
-	ret = spi_write_then_read(spi, &code, 1, id, 3);
-	if (ret < 0) {
-		dev_dbg(&spi->dev, "error %d reading JEDEC ID\n", ret);
-		return ERR_PTR(ret);
-	}
-
-	if (id[0] != CFI_MFR_ATMEL)
-		return NULL;
-
-	jedec = id[0];
-	jedec = jedec << 8;
-	jedec |= id[1];
-	jedec = jedec << 8;
-	jedec |= id[2];
-
 	for (info = dataflash_data;
 	     info < dataflash_data + ARRAY_SIZE(dataflash_data);
 	     info++) {
+		if (use_extid && !(info->flags & SUP_EXTID))
+			continue;
+
 		if (info->jedec_id == jedec) {
 			dev_dbg(&spi->dev, "OTP, sector protect%s\n",
 				(info->flags & SUP_POW2PS) ?
@@ -793,12 +773,58 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
 		}
 	}
 
+	return ERR_PTR(-ENODEV);
+}
+
+static struct flash_info *jedec_probe(struct spi_device *spi)
+{
+	int ret;
+	u8 code = OP_READ_ID;
+	u64 jedec;
+	u8 id[sizeof(jedec)] = {0};
+	const unsigned int id_size = 5;
+	struct flash_info *info;
+
+	/*
+	 * JEDEC also defines an optional "extended device information"
+	 * string for after vendor-specific data, after the three bytes
+	 * we use here.  Supporting some chips might require using it.
+	 *
+	 * If the vendor ID isn't Atmel's (0x1f), assume this call failed.
+	 * That's not an error; only rev C and newer chips handle it, and
+	 * only Atmel sells these chips.
+	 */
+	ret = spi_write_then_read(spi, &code, 1, id, id_size);
+	if (ret < 0) {
+		dev_dbg(&spi->dev, "error %d reading JEDEC ID\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	if (id[0] != CFI_MFR_ATMEL)
+		return NULL;
+
+	jedec = be64_to_cpup((__be64 *)id);
+
+	/*
+	 * First, try to match device using extended device
+	 * information
+	 */
+	info = jedec_lookup(spi, jedec >> DATAFLASH_SHIFT_EXTID, true);
+	if (!IS_ERR(info))
+		return info;
+	/*
+	 * If that fails, make another pass using regular ID
+	 * information
+	 */
+	info = jedec_lookup(spi, jedec >> DATAFLASH_SHIFT_ID, false);
+	if (!IS_ERR(info))
+		return info;
 	/*
 	 * Treat other chips as errors ... we won't know the right page
 	 * size (it might be binary) even when we can tell which density
 	 * class is involved (legacy chip id scheme).
 	 */
-	dev_warn(&spi->dev, "JEDEC id %06x not handled\n", jedec);
+	dev_warn(&spi->dev, "JEDEC id %016llx not handled\n", jedec);
 	return ERR_PTR(-ENODEV);
 }
 
-- 
2.9.3
