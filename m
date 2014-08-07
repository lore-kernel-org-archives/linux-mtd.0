Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFRGE-0003SG-H2
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 17:13:55 +0000
Received: by mail-wi0-f176.google.com with SMTP id bs8so11049832wib.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2014 10:13:32 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: spi-nor: allow NULL as spi_device_id in spi_nor_scan
Date: Thu,  7 Aug 2014 19:13:21 +0200
Message-Id: <1407431601-22312-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now we allow customized read_id handlers we should allow passing NULL
as a struct spi_device_id pointer. In such case we should simply make
use of the read_id callback and let driver read the flash ID.
At some point we may try to remove this argument completely.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
This is based on top of
mtd: move support for struct flash_platform_data's "type" into m25p80
---
 drivers/mtd/spi-nor/spi-nor.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d733b16..45610b2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -906,29 +906,23 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	if (ret)
 		return ret;
 
-	info = (void *)id->driver_data;
-
-	if (info->jedec_id) {
-		const struct spi_device_id *jid;
-
-		jid = nor->read_id(nor);
-		if (IS_ERR(jid)) {
-			return PTR_ERR(jid);
-		} else if (jid != id) {
-			/*
-			 * JEDEC knows better, so overwrite platform ID. We
-			 * can't trust partitions any longer, but we'll let
-			 * mtd apply them anyway, since some partitions may be
-			 * marked read-only, and we don't want to lose that
-			 * information, even if it's not 100% accurate.
-			 */
-			dev_warn(dev, "found %s, expected %s\n",
-				 jid->name, id->name);
-			id = jid;
-			info = (void *)jid->driver_data;
+	if (id) {
+		info = (void *)id->driver_data;
+		if (info->jedec_id) {
+			dev_warn(dev,
+				 "passed SPI device ID (%s) contains JEDEC, ignoring it, driver should be fixed!\n",
+				 id->name);
+			id = NULL;
 		}
 	}
 
+	if (!id) {
+		id = nor->read_id(nor);
+		if (IS_ERR(id))
+			return PTR_ERR(id);
+	}
+	info = (void *)id->driver_data;
+
 	mutex_init(&nor->lock);
 
 	/*
-- 
1.8.4.5
