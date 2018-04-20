Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RN4-0007mc-1U
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:24 +0000
Received: by mail-wr0-x242.google.com with SMTP id s18-v6so20638598wrg.9
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:16 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: [PATCH 13/18] mtd: rawnand: gpmi: explicit delays are not needed
Date: Fri, 20 Apr 2018 10:19:41 +0200
Message-Id: <20180420081946.16088-14-sam.lefebvre@essensium.com>
In-Reply-To: <20180420081946.16088-1-sam.lefebvre@essensium.com>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

gpmi-nand implements the dev_ready function, so explicit delays are not
needed for the RESET and READ0 commands. Therefore, the
gpmi_wait_status_ready() function and the includes it brings in are not
needed.

The RESET command just falls through to the nand_wait_ready() call.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 40 ------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index ccde6500f981..8531bc8d531d 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -25,7 +25,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mtd/partitions.h>
-#include <linux/nmi.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include "gpmi-nand.h"
@@ -1093,25 +1092,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	return max_bitflips;
 }
 
-static void gpmi_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
-{
-	register struct nand_chip *chip = mtd_to_nand(mtd);
-	int ret;
-
-	timeo = jiffies + msecs_to_jiffies(timeo);
-	do {
-		u8 status;
-
-		ret = nand_read_data_op(chip, &status, sizeof(status), true);
-		if (ret)
-			return;
-
-		if (status & NAND_STATUS_READY)
-			break;
-		touch_softlockup_watchdog();
-	} while (time_before(jiffies, timeo));
-};
-
 /**
  * gpmi_nand_command - Send command to NAND device
  * @mtd: MTD device structure
@@ -1212,18 +1192,6 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 		}
 		break;
 
-	case NAND_CMD_RESET:
-		if (chip->dev_ready)
-			break;
-		udelay(chip->chip_delay);
-		chip->cmd_ctrl(mtd, NAND_CMD_STATUS,
-			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-			       NAND_NCE | NAND_CTRL_CHANGE);
-		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
-		gpmi_wait_status_ready(mtd, 250);
-		return;
-
 	case NAND_CMD_RNDOUT:
 		if (is_lp) {
 			/* No ready / busy check necessary */
@@ -1254,14 +1222,6 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 		/* Read commands must wait */
 		break;
 	}
-	/*
-	 * If we don't have access to the busy pin, we apply the given command
-	 * delay.
-	 */
-	if (!chip->dev_ready) {
-		udelay(chip->chip_delay);
-		return;
-	}
 
 	/*
 	 * Apply this short delay always to ensure that we do wait tWB in
-- 
2.14.1
