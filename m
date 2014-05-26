Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp39l-0000na-Di
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:14:10 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 210B7423C2FA
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:13:50 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/27] mtd: nand: introduce function to fix a common bug in
 most nand-drivers not showing a device in sysfs
Date: Tue, 27 May 2014 00:12:26 +0200
Message-Id: <1401142372-14148-2-git-send-email-holler@ahsoftware.de>
In-Reply-To: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Alexander Holler <holler@ahsoftware.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Most nand drivers don't set a parent device for the mtd-device. The result
is that information in sysfs is missing (no folder device).

Comparing the output of

	git grep mtd_device_parse_register drivers/mtd/nand/

with

	git grep parent drivers/mtd/nand/ | cut -f 1 | sort -u

showed that this is a very common error. Looking at some of those drivers
a common pattern is visible which I put into a new inline function to
reduce source code size and to avoid future similiar errors.

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 include/linux/mtd/mtd.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a1b0b4c..2e24afe 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -23,7 +23,7 @@
 #include <linux/types.h>
 #include <linux/uio.h>
 #include <linux/notifier.h>
-#include <linux/device.h>
+#include <linux/platform_device.h>
 
 #include <mtd/mtd-abi.h>
 
@@ -366,6 +366,15 @@ static inline int mtd_can_have_bb(const struct mtd_info *mtd)
 struct mtd_partition;
 struct mtd_part_parser_data;
 
+static inline void mtd_setup_common_members(struct mtd_info *mtd, void *priv,
+						struct platform_device *pdev)
+{
+	mtd->priv	= priv;
+	mtd->owner	= pdev->dev.driver->owner;
+	mtd->dev.parent	= &pdev->dev;
+	mtd->name	= pdev->dev.driver->name;
+}
+
 extern int mtd_device_parse_register(struct mtd_info *mtd,
 				     const char * const *part_probe_types,
 				     struct mtd_part_parser_data *parser_data,
-- 
1.8.3.2
