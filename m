Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9FI-00074g-BN
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:37 +0000
Received: by wwb39 with SMTP id 39so758040wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 005/104] mtd: cafe_nand: drop reference to
	CONFIG_MTD_CMDLINE_PARTS
Date: Thu,  2 Jun 2011 18:51:15 +0400
Message-Id: <1307026293-8535-3-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no need to guard mtd->name with CONFIG_MTD_CMDLINE_PARTS
as name can be used by other parts.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 87ebb4e..2cb3141 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -802,9 +802,7 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 	/* We register the whole device first, separate from the partitions */
 	mtd_device_register(mtd, NULL, 0);
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
 	mtd->name = "cafe_nand";
-#endif
 	nr_parts = parse_mtd_partitions(mtd, part_probes, &parts, 0);
 	if (nr_parts > 0) {
 		cafe->parts = parts;
-- 
1.7.4.4
