Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS8CN-0002cX-0Z
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 18:34:56 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH RESEND 1/2] mtd: nand: pxa3xx_nand: fix early spurious
 interrupt
Date: Wed, 19 Aug 2015 20:30:14 +0200
Message-Id: <1440009015-3765-2-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1440009015-3765-1-git-send-email-robert.jarzmik@free.fr>
References: <1440009015-3765-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the nand is first probe, and upon the first command start, the
status bits should be cleared before the interrupts are unmasked.

The bug is tricky : if the bootloader left a status bit set, the
unmasking of interrupts does trigger the interrupt handler before the
first command is issued, blocking the good behavior of the nand.

The same would happen if in pxa3xx_nand code flow a status bit is left,
and then a command is started.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 1259cc558ce9..d1a4c336de1d 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -439,8 +439,8 @@ static void pxa3xx_nand_start(struct pxa3xx_nand_info *info)
 	ndcr |= NDCR_ND_RUN;
 
 	/* clear status bits and run */
-	nand_writel(info, NDCR, 0);
 	nand_writel(info, NDSR, NDSR_MASK);
+	nand_writel(info, NDCR, 0);
 	nand_writel(info, NDCR, ndcr);
 }
 
-- 
2.1.4
