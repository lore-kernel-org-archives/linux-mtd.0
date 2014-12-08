Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy2NL-0004Ue-BG
 for linux-mtd@lists.infradead.org; Mon, 08 Dec 2014 17:45:36 +0000
Received: by mail-wg0-f52.google.com with SMTP id x12so4282295wgg.39
 for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2014 09:45:10 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: bcm47xxpart: lower minimal blocksize to 4Ki (from 64Ki)
Date: Mon,  8 Dec 2014 18:45:00 +0100
Message-Id: <1418060700-1977-1-git-send-email-zajec5@gmail.com>
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

Some devices like Netgear WNR1000v3 or WGR614v10 have partitions aligned
to 0x1000. Using bigger blocksize stopped us from detecting some parts.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 26a4a4a..4ad3928 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -94,8 +94,12 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	int last_trx_part = -1;
 	int possible_nvram_sizes[] = { 0x8000, 0xF000, 0x10000, };
 
-	if (blocksize <= 0x10000)
-		blocksize = 0x10000;
+	/*
+	 * Some really old flashes (like AT45DB*) had smaller erasesize-s, but
+	 * partitions were aligned to at least 0x1000 anyway.
+	 */
+	if (blocksize < 0x1000)
+		blocksize = 0x1000;
 
 	/* Alloc */
 	parts = kzalloc(sizeof(struct mtd_partition) * BCM47XXPART_MAX_PARTS,
-- 
1.8.4.5
