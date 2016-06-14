Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCpDp-0001fE-D6
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 14:21:41 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 2/2] mtd: nand: timings: Reorder tRR_min def in mode 0
Date: Tue, 14 Jun 2016 16:21:07 +0200
Message-Id: <1465914067-29736-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465914067-29736-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465914067-29736-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the ONFI spec, the tRR_min entry is defined before the tRST_max one.
Reoder the definition to make it easier to review.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_timings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
index c0941d5..30119c5 100644
--- a/drivers/mtd/nand/nand_timings.c
+++ b/drivers/mtd/nand/nand_timings.c
@@ -42,9 +42,9 @@ static const struct nand_sdr_timings onfi_sdr_timings[] = {
 		.tRHZ_max = 200000,
 		.tRLOH_min = 0,
 		.tRP_min = 50000,
+		.tRR_min = 40000,
 		.tRST_max = 250000000000ULL,
 		.tWB_max = 200000,
-		.tRR_min = 40000,
 		.tWC_min = 100000,
 		.tWH_min = 30000,
 		.tWHR_min = 120000,
-- 
2.7.4
