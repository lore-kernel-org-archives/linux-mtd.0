Received: from mail-oi0-f65.google.com ([209.85.218.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bB3Mr-0007Xz-PX
 for linux-mtd@lists.infradead.org; Thu, 09 Jun 2016 17:03:42 +0000
Received: by mail-oi0-f65.google.com with SMTP id e205so3247531oig.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2016 10:03:21 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: tony@atomide.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, linux-arm-kernel@lists.infradead,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 6/6] ARM: OMAP2+: Don't force select OMAP_GPMC
Date: Thu,  9 Jun 2016 12:02:57 -0500
Message-Id: <1465491777-20033-7-git-send-email-fcooper@ti.com>
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

OMAP_GPMC requires CONFIG_MEMORY to be enabled. However, by forcing
OMAP_GPMC to be selected dependencies are ignored. This is a problem
since it means OMAP_GPMC is always enabled even when it shouldn't be.

By avoiding this force selection it insures that OMAP_GPMC is only
enabled when its dependencies are met.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 arch/arm/mach-omap2/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 0517f0c..dcbb4bd 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -95,7 +95,6 @@ config ARCH_OMAP2PLUS
 	select MEMORY
 	select MFD_SYSCON
 	select OMAP_DM_TIMER
-	select OMAP_GPMC
 	select PINCTRL
 	select SOC_BUS
 	select OMAP_IRQCHIP
-- 
2.7.0
