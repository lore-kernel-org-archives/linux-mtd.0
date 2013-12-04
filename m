Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoLtD-0004dG-1t
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2013 23:29:56 +0000
Received: by mail-ie0-f172.google.com with SMTP id qd12so28444284ieb.17
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 15:29:33 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/2] MAINTAINERS: mtd: add PXA3xx NAND driver to MAINTAINERS
Date: Wed,  4 Dec 2013 15:28:46 -0800
Message-Id: <1386199726-28074-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1386199726-28074-1-git-send-email-computersforpeace@gmail.com>
References: <1386199726-28074-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Add the pxa3xx-nand driver which supports PXA3xx and Armada 370/XP SoC
family to MAINTAINERS to ensure I get proper Cc on patches.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v1 -> v2: (Brian) placed into semi-alphabetical order; MMP SUPPORT is
                  out-of-place...

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a7f53bee1cf..99870552637a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6825,6 +6825,12 @@ F:	include/sound/pxa2xx-lib.h
 F:	sound/arm/pxa*
 F:	sound/soc/pxa/
 
+PXA3xx NAND FLASH DRIVER
+M:	Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/nand/pxa3xx-nand.c
+
 MMP SUPPORT
 M:	Eric Miao <eric.y.miao@gmail.com>
 M:	Haojian Zhuang <haojian.zhuang@gmail.com>
-- 
1.8.5
