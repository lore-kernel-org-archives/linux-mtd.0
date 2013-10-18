From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v2 11/27] mtd: nand: pxa3xx: Disable OOB on arbitrary length
 commands
Date: Fri, 18 Oct 2013 20:02:38 -0300
Message-Id: <1382137374-21251-12-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
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

READID, STATUS and PARAM (aka ONFI read paramater page) don't read
the OOB area. Set the oob_size to zero and prevent it.
Also, add a comment clarifying the use of pxa3xx_set_datasize()
which is only applicable on data read/write commands.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 83ba036..95e2ce3 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -302,6 +302,11 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
 	nand_writel(info, NDTR1CS0, ndtr1);
 }
 
+/*
+ * Set the data and OOB size, depending on the selected
+ * spare and ECC configuration.
+ * Only applicable to READ0, READOOB and PAGEPROG commands.
+ */
 static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
 {
 	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;
@@ -661,6 +666,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 		info->ndcb1 = (column & 0xFF);
 		info->ndcb3 = 256;
 		info->data_size = 256;
+		info->oob_size = 0;
 		break;
 
 	case NAND_CMD_READID:
@@ -671,6 +677,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 		info->ndcb1 = (column & 0xFF);
 
 		info->data_size = 8;
+		info->oob_size = 0;
 		break;
 	case NAND_CMD_STATUS:
 		info->buf_count = 1;
@@ -679,6 +686,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 				| command;
 
 		info->data_size = 8;
+		info->oob_size = 0;
 		break;
 
 	case NAND_CMD_ERASE1:
-- 
1.8.1.5
