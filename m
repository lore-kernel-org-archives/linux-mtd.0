Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OTXqh-0007sK-S2
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 10:15:28 +0000
Received: by fg-out-1718.google.com with SMTP id e12so687600fga.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jun 2010 03:15:27 -0700 (PDT)
From: Kulikov Vasiliy <segooon@gmail.com>
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Subject: [PATCH 08/25] sm_common: remove casts from void*
Date: Tue, 29 Jun 2010 14:15:24 +0400
Message-Id: <1277806525-30976-1-git-send-email-segooon@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/mtd/nand/sm_common.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index ac80fb3..4a8f367 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -109,7 +109,7 @@ static struct nand_flash_dev nand_xd_flash_ids[] = {
 
 int sm_register_device(struct mtd_info *mtd, int smartmedia)
 {
-	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
+	struct nand_chip *chip = mtd->priv;
 	int ret;
 
 	chip->options |= NAND_SKIP_BBTSCAN;
-- 
1.7.0.4
