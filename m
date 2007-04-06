Received: from mailout.stusta.mhn.de ([141.84.69.5] helo=mailhub.stusta.mhn.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HZlZb-0001Yk-Uz
	for linux-mtd@lists.infradead.org; Fri, 06 Apr 2007 06:21:40 -0400
Date: Fri, 6 Apr 2007 12:19:33 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ryan Jackson <rjackson@lnxi.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [2.6 patch] drivers/mtd/maps/ck804xrom.c: convert pci_module_init()
Message-ID: <20070406101933.GC29169@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch converts the pci_module_init() usage to pci_register_driver().

It's currently #if 0'ed, but still not a bad idea to change it.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---
--- linux-2.6.21-rc5-mm4/drivers/mtd/maps/ck804xrom.c.old	2007-04-05 20:39:54.000000000 +0200
+++ linux-2.6.21-rc5-mm4/drivers/mtd/maps/ck804xrom.c	2007-04-05 20:40:15.000000000 +0200
@@ -338,7 +338,7 @@
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&ck804xrom_driver);
+	return pci_register_driver(&ck804xrom_driver);
 #endif
 }
 
