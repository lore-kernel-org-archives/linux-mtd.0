Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WagfH-00035d-B8
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 07:23:19 +0000
Received: by mail-pb0-f43.google.com with SMTP id um1so69425pbc.30
 for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2014 00:22:58 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] sh: defconfig: add MTD_SPI_NOR (new dependency for M25P80)
Date: Thu, 17 Apr 2014 00:21:49 -0700
Message-Id: <1397719309-2022-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397719309-2022-1-git-send-email-computersforpeace@gmail.com>
References: <1397719309-2022-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This defconfig contain the CONFIG_M25P80 symbol, which is now
dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR.

At the same time, drop the now-nonexistent CONFIG_MTD_CHAR symbol.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: linux-sh@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
This change is based on l2-mtd.git/spinor, which is based on 3.15-rc1:

  git://git.infradead.org/l2-mtd.git +spinor

 arch/sh/configs/sh7757lcr_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/configs/sh7757lcr_defconfig b/arch/sh/configs/sh7757lcr_defconfig
index cfde98ddb29d..c5fda5636fd1 100644
--- a/arch/sh/configs/sh7757lcr_defconfig
+++ b/arch/sh/configs/sh7757lcr_defconfig
@@ -38,9 +38,9 @@ CONFIG_IPV6=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_M25P80=y
+CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
-- 
1.8.3.2
