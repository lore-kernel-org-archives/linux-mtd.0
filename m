Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUZBE-0003ad-NA
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 09:06:31 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V3 7/9] mtd: parse out the ECC info for the full-id nand chips
Date: Tue, 23 Apr 2013 16:54:55 +0800
Message-ID: <1366707297-31309-8-git-send-email-b32955@freescale.com>
In-Reply-To: <1366707297-31309-1-git-send-email-b32955@freescale.com>
References: <1366707297-31309-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Parse out the ECC information for the full-id nand chips.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8b2a792..b873220 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3249,6 +3249,8 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->cellinfo = id_data[2];
 		chip->chipsize = (uint64_t)type->chipsize << 20;
 		chip->options |= type->options;
+		chip->ecc_strength = NAND_ECC_STRENGTH(type->ecc_info);
+		chip->ecc_size = NAND_ECC_SIZE(type->ecc_info);
 
 		*busw = type->options & NAND_BUSWIDTH_16;
 
-- 
1.7.1
