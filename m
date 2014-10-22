Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgyXa-0005Rc-QL
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 16:13:39 +0000
Received: by mail-wg0-f46.google.com with SMTP id l18so4100774wgh.5
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 09:13:16 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: allow NULL as chip name and try to auto detect
 it
Date: Wed, 22 Oct 2014 18:05:00 +0200
Message-Id: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This will allow spi-nor users to plainly use JEDEC to detect flash chip.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ee777a4..1facaac 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -937,13 +937,21 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (ret)
 		return ret;
 
-	id = spi_nor_match_id(name);
+	/* Try to auto-detect if chip name wasn't specified */
+	if (!name)
+		id = spi_nor_read_id(nor);
+	else
+		id = spi_nor_match_id(name);
 	if (!id)
 		return -ENOENT;
 
 	info = (void *)id->driver_data;
 
-	if (info->jedec_id) {
+	/*
+	 * If caller has specified name of flash model that can normally be
+	 * detected using JEDEC, let's verify it.
+	 */
+	if (name && info->jedec_id) {
 		const struct spi_device_id *jid;
 
 		jid = spi_nor_read_id(nor);
-- 
1.8.4.5
