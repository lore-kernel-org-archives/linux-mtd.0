Received: from mail-ye0-f174.google.com ([209.85.213.174])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U4vff-0003U6-9Z
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2013 15:51:56 +0000
Received: by mail-ye0-f174.google.com with SMTP id m3so1246346yen.19
 for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2013 07:51:54 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: artem.bityutskiy@linux.intel.com
Subject: [PATCH] mtd: mxc_nand: Fix sparse warning
Date: Mon, 11 Feb 2013 13:51:43 -0200
Message-Id: <1360597903-10378-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Fix the following sparse warning:

drivers/mtd/nand/mxc_nand.c:269:25: warning: duplicate const

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/mxc_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 45204e4..37037cb 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -266,7 +266,7 @@ static struct nand_ecclayout nandv2_hw_eccoob_4k = {
 	}
 };
 
-static const char const *part_probes[] = {
+static const char *part_probes[] = {
 	"cmdlinepart", "RedBoot", "ofpart", NULL };
 
 static void memcpy32_fromio(void *trg, const void __iomem  *src, size_t size)
-- 
1.7.9.5
