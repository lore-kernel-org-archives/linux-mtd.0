Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RNE-0007nk-4G
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:36 +0000
Received: by mail-wr0-x244.google.com with SMTP id s18-v6so20638810wrg.9
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:18 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: [PATCH 14/18] mtd: rawnand: gpmi: no explicit wait is needed after
 sending a command
Date: Fri, 20 Apr 2018 10:19:42 +0200
Message-Id: <20180420081946.16088-15-sam.lefebvre@essensium.com>
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

Commands are send using DMA, and the DMA already waits for the
ready/busy signal from the NAND. So no explicit delay and call to
nand_wait_ready() is needed.

This makes it possible to simplify the switch in gpmi_nand_command() a
lot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 62 +++++++-----------------------
 1 file changed, 13 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 8531bc8d531d..5ae5713090a4 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -19,7 +19,6 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched/task_stack.h>
 #include <linux/interrupt.h>
@@ -1163,44 +1162,20 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 		if (chip->options & NAND_ROW_ADDR_3)
 			chip->cmd_ctrl(mtd, page_addr >> 16, ctrl);
 	}
-	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
 
-	/*
-	 * Program and erase have their own busy handlers status, sequential
-	 * in and status need no delay.
-	 */
-	switch (command) {
+	/* This starts the DMA for the command and waits for it to finish. */
+	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
 
-	case NAND_CMD_NONE:
-	case NAND_CMD_PAGEPROG:
-	case NAND_CMD_ERASE1:
-	case NAND_CMD_ERASE2:
-	case NAND_CMD_SEQIN:
-	case NAND_CMD_STATUS:
-	case NAND_CMD_READID:
-	case NAND_CMD_SET_FEATURES:
+	if (!is_lp)
 		return;
 
-	case NAND_CMD_CACHEDPROG:
-		if (is_lp)
-			return;
-		break;
-
-	case NAND_CMD_RNDIN:
-		if (is_lp) {
-			return;
-		}
-		break;
-
+	switch (command) {
 	case NAND_CMD_RNDOUT:
-		if (is_lp) {
-			/* No ready / busy check necessary */
-			chip->cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
-				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-			chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-				NAND_NCE | NAND_CTRL_CHANGE);
-			return;
-		}
+		/* No ready / busy check necessary */
+		chip->cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
+			NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
+			NAND_NCE | NAND_CTRL_CHANGE);
 		break;
 
 	case NAND_CMD_READ0:
@@ -1213,23 +1188,12 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 		if (column == -1 && page_addr == -1)
 			return;
 
-		if (is_lp) {
-			chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
-				       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-			chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-				       NAND_NCE | NAND_CTRL_CHANGE);
-		}
-		/* Read commands must wait */
+		chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
+				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
+				NAND_NCE | NAND_CTRL_CHANGE);
 		break;
 	}
-
-	/*
-	 * Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine.
-	 */
-	ndelay(100);
-
-	nand_wait_ready(mtd);
 }
 
 
-- 
2.14.1
