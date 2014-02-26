Received: from mail-ea0-f169.google.com ([209.85.215.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIe8K-0005xT-FK
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 13:02:45 +0000
Received: by mail-ea0-f169.google.com with SMTP id d10so922474eaj.28
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 05:02:17 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH V2] mtd: bcm47xxpart: fix off by one in partitions limit
Date: Wed, 26 Feb 2014 14:02:06 +0100
Message-Id: <1393419726-26503-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1393419440-26400-1-git-send-email-zajec5@gmail.com>
References: <1393419440-26400-1-git-send-email-zajec5@gmail.com>
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
V2: Same fix for NVRAM looking code
---
 drivers/mtd/bcm47xxpart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index de1eb92..e388e69 100644
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
@@ -212,7 +212,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 
 	/* Look for NVRAM at the end of the last block. */
 	for (i = 0; i < ARRAY_SIZE(possible_nvram_sizes); i++) {
-		if (curr_part > BCM47XXPART_MAX_PARTS) {
+		if (curr_part >= BCM47XXPART_MAX_PARTS) {
 			pr_warn("Reached maximum number of partitions, scanning stopped!\n");
 			break;
 		}
-- 
1.8.4.5
