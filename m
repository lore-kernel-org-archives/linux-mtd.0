Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIeZt-00071n-D1
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 13:31:14 +0000
Received: by mail-ea0-f169.google.com with SMTP id d10so945102eaj.0
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 05:30:50 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: bcm47xxpart: avoid overflowing when registering trx
Date: Wed, 26 Feb 2014 14:30:34 +0100
Message-Id: <1393421434-23561-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our code parsing "trx" header registers few partitions at once (in one
loop iteration). Add extra check in that place.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index e388e69..23d7122 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -147,6 +147,11 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 
 		/* TRX */
 		if (buf[0x000 / 4] == TRX_MAGIC) {
+			if (BCM47XXPART_MAX_PARTS - curr_part < 4) {
+				pr_warn("Not enough partitions left to register trx, scanning stopped!\n");
+				break;
+			}
+
 			trx = (struct trx_header *)buf;
 
 			trx_part = curr_part;
-- 
1.8.4.5
