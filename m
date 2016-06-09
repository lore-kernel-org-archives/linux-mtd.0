Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bB3Mm-0007XY-Ll
 for linux-mtd@lists.infradead.org; Thu, 09 Jun 2016 17:03:37 +0000
Received: by mail-oi0-f67.google.com with SMTP id e205so3247428oig.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2016 10:03:20 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: tony@atomide.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, linux-arm-kernel@lists.infradead,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 5/6] memory: omap-gpmc: Enable omap-gpmc by default when
 dependency is met
Date: Thu,  9 Jun 2016 12:02:56 -0500
Message-Id: <1465491777-20033-6-git-send-email-fcooper@ti.com>
In-Reply-To: <1465491777-20033-1-git-send-email-fcooper@ti.com>
References: <1465491777-20033-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When dependencies are met enable OMAP GPMC by default. Later patches will
prevent OMAP GPMC from being automatically selected by mach-omap2 Kconfig.
Therefore, this will sure after that change the current behavior is still
maintained when dependencies are met.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 drivers/memory/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 81ddb17..56a1c66 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -51,6 +51,7 @@ config TI_EMIF
 
 config OMAP_GPMC
 	bool
+	default y
 	select GPIOLIB
 	help
 	  This driver is for the General Purpose Memory Controller (GPMC)
-- 
2.7.0
