Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72uS-0006mY-ER
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:32:13 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 05/14] mtd: nand: pxa3xx: Use 'length override' in ONFI
 paramater page read
Date: Wed,  7 Aug 2013 09:31:10 -0300
Message-Id: <1375878679-18098-6-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ONFI command 'parameter page read' needs a non-standard length.
Therefore, we enable the 'length override' field in NDCB0 and set
a non-zero 'length count' in NDCB3.

Additionally, the 'spare enable' bit must be disabled for any command
that sets a non-zero 'length count' in NDCB3.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 65e3ee9..d1e8ddb3 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -80,6 +80,7 @@
 #define NDSR_RDDREQ		(0x1 << 1)
 #define NDSR_WRCMDREQ		(0x1)
 
+#define NDCB0_LEN_OVRD		(0x1 << 28)
 #define NDCB0_ST_ROW_EN         (0x1 << 26)
 #define NDCB0_AUTO_RS		(0x1 << 25)
 #define NDCB0_CSEL		(0x1 << 24)
@@ -553,6 +554,9 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	case NAND_CMD_READOOB:
 		pxa3xx_set_datasize(info);
 		break;
+	case NAND_CMD_PARAM:
+		info->use_spare = 0;
+		break;
 	case NAND_CMD_SEQIN:
 		exec_cmd = 0;
 		break;
@@ -628,8 +632,10 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 		info->buf_count = 256;
 		info->ndcb0 |= NDCB0_CMD_TYPE(0)
 				| NDCB0_ADDR_CYC(1)
+				| NDCB0_LEN_OVRD
 				| cmd;
 		info->ndcb1 = (column & 0xFF);
+		info->ndcb3 = 256;
 		info->data_size = 256;
 		break;
 
-- 
1.8.1.5
