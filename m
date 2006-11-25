Received: from emailhub.stusta.mhn.de ([141.84.69.5]
	helo=mailout.stusta.mhn.de)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Go302-0007nP-2X
	for linux-mtd@lists.infradead.org; Sat, 25 Nov 2006 14:15:55 -0500
Date: Sat, 25 Nov 2006 20:15:41 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@osdl.org>
Subject: [2.6 patch] make drivers/mtd/cmdlinepart.c:mtdpart_setup() static
Message-ID: <20061125191541.GH3702@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes the needlessly global mtdpart_setup() static.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

This patch was already sent on:
- 27 Jun 2006

--- linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c.old	2006-06-26 23:18:39.000000000 +0200
+++ linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c	2006-06-26 23:18:51.000000000 +0200
@@ -346,7 +346,7 @@
  *
  * This function needs to be visible for bootloaders.
  */
-int mtdpart_setup(char *s)
+static int mtdpart_setup(char *s)
 {
 	cmdline = s;
 	return 1;
