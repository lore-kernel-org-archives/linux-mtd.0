Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTtRi-0007ZX-5b
 for linux-mtd@lists.infradead.org; Sat, 29 Mar 2014 13:37:15 +0000
From: Gerhard Sittig <gsi@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 2/3] mtd: nand: re-introduce command bits masking
Date: Sat, 29 Mar 2014 14:36:23 +0100
Message-Id: <1396100184-7110-3-git-send-email-gsi@denx.de>
In-Reply-To: <1396100184-7110-1-git-send-email-gsi@denx.de>
References: <1396100184-7110-1-git-send-email-gsi@denx.de>
Cc: Gerhard Sittig <gsi@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>,
 Alexander Shiyan <shc_work@mail.ru>
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
or open coding if "READMODE" aka "READ0 exclusively" cannot be told from
"READPAGE" aka "the READ0 and READSTART sequence"

(the "READPAGE" and "READMODE" terms are coined in Micron datasheets)

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
 drivers/mtd/nand/nand_base.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 567620e81ce2..9ae99c1ba772 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -671,8 +671,14 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		command = NAND_CMD_READ0;
 	}
 
-	/* Command latch cycle */
-	chip->cmd_ctrl(mtd, command, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+	/*
+	 * Command latch cycle, send the command's lower bits to the chip,
+	 * followed by optional address specs and subsequent commands,
+	 * while the command's higher bits might modify the below
+	 * post-processing and delay logic
+	 */
+	chip->cmd_ctrl(mtd, command & 0xff,
+		       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 
 	if (column != -1 || page_addr != -1) {
 		int ctrl = NAND_CTRL_CHANGE | NAND_NCE | NAND_ALE;
-- 
1.7.10.4
