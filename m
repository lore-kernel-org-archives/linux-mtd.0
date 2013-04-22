Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUBed-0000L9-4j
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 07:59:18 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 6/8] mtd: parse out the ECC info for the full-id nand chips
Date: Mon, 22 Apr 2013 15:47:56 +0800
Message-ID: <1366616878-29481-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1366616878-29481-1-git-send-email-b32955@freescale.com>
References: <1366616878-29481-1-git-send-email-b32955@freescale.com>
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
index ba87e43..1611b7a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3231,6 +3231,8 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->cellinfo = id_data[2];
 		chip->chipsize = (uint64_t)type->chipsize << 20;
 		chip->options |= type->options;
+		chip->ecc_strength = NAND_ECC_STRENGTH(type->ecc_info);
+		chip->ecc_size = NAND_ECC_SIZE(type->ecc_info);
 
 		*busw = type->options & NAND_BUSWIDTH_16;
 
-- 
1.7.1
