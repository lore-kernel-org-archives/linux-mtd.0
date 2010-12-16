Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTMWh-0006eG-Eg
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 22:42:20 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 4/6] mtd: onenand: add mtd->writebufsize initialization
Date: Thu, 16 Dec 2010 23:42:17 +0100
Message-Id: <1292539339-25111-5-git-send-email-agust@denx.de>
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
 drivers/mtd/onenand/onenand_base.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 2d7c90d..d552821 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -4076,6 +4076,7 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	mtd->block_isbad = onenand_block_isbad;
 	mtd->block_markbad = onenand_block_markbad;
 	mtd->owner = THIS_MODULE;
+	mtd->writebufsize = mtd->writesize;
 
 	/* Unlock whole block */
 	this->unlock_all(mtd);
-- 
1.7.1
