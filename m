Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RlBHu-0003H4-3F
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2012 03:25:14 +0000
Received: by ghbf1 with SMTP id f1so76559ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jan 2012 19:25:11 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] drivers: mtd: mtdcore: Fix build warning when CONFIG_MTD_CHAR
 is not defined
Date: Thu, 12 Jan 2012 01:25:04 -0200
Message-Id: <1326338704-30199-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, dwmw2@infradead.org,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix the following build warning:

drivers/mtd/mtdcore.c: In function ‘mtd_release’:
drivers/mtd/mtdcore.c:110: warning: unused variable ‘mtd’

This happens when neither CONFIG_MTD_CHAR nor CONFIG_MTD_CHAR_MODULE are defined.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/mtdcore.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6ae9ca0..b265188 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -107,7 +107,7 @@ static LIST_HEAD(mtd_notifiers);
  */
 static void mtd_release(struct device *dev)
 {
-	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_info __maybe_unused *mtd = dev_get_drvdata(dev);
 	dev_t index = MTD_DEVT(mtd->index);
 
 	/* remove /dev/mtdXro node if needed */
-- 
1.7.1
