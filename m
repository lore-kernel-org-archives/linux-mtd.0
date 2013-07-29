Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3woA-00037t-Vs
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2013 23:24:56 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/13] mtd: nand: pxa3xx: Support command buffer #3
Date: Mon, 29 Jul 2013 20:24:13 -0300
Message-Id: <1375140263-2028-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, zonque@gmail.com, eric.miao@marvell.com,
 grinberg@compulab.co.il, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 computersforpeace@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some newer controllers support a fourth command buffer. This additional
command buffer allows to set an arbitrary length count, using the
NDCB3.NDLENCNT field, to perform non-standard length operations
such as the ONFI parameter page read.

In controllers without this register, the operation has no effect.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index b4d097f..23864ff 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -186,6 +186,7 @@ struct pxa3xx_nand_info {
 	uint32_t		ndcb0;
 	uint32_t		ndcb1;
 	uint32_t		ndcb2;
+	uint32_t		ndcb3;
 };
 
 static bool use_dma = 1;
@@ -485,6 +486,7 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 		nand_writel(info, NDCB0, info->ndcb0);
 		nand_writel(info, NDCB0, info->ndcb1);
 		nand_writel(info, NDCB0, info->ndcb2);
+		nand_writel(info, NDCB0, info->ndcb3);
 	}
 
 	/* clear NDSR to let the controller exit the IRQ */
@@ -543,6 +545,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	default:
 		info->ndcb1 = 0;
 		info->ndcb2 = 0;
+		info->ndcb3 = 0;
 		break;
 	}
 
-- 
1.8.1.5
