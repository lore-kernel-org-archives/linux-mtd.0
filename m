Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTMWh-0006eF-Eo
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 22:42:20 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/6] mtd: nand: add mtd->writebufsize initialization
Date: Thu, 16 Dec 2010 23:42:16 +0100
Message-Id: <1292539339-25111-4-git-send-email-agust@denx.de>
In-Reply-To: <292342500.2538.65.camel@localhost>
References: <292342500.2538.65.camel@localhost>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Initialize mtd->writebufsize to be equal to mtd->writesize.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/nand/nand_base.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5dd7ae4..4915067 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3439,6 +3439,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->resume = nand_resume;
 	mtd->block_isbad = nand_block_isbad;
 	mtd->block_markbad = nand_block_markbad;
+	mtd->writebufsize = mtd->writesize;
 
 	/* propagate ecc.layout to mtd_info */
 	mtd->ecclayout = chip->ecc.layout;
-- 
1.7.1
