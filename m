Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtOuj-0004dR-6M
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 21:44:22 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH RESEND 1/3] mtd: nand: pxa3xx: Clear need_wait flag when
 starting a command
Date: Wed, 18 Dec 2013 18:44:08 -0300
Message-Id: <1387403050-23965-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1387403050-23965-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1387403050-23965-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 Seif Mazareeb <seif@marvell.com>, Simon Guinot <sguinot@lacie.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently the driver assumes all commands will eventually trigger a RnB
transition, and thus a "device is ready" IRQ.

This assumption means that on every issued command, the dev_ready completion
handler is init'ed and the need_wait flag is set.

However this is incorrect: some commands (such as NAND_CMD_STATUS) don't
make the device 'busy' and thus a RnB transition never occurs.
Given, the NAND core never calls waitfunc() after such commands, this
is not a problem.

Therefore, it's possible to only clear the need_wait flag on every command
that is started.

This fixes a current bug that can be reproduced on PXA boards by writing
blank (all 0xff'ed) to a page:

  1. The kernel issues NAND_CMD_STATUS and sets need_wait=1. The flag
     won't be cleared for this command since no RnB transition is
     involved.

  2. NAND_CMD_PAGEPROG is issued but since the data is blank, the driver
     decides not to execute the command (and no IRQ activity is
     involved).

  3. The NAND core calls waitfunc() and waits for the dev_ready
     completion, which will never end since the device _is_ already ready.

Tested-by: Arnaud Ebalard <arno@natisbad.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 8f38abd..9828033 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -690,6 +690,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 	info->retcode		= ERR_NONE;
 	info->ecc_err_cnt	= 0;
 	info->ndcb3		= 0;
+	info->need_wait		= 0;
 
 	switch (command) {
 	case NAND_CMD_READ0:
-- 
1.8.1.5
