Received: from mailout.stusta.mhn.de ([141.84.69.5] helo=mailhub.stusta.mhn.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I55w9-000436-CA
	for linux-mtd@lists.infradead.org; Sun, 01 Jul 2007 16:22:26 -0400
Date: Sun, 1 Jul 2007 22:20:48 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [2.6 patch] remove dead MTD_PMC551_APERTURE_SIZE option
Message-ID: <20070701202048.GF10869@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, Mark Ferrell <mferrell@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The CONFIG_MTD_PMC551_APERTURE_SIZE option seems to never have existed, 
so there's no reason for carrying an #ifdef for it.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

This patch has been sent on:
- 3 Jun 2007

--- linux-2.6.22-rc3-mm1/drivers/mtd/devices/pmc551.c.old	2007-06-03 19:16:00.000000000 +0200
+++ linux-2.6.22-rc3-mm1/drivers/mtd/devices/pmc551.c	2007-06-03 19:16:50.000000000 +0200
@@ -649,11 +649,7 @@
  * Stuff these outside the ifdef so as to not bust compiled in driver support
  */
 static int msize = 0;
-#if defined(CONFIG_MTD_PMC551_APERTURE_SIZE)
-static int asize = CONFIG_MTD_PMC551_APERTURE_SIZE;
-#else
 static int asize = 0;
-#endif
 
 module_param(msize, int, 0);
 MODULE_PARM_DESC(msize, "memory size in Megabytes [1 - 1024]");
