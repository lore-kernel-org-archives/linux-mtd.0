Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8jGe-0004Ps-0A
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 21:58:37 +0100
Date: Wed, 11 Jul 2007 16:56:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD:  Remove references to now-unsupported MOMENCO_OCELOT_G.
Message-ID: <Pine.LNX.4.64.0707111653140.19414@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  from "git log":

commit 1e54f778af4467b816bf1289e7c4bf7e50067b7b
Author: Franck Bui-Huu <fbuihuu@gmail.com>
Date:   Mon May 7 18:01:51 2007 +0200

    [MIPS] Remove Momenco Ocelot G support

    Signed-off-by: Franck Bui-Huu <fbuihuu@gmail.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

 drivers/mtd/devices/docprobe.c |    2 --
 drivers/mtd/nand/diskonchip.c  |    2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
index b96ac8e..d574916 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -84,8 +84,6 @@ static unsigned long __initdata doc_locations[] = {
 #elif defined(CONFIG_MOMENCO_OCELOT)
 	0x2f000000,
         0xff000000,
-#elif defined(CONFIG_MOMENCO_OCELOT_G)
-        0xff000000,
 ##else
 #warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index 17c8680..5f3049a 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -59,8 +59,6 @@ static unsigned long __initdata doc_locations[] = {
 #elif defined(CONFIG_MOMENCO_OCELOT)
 	0x2f000000,
 	0xff000000,
-#elif defined(CONFIG_MOMENCO_OCELOT_G)
-	0xff000000,
 #else
 #warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
========================================================================
