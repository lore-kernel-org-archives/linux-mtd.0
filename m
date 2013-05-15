Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcXca-0002r7-64
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 09:03:40 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 3/4] mtd: set the ecc step size for master/slave mtd_info
Date: Wed, 15 May 2013 16:46:45 +0800
Message-ID: <1368607606-4344-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1368607606-4344-1-git-send-email-b32955@freescale.com>
References: <1368607606-4344-1-git-send-email-b32955@freescale.com>
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

Set the ecc step size for master/slave mtd_info{}.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/mtdpart.c        |    1 +
 drivers/mtd/nand/nand_base.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 3014933..63b42a6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -516,6 +516,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	}
 
 	slave->mtd.ecclayout = master->ecclayout;
+	slave->mtd.ecc_step = master->ecc_step;
 	slave->mtd.ecc_strength = master->ecc_strength;
 	slave->mtd.bitflip_threshold = master->bitflip_threshold;
 
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 359e105..48dfab5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3747,6 +3747,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* propagate ecc info to mtd_info */
 	mtd->ecclayout = chip->ecc.layout;
 	mtd->ecc_strength = chip->ecc.strength;
+	mtd->ecc_step = chip->ecc.size;
 	/*
 	 * Initialize bitflip_threshold to its default prior scan_bbt() call.
 	 * scan_bbt() might invoke mtd_read(), thus bitflip_threshold must be
-- 
1.7.1
