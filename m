Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JAoOR-0004Ed-V0
	for linux-mtd@lists.infradead.org; Fri, 04 Jan 2008 15:23:38 +0000
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id m04FN78S014491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Fri, 4 Jan 2008 09:23:19 -0600
Received: from x0081444pc (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id m04FN5EU011416
	for <linux-mtd@lists.infradead.org>;
	Fri, 4 Jan 2008 20:53:06 +0530 (IST)
From: "Sameer" <x0081444@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] - NAND - Samsung LP nand feature support - nand_base.c upated
Date: Fri, 4 Jan 2008 20:53:05 +0530
Message-ID: <00ed01c84ee5$b4928e40$ec8818ac@ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
This patch add the Large page NAND feature support for Samsung nand flash.

Regards,
-Sameer


Signed-off-by: Sameer U <sameersu@ti.com>
---
 drivers/mtd/nand/nand_base.c |    4 ++++
 1 files changed, 4 insertions(+)

Index: linux-omap-git/drivers/mtd/nand/nand_base.c
===================================================================
--- linux-omap-git.orig/drivers/mtd/nand/nand_base.c
+++ linux-omap-git/drivers/mtd/nand/nand_base.c
@@ -2322,6 +2322,10 @@ static struct nand_flash_dev *nand_get_f
	chip->options &= ~NAND_CHIPOPTIONS_MSK;
	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;

+	/* adding feature support for large page samsung nand */
+	if ((*maf_id == NAND_MFR_SAMSUNG) && (mtd->writesize > 512))
+		chip->options |= NAND_SAMSUNG_LP_OPTIONS;
+
	/*
	 * Set chip as a default. Board drivers can override it, if necessary
	 */
