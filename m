Received: from mlbe2k2.cs.myharris.net ([137.237.90.89])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MKEVo-0006b3-An
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 16:42:59 +0000
Message-ID: <4A44FA87.8030807@harris.com>
Date: Fri, 26 Jun 2009 12:42:47 -0400
From: "Steven A. Falco" <sfalco@harris.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] m25p80 timeout too short for worst-case m25p16 devices
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The m25p16 data sheet from numonyx lists the worst-case bulk erase time
(tBE) as 40 seconds.

Signed-off-by: Steven A. Falco <sfalco@harris.com>
---
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index cc6369e..e106700 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -54,7 +54,7 @@
 #define	SR_SRWD			0x80	/* SR write protect */
 
 /* Define max times to check status register before we give up. */
-#define	MAX_READY_WAIT_JIFFIES	(10 * HZ)	/* eg. M25P128 specs 6s max sector erase */
+#define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
 #define	CMD_SIZE		4
 
 #ifdef CONFIG_M25PXX_USE_FAST_READ
