Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZylLc-0002uc-0b
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 18:51:20 +0000
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>
CC: <f.fainelli@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>, "Kamal
 Dasu" <kdasu.kdev@gmail.com>
Subject: [PATCH] MAINTAINERS: brcmnand: Add co-maintainer for Broadcom SoCs
Date: Tue, 17 Nov 2015 13:50:08 -0500
Message-ID: <1447786208-20102-1-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding myself as co-maintainer of nand controller driver
for the Broadcom SoCs.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index da691aa..d20d6f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2449,6 +2449,7 @@ F:	drivers/firmware/broadcom/*
 
 BROADCOM STB NAND FLASH DRIVER
 M:	Brian Norris <computersforpeace@gmail.com>
+M:	Kamal Dasu <kdasu.kdev@gmail.com>
 L:	linux-mtd@lists.infradead.org
 L:	bcm-kernel-feedback-list@broadcom.com
 S:	Maintained
-- 
2.3.2
