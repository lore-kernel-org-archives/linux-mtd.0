Received: from metis.extern.pengutronix.de ([83.236.181.26])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtgpJ-0001Se-1p
	for linux-mtd@lists.infradead.org; Wed, 07 May 2008 10:24:45 +0000
Date: Wed, 7 May 2008 12:27:24 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: jffs2 and unaligned access
Message-ID: <20080507102724.GE4326@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>, Jon Smirl <jonsmirl@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

memcpy_from/to_io() use word aligned accesses on the io side of memory.
The MPC5200 local plus bus where our flashes are connected does not
allow unaligned accesses, so we have to use the io versions of memcpy.

I have the suspicion that this is not the correct fix to our problem,
but maybe someone can have a look at it and point me in the right
direction.

Thanks,
  Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

---
 fs/jffs2/scan.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: linux-2.6/fs/jffs2/scan.c
===================================================================
--- linux-2.6.orig/fs/jffs2/scan.c
+++ linux-2.6/fs/jffs2/scan.c
@@ -16,6 +16,7 @@
 #include <linux/pagemap.h>
 #include <linux/crc32.h>
 #include <linux/compiler.h>
+#include <linux/io.h>
 #include "nodelist.h"
 #include "summary.h"
 #include "debug.h"
@@ -506,7 +507,7 @@ static int jffs2_scan_eraseblock (struct
 					sumptr = kmalloc(sumlen, GFP_KERNEL);
 					if (!sumptr)
 						return -ENOMEM;
-					memcpy(sumptr + sumlen - buf_len, buf + buf_size - buf_len, buf_len);
+					memcpy_fromio(sumptr + sumlen - buf_len, buf + buf_size - buf_len, buf_len);
 				}
 				if (buf_len < sumlen) {
 					/* Need to read more so that the entire summary node is present */
@@ -1036,7 +1037,7 @@ static int jffs2_scan_dirent_node(struct
 	if (!fd) {
 		return -ENOMEM;
 	}
-	memcpy(&fd->name, rd->name, checkedlen);
+	memcpy_fromio(&fd->name, rd->name, checkedlen);
 	fd->name[checkedlen] = 0;
 
 	crc = crc32(0, fd->name, rd->nsize);
-- 
Pengutronix e.K. - Linux Solutions for Science and Industry
-----------------------------------------------------------
Kontakt-Informationen finden Sie im Header dieser Mail oder
auf der Webseite -> http://www.pengutronix.de/impressum/ <-
