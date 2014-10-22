Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgqR1-0005lD-LS
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 07:34:20 +0000
Received: by mail-wg0-f50.google.com with SMTP id a1so3058599wgh.33
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 00:33:57 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: prefer more specific entries from chips database
Date: Wed, 22 Oct 2014 09:33:43 +0200
Message-Id: <1413963223-6365-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Bean Huo <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With few entries sharing the same JEDEC ID it could happen the less
specific one would be picked (depending on the order). We should prefer
entries with extended ID available.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
Cc: Bean Huo <beanhuo@micron.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c51ee52..727ec3c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -661,13 +661,26 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
 
 	ext_jedec = id[3] << 8 | id[4];
 
-	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
-		info = (void *)spi_nor_ids[tmp].driver_data;
-		if (info->jedec_id == jedec) {
-			if (info->ext_id == 0 || info->ext_id == ext_jedec)
+	/*
+	 * First let's look for entries with ext_id only. We don't want some
+	 * generic entry to take a precedence over more specific ones.
+	 */
+	if (ext_jedec) {
+		for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
+			info = (void *)spi_nor_ids[tmp].driver_data;
+			if (info->jedec_id == jedec &&
+			    info->ext_id == ext_jedec)
 				return &spi_nor_ids[tmp];
 		}
 	}
+
+	/* Now check more generic entries (without ext_id) */
+	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
+		info = (void *)spi_nor_ids[tmp].driver_data;
+		if (info->jedec_id == jedec && !info->ext_id)
+			return &spi_nor_ids[tmp];
+	}
+
 	dev_err(nor->dev, "unrecognized JEDEC id %06x\n", jedec);
 	return ERR_PTR(-ENODEV);
 }
-- 
1.8.4.5
