Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TjBqa-0007nU-4n
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2012 16:41:20 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubiformat: fix error path
Date: Thu, 13 Dec 2012 17:41:14 +0100
Message-Id: <1355416874-23907-1-git-send-email-w.sang@pengutronix.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A few error paths were closing the device, although it was not opened
yet.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 ubi-utils/ubiformat.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index c49af29..899f9fc 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -740,7 +740,7 @@ int main(int argc, char * const argv[])
 	if (!is_power_of_2(mtd.min_io_size)) {
 		errmsg("min. I/O size is %d, but should be power of 2",
 		       mtd.min_io_size);
-		goto out_close;
+		goto out_close_mtd;
 	}
 
 	if (!mtd_info.sysfs_supported) {
@@ -768,13 +768,13 @@ int main(int argc, char * const argv[])
 		/* Do some sanity check */
 		if (args.subpage_size > mtd.min_io_size) {
 			errmsg("sub-page cannot be larger than min. I/O unit");
-			goto out_close;
+			goto out_close_mtd;
 		}
 
 		if (mtd.min_io_size % args.subpage_size) {
 			errmsg("min. I/O unit size should be multiple of "
 			       "sub-page size");
-			goto out_close;
+			goto out_close_mtd;
 		}
 	}
 
-- 
1.7.10.4
