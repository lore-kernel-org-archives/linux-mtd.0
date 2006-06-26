Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fuz9u-0004vo-7t
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 18:02:27 -0400
Date: Tue, 27 Jun 2006 00:02:15 +0200
From: Adrian Bunk <bunk@stusta.de>
To: dwmw2@infradead.org
Subject: [2.6 patch] make drivers/mtd/cmdlinepart.c:mtdpart_setup() static
Message-ID: <20060626220215.GI23314@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

This patch makes the needlessly global mtdpart_setup() static.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

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
