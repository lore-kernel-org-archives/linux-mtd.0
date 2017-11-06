Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eBpYI-0000Qv-8v
 for linux-mtd@lists.infradead.org; Mon, 06 Nov 2017 22:07:32 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: nand: fix interpretation of NAND_CMD_NONE in core
 ->cmdfunc()
Date: Mon,  6 Nov 2017 23:07:04 +0100
Message-Id: <20171106220704.2340-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some drivers (like nand_hynix.c) call ->cmdfunc() with NAND_CMD_NONE and
an address byte in order to only send one address cycle to the flash
chip.

Fix the current implementation that actually send NAND_CMD_NONE, which
is defined as -1 (cast in a u8), thus sending an 0xFF command to the
chip, which is actually a reset command.

Add the condition in both nand_command() and nand_command_lp() to avoid
calling ->cmd_ctrl() in that case.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c63e4a88a653..851f25383622 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -710,7 +710,8 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 		chip->cmd_ctrl(mtd, readcmd, ctrl);
 		ctrl &= ~NAND_CTRL_CHANGE;
 	}
-	chip->cmd_ctrl(mtd, command, ctrl);
+	if (command != NAND_CMD_NONE)
+		chip->cmd_ctrl(mtd, command, ctrl);
 
 	/* Address cycle, when necessary */
 	ctrl = NAND_CTRL_ALE | NAND_CTRL_CHANGE;
@@ -831,7 +832,9 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	}
 
 	/* Command latch cycle */
-	chip->cmd_ctrl(mtd, command, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+	if (command != NAND_CMD_NONE)
+		chip->cmd_ctrl(mtd, command,
+			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 
 	if (column != -1 || page_addr != -1) {
 		int ctrl = NAND_CTRL_CHANGE | NAND_NCE | NAND_ALE;
-- 
2.11.0
