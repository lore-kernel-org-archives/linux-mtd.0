Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RNA-0001GW-Eq
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:26 +0000
Received: by mail-wr0-x241.google.com with SMTP id o15-v6so20639119wro.11
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:14 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: [PATCH 12/18] mtd: rawnand: gpmi: gpmi_ccs_delay() is not needed
Date: Fri, 20 Apr 2018 10:19:40 +0200
Message-Id: <20180420081946.16088-13-sam.lefebvre@essensium.com>
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

The controller already takes care of waiting for tCCS when the RNDIN
or RNDOUT command is sent. That is, the NAND_WAIT_TCCS option is not
set for gpmi-nand. Therefore, the gpmi_ccs_delay() calls are not
needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 69bdee0ca679..ccde6500f981 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1112,25 +1112,6 @@ static void gpmi_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
 	} while (time_before(jiffies, timeo));
 };
 
-static void gpmi_ccs_delay(struct nand_chip *chip)
-{
-	/*
-	 * The controller already takes care of waiting for tCCS when the RNDIN
-	 * or RNDOUT command is sent, return directly.
-	 */
-	if (!(chip->options & NAND_WAIT_TCCS))
-		return;
-
-	/*
-	 * Wait tCCS_min if it is correctly defined, otherwise wait 500ns
-	 * (which should be safe for all NANDs).
-	 */
-	if (chip->setup_data_interface)
-		ndelay(chip->data_interface.timings.sdr.tCCS_min / 1000);
-	else
-		ndelay(500);
-}
-
 /**
  * gpmi_nand_command - Send command to NAND device
  * @mtd: MTD device structure
@@ -1227,7 +1208,6 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 
 	case NAND_CMD_RNDIN:
 		if (is_lp) {
-			gpmi_ccs_delay(chip);
 			return;
 		}
 		break;
@@ -1251,8 +1231,6 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 			chip->cmd_ctrl(mtd, NAND_CMD_NONE,
 				NAND_NCE | NAND_CTRL_CHANGE);
-
-			gpmi_ccs_delay(chip);
 			return;
 		}
 		break;
-- 
2.14.1
