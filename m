Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPYrV-0005zL-FQ
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2015 16:26:46 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] mtd: nand: pxa3xx-nand: fix random command timeouts
Date: Wed, 12 Aug 2015 18:22:18 +0200
Message-Id: <1439396538-13298-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When 2 commands are submitted in a row, and the second is very quick,
the completion of the second command might never come. This happens
especially if the second command is quick, such as a status read after
an erase.

The issue is that in the interrupt handler, the status bits are cleared
after the new command is issued. There is a small temporal window where
this happens :
 - the previous command has set the command done bit
 - the ready for a command bit is set
 - the handler submits the next command
   - just then, the command completes, and the command done bit is still
     set
 - the handler clears the "previous" command done bit
 - the handler exits

In this flow, the "command done" of the next command will never trigger
a new interrupt to finish the status command, as it was cleared for both
commands.

Fix this by clearing the status bit before submitting a new command.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/nand/pxa3xx_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index b0737aec7caf..718097414b9c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -687,8 +687,10 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 		is_ready = 1;
 	}
 
+	/* clear NDSR to let the controller exit the IRQ */
+	nand_writel(info, NDSR, status);
+
 	if (status & NDSR_WRCMDREQ) {
-		nand_writel(info, NDSR, NDSR_WRCMDREQ);
 		status &= ~NDSR_WRCMDREQ;
 		info->state = STATE_CMD_HANDLE;
 
@@ -709,8 +711,6 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 			nand_writel(info, NDCB0, info->ndcb3);
 	}
 
-	/* clear NDSR to let the controller exit the IRQ */
-	nand_writel(info, NDSR, status);
 	if (is_completed)
 		complete(&info->cmd_complete);
 	if (is_ready)
-- 
2.1.4
