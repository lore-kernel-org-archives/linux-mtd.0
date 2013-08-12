Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8vig-0007sp-PX
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 17:15:55 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 05/14] mtd: nand: pxa3xx: Support command buffer #3
Date: Mon, 12 Aug 2013 14:14:50 -0300
Message-Id: <1376327699-7973-6-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
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

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Tested-by: Daniel Mack <zonque@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 3a3e042..d46adb1 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -197,6 +197,7 @@ struct pxa3xx_nand_info {
 	uint32_t		ndcb0;
 	uint32_t		ndcb1;
 	uint32_t		ndcb2;
+	uint32_t		ndcb3;
 };
 
 static bool use_dma = 1;
@@ -493,9 +494,22 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 		nand_writel(info, NDSR, NDSR_WRCMDREQ);
 		status &= ~NDSR_WRCMDREQ;
 		info->state = STATE_CMD_HANDLE;
+
+		/*
+		 * Command buffer registers NDCB{0-2} (and optionally NDCB3)
+		 * must be loaded by writing directly either 12 or 16
+		 * bytes directly to NDCB0, four bytes at a time.
+		 *
+		 * Direct write access to NDCB1, NDCB2 and NDCB3 is ignored
+		 * but each NDCBx register can be read.
+		 */
 		nand_writel(info, NDCB0, info->ndcb0);
 		nand_writel(info, NDCB0, info->ndcb1);
 		nand_writel(info, NDCB0, info->ndcb2);
+
+		/* NDCB3 register is available in NFCv2 (Armada 370/XP SoC) */
+		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
+			nand_writel(info, NDCB0, info->ndcb3);
 	}
 
 	/* clear NDSR to let the controller exit the IRQ */
@@ -554,6 +568,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	default:
 		info->ndcb1 = 0;
 		info->ndcb2 = 0;
+		info->ndcb3 = 0;
 		break;
 	}
 
-- 
1.8.1.5
