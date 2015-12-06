Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5Wbz-0005EP-83
 for linux-mtd@lists.infradead.org; Sun, 06 Dec 2015 10:32:11 +0000
Received: by lbblt2 with SMTP id lt2so41942100lbb.3
 for <linux-mtd@lists.infradead.org>; Sun, 06 Dec 2015 02:31:48 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] mtd: bcm47xxpart: don't fail because of bit-flips
Date: Sun,  6 Dec 2015 11:31:38 +0100
Message-Id: <1449397898-28703-1-git-send-email-zajec5@gmail.com>
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

Bit-flip errors may occur on NAND flashes and are harmless. Handle them
gracefully as read content is still reliable and can be parsed.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 4450e74..1ab3451 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -66,11 +66,13 @@ static const char *bcm47xxpart_trx_data_part_name(struct mtd_info *master,
 {
 	uint32_t buf;
 	size_t bytes_read;
+	int err;
 
-	if (mtd_read(master, offset, sizeof(buf), &bytes_read,
-		     (uint8_t *)&buf) < 0) {
-		pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
-			offset);
+	err  = mtd_read(master, offset, sizeof(buf), &bytes_read,
+			(uint8_t *)&buf);
+	if (err && !mtd_is_bitflip(err)) {
+		pr_err("mtd_read error while parsing (offset: 0x%X): %d\n",
+			offset, err);
 		goto out_default;
 	}
 
@@ -95,6 +97,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	int trx_part = -1;
 	int last_trx_part = -1;
 	int possible_nvram_sizes[] = { 0x8000, 0xF000, 0x10000, };
+	int err;
 
 	/*
 	 * Some really old flashes (like AT45DB*) had smaller erasesize-s, but
@@ -128,10 +131,11 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Read beginning of the block */
-		if (mtd_read(master, offset, BCM47XXPART_BYTES_TO_READ,
-			     &bytes_read, (uint8_t *)buf) < 0) {
-			pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
-			       offset);
+		err = mtd_read(master, offset, BCM47XXPART_BYTES_TO_READ,
+			       &bytes_read, (uint8_t *)buf);
+		if (err && !mtd_is_bitflip(err)) {
+			pr_err("mtd_read error while parsing (offset: 0x%X): %d\n",
+			       offset, err);
 			continue;
 		}
 
@@ -254,10 +258,11 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Read middle of the block */
-		if (mtd_read(master, offset + 0x8000, 0x4,
-			     &bytes_read, (uint8_t *)buf) < 0) {
-			pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
-			       offset);
+		err = mtd_read(master, offset + 0x8000, 0x4, &bytes_read,
+			       (uint8_t *)buf);
+		if (err && !mtd_is_bitflip(err)) {
+			pr_err("mtd_read error while parsing (offset: 0x%X): %d\n",
+			       offset, err);
 			continue;
 		}
 
@@ -277,10 +282,11 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		offset = master->size - possible_nvram_sizes[i];
-		if (mtd_read(master, offset, 0x4, &bytes_read,
-			     (uint8_t *)buf) < 0) {
-			pr_err("mtd_read error while reading at offset 0x%X!\n",
-			       offset);
+		err = mtd_read(master, offset, 0x4, &bytes_read,
+			       (uint8_t *)buf);
+		if (err && !mtd_is_bitflip(err)) {
+			pr_err("mtd_read error while reading (offset 0x%X): %d\n",
+			       offset, err);
 			continue;
 		}
 
-- 
1.8.4.5
