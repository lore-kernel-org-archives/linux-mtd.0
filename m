Received: from adsl-110-19.38-151.net24.it ([151.38.19.110] helo=develer.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AYfsk-00034d-1z
	for linux-mtd@lists.infradead.org; Tue, 23 Dec 2003 06:19:03 +0000
Message-ID: <3FE7DDD8.3060506@develer.com>
Date: Tue, 23 Dec 2003 07:16:56 +0100
From: Bernardo Innocenti <bernie@develer.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [PATCH] fix static build of drivers/mtd/chips/jedec_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

one liner fix for building jedec_probe statically in m68knommu and possibly other archs.

Applies to 2.6.0.

--- drivers/mtd/chips/jedec_probe.c.orig	2003-12-23 06:50:51.842514068 +0100
+++ drivers/mtd/chips/jedec_probe.c	2003-12-23 06:51:15.512685112 +0100
@@ -8,6 +8,7 @@
 
 #include <linux/config.h>
 #include <linux/module.h>
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <asm/io.h>

-- 
  // Bernardo Innocenti - Develer S.r.l., R&D dept.
\X/  http://www.develer.com/
