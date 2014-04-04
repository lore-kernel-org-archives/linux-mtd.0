Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW2Zv-00071I-Q3
 for linux-mtd@lists.infradead.org; Fri, 04 Apr 2014 11:46:37 +0000
From: Gerhard Sittig <gsi@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/3] mtd: nand: re-introduce command bits masking
Date: Fri,  4 Apr 2014 13:45:47 +0200
Message-Id: <1396611948-4523-3-git-send-email-gsi@denx.de>
In-Reply-To: <1396611948-4523-1-git-send-email-gsi@denx.de>
References: <1396611948-4523-1-git-send-email-gsi@denx.de>
Cc: Alexander Shiyan <shc_work@mail.ru>, David Mosberger <davidm@egauge.net>,
 Gerhard Sittig <gsi@denx.de>, Pekon Gupta <pekon@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

re-introduce the mask operation which was removed in fb066adadd22
"mtd: nand_base: Removed unnecessary command masking" after the DEPLETE1
command has gone and the masking no longer was strictly required

keeping the operation here is cheap and does not influence behaviour as
long as all passed in command opcodes are within a byte's range

pending introduction of on-die-ECC support needs a "READMODE" command,
which shares a lot of the READ0 code path, yet would require duplication
or open coding if "READMODE" (aka "READ0 exclusively") cannot be told from
"READPAGE" (aka "the READ0 and READSTART sequence")

(the "READPAGE" and "READMODE" terms are coined in Micron datasheets)

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
changes in v2:
- mask command bits in nand_command() as well, such that large page and
  non-large page configurations can accept all defined commands
- reword comments and align their nand_command() and nand_command_lp()
  versions

 drivers/mtd/nand/nand_base.c |   19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 567620e81ce2..7108191b1598 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -564,7 +564,12 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	register struct nand_chip *chip = mtd->priv;
 	int ctrl = NAND_CTRL_CLE | NAND_CTRL_CHANGE;
 
-	/* Write out the command to the device */
+	/*
+	 * Command latch cycle, write out the command's lower bits
+	 * to the device, followed by optional address specs and
+	 * subsequent commands, while the command's higher bits
+	 * might modify the below logic of post-operation and delays
+	 */
 	if (command == NAND_CMD_SEQIN) {
 		int readcmd;
 
@@ -582,7 +587,7 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 		chip->cmd_ctrl(mtd, readcmd, ctrl);
 		ctrl &= ~NAND_CTRL_CHANGE;
 	}
-	chip->cmd_ctrl(mtd, command, ctrl);
+	chip->cmd_ctrl(mtd, command & 0xff, ctrl);
 
 	/* Address cycle, when necessary */
 	ctrl = NAND_CTRL_ALE | NAND_CTRL_CHANGE;
@@ -671,8 +676,14 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		command = NAND_CMD_READ0;
 	}
 
-	/* Command latch cycle */
-	chip->cmd_ctrl(mtd, command, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+	/*
+	 * Command latch cycle, write out the command's lower bits
+	 * to the device, followed by optional address specs and
+	 * subsequent commands, while the command's higher bits
+	 * might modify the below logic of post-operation and delays
+	 */
+	chip->cmd_ctrl(mtd, command & 0xff,
+		       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 
 	if (column != -1 || page_addr != -1) {
 		int ctrl = NAND_CTRL_CHANGE | NAND_NCE | NAND_ALE;
-- 
1.7.10.4
