Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvMZG-0008UA-15
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 08:42:50 +0000
Received: by mail-wg0-f41.google.com with SMTP id y19so13431159wgg.28
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 00:42:27 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH V2] mtd: spi-nor: allow NULL as chip name and try to auto
 detect it
Date: Mon,  1 Dec 2014 09:42:16 +0100
Message-Id: <1417423336-15255-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
References: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
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
V2: Rebase on top of:
6d7604e mtd: spi-nor: add support for s25fl128s
d928a25 mtd: spi-nor: remove the jedec_id/ext_id
09ffafb mtd: spi-nor: add id/id_len for flash_info{}
---
 drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0f4f2ba..afc58da 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -938,13 +938,21 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
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
 
-	if (info->id_len) {
+	/*
+	 * If caller has specified name of flash model that can normally be
+	 * detected using JEDEC, let's verify it.
+	 */
+	if (name && info->id_len) {
 		const struct spi_device_id *jid;
 
 		jid = spi_nor_read_id(nor);
-- 
1.8.4.5
