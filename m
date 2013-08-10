Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8ExO-0002a1-8f
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 19:36:12 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 05/15] mtd: nand: pxa3xx: Support command buffer #3
Date: Sat, 10 Aug 2013 16:34:55 -0300
Message-Id: <1376163305-5591-6-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
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

Some newer controllers support a fourth command buffer. This additional
command buffer allows to set an arbitrary length count, using the
NDCB3.NDLENCNT field, to perform non-standard length operations
such as the ONFI parameter page read.

In controllers without this register, the operation has no effect.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Tested-by: Daniel Mack <zonque@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 3a3e042..83a7187 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -197,6 +197,7 @@ struct pxa3xx_nand_info {
 	uint32_t		ndcb0;
 	uint32_t		ndcb1;
 	uint32_t		ndcb2;
+	uint32_t		ndcb3;
 };
 
 static bool use_dma = 1;
@@ -496,6 +497,10 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 		nand_writel(info, NDCB0, info->ndcb0);
 		nand_writel(info, NDCB0, info->ndcb1);
 		nand_writel(info, NDCB0, info->ndcb2);
+
+		/* NDCB3 register is available in NFCv2 (Armada 370/XP SoC) */
+		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
+			nand_writel(info, NDCB0, info->ndcb3);
 	}
 
 	/* clear NDSR to let the controller exit the IRQ */
@@ -554,6 +559,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	default:
 		info->ndcb1 = 0;
 		info->ndcb2 = 0;
+		info->ndcb3 = 0;
 		break;
 	}
 
-- 
1.8.1.5
