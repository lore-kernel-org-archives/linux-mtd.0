Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewYBW-0003nK-DB
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 19:05:12 +0000
Received: from player746.ha.ovh.net (unknown [10.109.122.131])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 542AC7F8C
 for <linux-mtd@lists.infradead.org>; Thu, 15 Mar 2018 20:04:50 +0100 (CET)
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
To: computersforpeace@gmail.com, dwmw2@infradead.org, richard@nod.at,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] MAINTAINERS: update maintainers for MTD and SPI NOR subsystems
Date: Thu, 15 Mar 2018 20:04:38 +0100
Message-Id: <20180315190438.4832-1-cyrille.pitchen@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

remove myself as MTD and SPI NOR maintainer.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bdc260e36b7..7892db9a9494 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9037,7 +9037,6 @@ M:	Brian Norris <computersforpeace@gmail.com>
 M:	Boris Brezillon <boris.brezillon@free-electrons.com>
 M:	Marek Vasut <marek.vasut@gmail.com>
 M:	Richard Weinberger <richard@nod.at>
-M:	Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
@@ -13006,7 +13005,6 @@ F:	arch/arm/boot/dts/spear*
 F:	arch/arm/mach-spear/
 
 SPI NOR SUBSYSTEM
-M:	Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
 M:	Marek Vasut <marek.vasut@gmail.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
-- 
2.14.1
