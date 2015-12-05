Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a51Me-0005hw-QB
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 01:10:17 +0000
Received: by lffu14 with SMTP id u14so122786482lff.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 17:09:53 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] mtd: bcm47xxpart: limit scanned flash area on BCM47XX (MIPS)
 only
Date: Sat,  5 Dec 2015 02:09:43 +0100
Message-Id: <1449277783-7369-1-git-send-email-zajec5@gmail.com>
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

We allowed using bcm47xxpart on BCM5301X arch with commit:
9e3afa5f5c7 ("mtd: bcm47xxpart: allow enabling on ARCH_BCM_5301X")

BCM5301X devices may contain some partitions in higher memory, e.g.
Netgear R8000 has board_data at 0x2600000. To detect them we should
use size limit on MIPS only.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 92a6dd1..4450e74 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -118,8 +118,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	/* Parse block by block looking for magics */
 	for (offset = 0; offset <= master->size - blocksize;
 	     offset += blocksize) {
-		/* Nothing more in higher memory */
-		if (offset >= 0x2000000)
+		/* Nothing more in higher memory on BCM47XX (MIPS) */
+		if (config_enabled(CONFIG_BCM47XX) && offset >= 0x2000000)
 			break;
 
 		if (curr_part >= BCM47XXPART_MAX_PARTS) {
-- 
1.8.4.5
