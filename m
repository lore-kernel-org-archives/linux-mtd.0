Received: from mxf2.bahnhof.se ([213.80.101.26])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHj2x-00071H-P3
 for linux-mtd@lists.infradead.org; Sun, 01 Feb 2015 01:09:56 +0000
From: Niklas Cassel <nks@flawful.org>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: avoid registering reboot notifier twice
Date: Sun,  1 Feb 2015 02:08:50 +0100
Message-Id: <1422752930-696-1-git-send-email-nks@flawful.org>
Cc: Niklas Cassel <nks@flawful.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Calling mtd_device_parse_register with the same mtd_info
(e.g. registering several partitions on a single device)
would add the same reboot notifier twice, causing an
infinte loop in notifier_chain_register during boot up.

Signed-off-by: Niklas Cassel <nks@flawful.org>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index de79576..98efc1e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -556,7 +556,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			err = -ENODEV;
 	}
 
-	if (mtd->_reboot) {
+	if (mtd->_reboot && !mtd->reboot_notifier.notifier_call) {
 		mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
-- 
2.2.2
