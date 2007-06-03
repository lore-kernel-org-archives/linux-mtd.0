Received: from mailout.stusta.mhn.de ([141.84.69.5] helo=mailhub.stusta.mhn.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hux6w-0005Yf-J6
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 16:55:50 -0400
Date: Sun, 3 Jun 2007 22:54:00 +0200
From: Adrian Bunk <bunk@stusta.de>
To: dwmw2@infradead.org, Mark Ferrell <mferrell@mvista.com>
Subject: [2.6 patch] remove dead MTD_PMC551_APERTURE_SIZE option
Message-ID: <20070603205359.GN5500@stusta.de>
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

The CONFIG_MTD_PMC551_APERTURE_SIZE option seems to never have existed, 
so there's no reason for carrying an #ifdef for it.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---
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
