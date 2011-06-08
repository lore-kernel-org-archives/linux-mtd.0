Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUIOK-0003cq-HO
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 13:01:49 +0000
Received: by pzk28 with SMTP id 28so317585pzk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 06:01:45 -0700 (PDT)
Subject: [PATCH] mtd: davinci_nand: remove redundant mtd_device_unregister
	in nand_davinci_remove
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 21:01:37 +0800
Message-ID: <1307538097.17552.4.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_device_unregister is done in nand_release(),
thus no need to call it in nand_davinci_remove().

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/davinci_nand.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 0c582ed..70c92a5 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -811,9 +811,6 @@ err_nomem:
 static int __exit nand_davinci_remove(struct platform_device *pdev)
 {
 	struct davinci_nand_info *info = platform_get_drvdata(pdev);
-	int status;
-
-	status = mtd_device_unregister(&info->mtd);
 
 	spin_lock_irq(&davinci_nand_lock);
 	if (info->chip.ecc.mode == NAND_ECC_HW_SYNDROME)
-- 
1.7.4.1
