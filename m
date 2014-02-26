Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIe3n-0005lM-3A
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 12:58:03 +0000
Received: by mail-ea0-f175.google.com with SMTP id z10so903291ead.34
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 04:57:40 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: bcm47xxpart: fix off by one in partitions limit
Date: Wed, 26 Feb 2014 13:57:20 +0100
Message-Id: <1393419440-26400-1-git-send-email-zajec5@gmail.com>
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

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index de1eb92..88802a8 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -91,7 +91,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		if (offset >= 0x2000000)
 			break;
 
-		if (curr_part > BCM47XXPART_MAX_PARTS) {
+		if (curr_part >= BCM47XXPART_MAX_PARTS) {
 			pr_warn("Reached maximum number of partitions, scanning stopped!\n");
 			break;
 		}
-- 
1.8.4.5
