Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bB3Mm-0007XB-Ls
 for linux-mtd@lists.infradead.org; Thu, 09 Jun 2016 17:03:37 +0000
Received: by mail-oi0-f67.google.com with SMTP id k63so8569265oib.2
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2016 10:03:17 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: tony@atomide.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, linux-arm-kernel@lists.infradead,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 3/6] ARM: multi_v7_defconfig: Enable OMAP NAND drivers
Date: Thu,  9 Jun 2016 12:02:54 -0500
Message-Id: <1465491777-20033-4-git-send-email-fcooper@ti.com>
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

Enable both MTD_NAND_OMAP2 and MTD_NAND_ECC_BCH to enable NAND support
for OMAP based boards.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 782d963..d4152a4 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -187,6 +187,8 @@ CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_M25P80=y
 CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_OMAP2=y
+CONFIG_MTD_NAND_OMAP_BCH=y
 CONFIG_MTD_NAND_DENALI_DT=y
 CONFIG_MTD_NAND_ATMEL=y
 CONFIG_MTD_NAND_BRCMNAND=y
-- 
2.7.0
