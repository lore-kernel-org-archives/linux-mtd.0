Received: from sorrow.cyrius.com ([65.19.161.204])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FAyZH-0007xG-7F
	for linux-mtd@lists.infradead.org; Sun, 19 Feb 2006 19:06:53 -0500
Date: Mon, 20 Feb 2006 00:06:06 +0000
From: Martin Michlmayr <tbm@cyrius.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20060220000605.GA17853@deprecation.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [PATCH] Fix #else in docprobe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following difference was found between the mainline and linux-mips
kernel.  Fix the #else directive in the docprobe driver, and change
some space to tabs for consistency.

Signed-off-by: Martin Michlmayr <tbm@cyrius.com>

--- linux-2.6.16-rc4/drivers/mtd/devices/docprobe.c	2006-02-19 20:09:05.000000000 +0000
+++ mips-2.6.16-rc4/drivers/mtd/devices/docprobe.c	2006-02-19 20:15:19.000000000 +0000
@@ -84,10 +84,10 @@
 	0xe4000000,
 #elif defined(CONFIG_MOMENCO_OCELOT)
 	0x2f000000,
-        0xff000000,
+	0xff000000,
 #elif defined(CONFIG_MOMENCO_OCELOT_G) || defined (CONFIG_MOMENCO_OCELOT_C)
-        0xff000000,
-##else
+	0xff000000,
+#else
 #warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
 	0xffffffff };

-- 
MartinnMichlmayr
http://www.cyrius.com/
