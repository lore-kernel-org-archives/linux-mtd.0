Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KZ1hw-0004Sq-5d
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 11:00:00 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] pxa3xx_nand: added warning which tells id of detected NAND
Date: Fri, 29 Aug 2008 12:59:52 +0200
Message-Id: <1220007592-26894-5-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1220007448-26801-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1220007448-26801-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Minor patch to help debugging of NAND detection.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 drivers/mtd/nand/pxa3xx_nand.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 45bb2ca..3fe9cd7 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -901,7 +901,7 @@ static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
 				    struct pxa3xx_nand_platform_data const *pdata)
 {
 	struct pxa3xx_nand_flash const *f;
-	uint32_t id;
+	uint32_t id = -1;
 	int i;
 
 	for (i = 0; i<pdata->num_flash; ++i) {
@@ -933,6 +933,9 @@ static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
 	}
 #endif
 
+	dev_warn(&info->pdev->dev,
+		 "failed to detect configured nand flash; found %04x instead of\n",
+		 id);
 	return -ENODEV;
 }
 
-- 
1.5.5.1
