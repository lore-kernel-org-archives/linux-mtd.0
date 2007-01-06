Received: from mo-p07-ob.rzone.de ([81.169.146.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H39nj-0004UZ-7r
	for linux-mtd@lists.infradead.org; Sat, 06 Jan 2007 06:33:30 -0500
Date: Sat, 6 Jan 2007 12:27:39 +0100 (MET)
From: Stefan Roese <ml@stefan-roese.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND: Fix erpn usage in ndfc driver
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200701061228.26136.ml@stefan-roese.de>
Content-Type: text/plain;  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: Timo Lindhorst <lindhors@vnet.ibm.com>, Josh Boyer <jwboyer@gmail.com>,
	Frank Haverkamp <haver@vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD]: NAND: Fix erpn usage in ndfc driver

Since 440EPx uses erpn != 0 this patch fixes the usage of erpn passing
via platform_devices.

Signed-off-by: Stefan Roese <sr@denx.de>

---
commit 8ff908ce0b12fc6fbfb73cc95eaf5be4d793e66f
tree d00ab09cd4adddca0fbdefc2cc08069eff3079f0
parent 05a8057bb38bc803682f3e0af305c258b4566285
author Stefan Roese <sr@denx.de> Sat, 06 Jan 2007 12:25:24 +0100
committer Stefan Roese <sr@denx.de> Sat, 06 Jan 2007 12:25:24 +0100

 drivers/mtd/nand/ndfc.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 039c759..fd8e910 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -228,7 +228,8 @@ static int ndfc_nand_probe(struct platform_device *pdev)
 	struct ndfc_controller_settings *settings = nc->priv;
 	struct resource *res = pdev->resource;
 	struct ndfc_controller *ndfc = &ndfc_ctrl;
-	unsigned long long phys = settings->ndfc_erpn | res->start;
+	unsigned long long phys = ((unsigned long long)settings->ndfc_erpn << 32)
+		| res->start;
 
 	ndfc->ndfcbase = ioremap64(phys, res->end - res->start + 1);
 	if (!ndfc->ndfcbase) {
