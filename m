Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJdd7-0004kB-Ip
 for linux-mtd@lists.infradead.org; Tue, 19 Aug 2014 07:14:54 +0000
Received: by mail-wi0-f176.google.com with SMTP id bs8so4888068wib.15
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 00:14:31 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 4/4] mtd: bcm47xxnflash: NAND_CMD_RESET support
Date: Tue, 19 Aug 2014 09:14:16 +0200
Message-Id: <1408432456-27280-4-git-send-email-zajec5@gmail.com>
In-Reply-To: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
References: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
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

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index 30df67a..82844ef 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <linux/bcma/bcma.h>
 
 /* Broadcom uses 1'000'000 but it seems to be too many. Tests on WNDR4500 has
@@ -226,7 +227,10 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 
 	switch (command) {
 	case NAND_CMD_RESET:
-		pr_warn("Chip reset not implemented yet\n");
+		nand_chip->cmd_ctrl(mtd, command, NAND_CTRL_CLE);
+
+		ndelay(100);
+		nand_wait_ready(mtd);
 		break;
 	case NAND_CMD_READID:
 		ctlcode = NCTL_CSA | 0x01000000 | NCTL_CMD1W | NCTL_CMD0;
-- 
1.8.4.5
