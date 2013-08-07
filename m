Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72ur-0006rM-Eo
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:32:41 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 11/14] mtd: nand: pxa3xx: Add __maybe_unused keyword to
 enable_int()
Date: Wed,  7 Aug 2013 09:31:16 -0300
Message-Id: <1375878679-18098-12-git-send-email-ezequiel.garcia@free-electrons.com>
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

Now that we have added ARCH_HAS_DMA conditional the function
enable_int() may be unused. Declare it as __maybe_unused,
in order to remove the following warning, when the function is not used:

drivers/mtd/nand//pxa3xx_nand.c:343:24: warning: 'enable_int' defined
but not used [-Wunused-function]

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 523dd35..3952680 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -348,7 +348,7 @@ static void pxa3xx_nand_stop(struct pxa3xx_nand_info *info)
 	nand_writel(info, NDSR, NDSR_MASK);
 }
 
-static void enable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
+static void __maybe_unused enable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
 {
 	uint32_t ndcr;
 
-- 
1.8.1.5
