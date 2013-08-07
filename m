Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72uN-0006lq-Ee
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:32:08 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 03/14] mtd: nand: pxa3xx: Allow to set/clear the 'spare
 enable' field
Date: Wed,  7 Aug 2013 09:31:08 -0300
Message-Id: <1375878679-18098-4-git-send-email-ezequiel.garcia@free-electrons.com>
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

Some commands (such as the ONFI parameter page read) need to
clear the 'spare enable' bit. This commit allows to set/clear
depending on the prepared command, instead of having it always
set.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index e3cd903..a277def 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -185,6 +185,7 @@ struct pxa3xx_nand_info {
 	int			cs;
 	int			use_ecc;	/* use HW ECC ? */
 	int			use_dma;	/* use DMA ? */
+	int			use_spare;	/* use spare ? */
 	int			is_ready;
 
 	unsigned int		page_size;	/* page size of attached chip */
@@ -325,6 +326,11 @@ static void pxa3xx_nand_start(struct pxa3xx_nand_info *info)
 	else
 		ndcr &= ~NDCR_DMA_EN;
 
+	if (info->use_spare)
+		ndcr |= NDCR_SPARE_EN;
+	else
+		ndcr &= ~NDCR_SPARE_EN;
+
 	ndcr |= NDCR_ND_RUN;
 
 	/* clear status bits and run */
@@ -526,6 +532,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	info->buf_count		= 0;
 	info->oob_size		= 0;
 	info->use_ecc		= 0;
+	info->use_spare		= 1;
 	info->use_dma		= (use_dma) ? 1 : 0;
 	info->is_ready		= 0;
 	info->retcode		= ERR_NONE;
-- 
1.8.1.5
