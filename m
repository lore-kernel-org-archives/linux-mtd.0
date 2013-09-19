Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMghC-000174-NV
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:20 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 13/21] mtd: nand: pxa3xx: Split prepare_command_pool() in two
 stages
Date: Thu, 19 Sep 2013 13:01:37 -0300
Message-Id: <1379606505-2529-14-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit splits the prepare_command_pool() function into two
stages: prepare_start_command() / prepare_set_command().

This is a preparation patch without any functionality changes,
and is meant to allow support fir multiple page reading/writing
operations.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 44 ++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index ecf99ef..562b968 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -608,18 +608,8 @@ static void set_command_address(struct pxa3xx_nand_info *info,
 	}
 }
 
-static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
-		uint16_t column, int page_addr)
+static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 {
-	int addr_cycle, exec_cmd;
-	struct pxa3xx_nand_host *host;
-	struct mtd_info *mtd;
-
-	host = info->host[info->cs];
-	mtd = host->mtd;
-	addr_cycle = 0;
-	exec_cmd = 1;
-
 	/* reset data and oob column point to handle data */
 	info->buf_start		= 0;
 	info->buf_count		= 0;
@@ -629,10 +619,6 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	info->use_dma		= (use_dma) ? 1 : 0;
 	info->retcode		= ERR_NONE;
 	info->ndcb3		= 0;
-	if (info->cs != 0)
-		info->ndcb0 = NDCB0_CSEL;
-	else
-		info->ndcb0 = 0;
 
 	switch (command) {
 	case NAND_CMD_READ0:
@@ -644,14 +630,32 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	case NAND_CMD_PARAM:
 		info->use_spare = 0;
 		break;
-	case NAND_CMD_SEQIN:
-		exec_cmd = 0;
-		break;
 	default:
 		info->ndcb1 = 0;
 		info->ndcb2 = 0;
 		break;
 	}
+}
+
+static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
+		uint16_t column, int page_addr)
+{
+	int addr_cycle, exec_cmd;
+	struct pxa3xx_nand_host *host;
+	struct mtd_info *mtd;
+
+	host = info->host[info->cs];
+	mtd = host->mtd;
+	addr_cycle = 0;
+	exec_cmd = 1;
+
+	if (info->cs != 0)
+		info->ndcb0 = NDCB0_CSEL;
+	else
+		info->ndcb0 = 0;
+
+	if (command == NAND_CMD_SEQIN)
+		exec_cmd = 0;
 
 	addr_cycle = NDCB0_ADDR_CYC(host->row_addr_cycles
 				    + host->col_addr_cycles);
@@ -789,8 +793,10 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		nand_writel(info, NDTR1CS0, info->ndtr1cs0);
 	}
 
+	prepare_start_command(info, command);
+
 	info->state = STATE_PREPARED;
-	exec_cmd = prepare_command_pool(info, command, column, page_addr);
+	exec_cmd = prepare_set_command(info, command, column, page_addr);
 	if (exec_cmd) {
 		init_completion(&info->cmd_complete);
 		init_completion(&info->dev_ready);
-- 
1.8.1.5
