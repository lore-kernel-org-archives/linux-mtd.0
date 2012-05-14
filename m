Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STzQC-0005WN-FN
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 17:51:01 +0000
From: John Crispin <blogic@openwrt.org>
To: Ralf Baechle <ralf@linux-mips.org>
Subject: [RESEND PATCH V2 14/17] MTD: MIPS: lantiq: verify that the NOR
 interface is available on falcon soc
Date: Mon, 14 May 2012 19:42:40 +0200
Message-Id: <1337017363-14424-14-git-send-email-blogic@openwrt.org>
In-Reply-To: <1337017363-14424-1-git-send-email-blogic@openwrt.org>
References: <1337017363-14424-1-git-send-email-blogic@openwrt.org>
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When running on a FALC-ON SoC, we need to check the bootstrap options to see
if NOR is available.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org
---
This patch is part of a series moving the mips/lantiq target to OF and clkdev
support. The patch, once Acked, should go upstream via Ralf's MIPS tree.

 drivers/mtd/maps/lantiq-flash.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index aefa111..c03456f 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -19,6 +19,7 @@
 #include <linux/mtd/cfi.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/physmap.h>
+#include <linux/of.h>
 
 #include <lantiq_soc.h>
 
@@ -116,6 +117,12 @@ ltq_mtd_probe(struct platform_device *pdev)
 	struct cfi_private *cfi;
 	int err;
 
+	if (of_machine_is_compatible("lantiq,falcon") &&
+			(ltq_boot_select() != BS_FLASH)) {
+		dev_err(&pdev->dev, "invalid bootstrap options\n");
+		return -ENODEV;
+	}
+
 	ltq_mtd = kzalloc(sizeof(struct ltq_mtd), GFP_KERNEL);
 	platform_set_drvdata(pdev, ltq_mtd);
 
-- 
1.7.9.1
