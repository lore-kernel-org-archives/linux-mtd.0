Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmH5n-0001PU-Qt
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 07:02:52 +0000
Received: by mail-wg0-f43.google.com with SMTP id y10so422855wgg.30
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 23:02:29 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH V2] mtd: spi-nor: prefer more specific entries from chips
 database
Date: Thu,  6 Nov 2014 08:02:13 +0100
Message-Id: <1415257333-6488-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1413963223-6365-1-git-send-email-zajec5@gmail.com>
References: <1413963223-6365-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <shijie.huang@intel.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Bean Huo <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With two entries sharing first ID bytes but one of them having more of
them, we should prefer the more specific one. Consider following:
1) n25q128a11 with ID 0x20bb18
2) n25q128a13 with ID 0x20bb181234
we should prefer entry with the longer ID.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Huang Shijie <shijie.huang@intel.com>
---
V2: Rebase on top of Huang patches
---
 drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 209e701..80e333f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -667,6 +667,7 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
 	int			tmp;
 	u8			id[SPI_NOR_MAX_ID_LEN];
 	struct flash_info	*info;
+	u8			len;
 
 	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
 	if (tmp < 0) {
@@ -674,10 +675,15 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
 		return ERR_PTR(tmp);
 	}
 
-	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
-		info = (void *)spi_nor_ids[tmp].driver_data;
-		if (info->id_len) {
-			if (!memcmp(info->id, id, info->id_len))
+	/*
+	 * Start looking for entries with the longest ID, then go to the less
+	 * specific ones.
+	 */
+	for (len = SPI_NOR_MAX_ID_LEN; len > 0; len--) {
+		for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
+			info = (void *)spi_nor_ids[tmp].driver_data;
+			if (info->id_len == len &&
+			    !memcmp(info->id, id, info->id_len))
 				return &spi_nor_ids[tmp];
 		}
 	}
-- 
1.8.4.5
