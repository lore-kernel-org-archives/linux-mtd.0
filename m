Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyTJE-0005RA-Oo
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 23:35:42 +0000
Received: by pacfl14 with SMTP id fl14so26649595pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 15:35:19 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] MAINTAINERS: brcmnand: Add Broadcom internal mailing-list
Date: Mon, 16 Nov 2015 15:34:15 -0800
Message-Id: <1447716855-6535-1-git-send-email-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Broadcom NAND driver is used by many different groups at Broadcom
now, so use the same mailing-list we use for other areas of the kernel.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9caa4b28828..da691aad7031 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2450,6 +2450,7 @@ F:	drivers/firmware/broadcom/*
 BROADCOM STB NAND FLASH DRIVER
 M:	Brian Norris <computersforpeace@gmail.com>
 L:	linux-mtd@lists.infradead.org
+L:	bcm-kernel-feedback-list@broadcom.com
 S:	Maintained
 F:	drivers/mtd/nand/brcmnand/
 
-- 
2.1.0
