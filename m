Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOjEf-0005kp-ER
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 07:10:10 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4 03/12] mtd: nand: add the "bits per cell" info for legacy
 ID NAND
Date: Wed, 25 Sep 2013 14:58:12 +0800
Message-ID: <1380092301-21924-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1380092301-21924-1-git-send-email-b32955@freescale.com>
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The legacy ID NAND are all SLC.
This patch sets 1 to the @bits_per_cell for the legacy ID NAND,
which means they are all SLC.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c84c35f..0dedf71 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3237,6 +3237,9 @@ static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
 	mtd->oobsize = mtd->writesize / 32;
 	*busw = type->options & NAND_BUSWIDTH_16;
 
+	/* All legacy ID NAND are small-page, SLC */
+	chip->bits_per_cell = 1;
+
 	/*
 	 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
 	 * some Spansion chips have erasesize that conflicts with size
-- 
1.7.1
