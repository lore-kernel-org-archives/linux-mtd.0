Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKBBt-0008IE-CM
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2010 14:14:42 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id CE4C626027D
	for <linux-mtd@lists.infradead.org>;
	Thu,  3 Jun 2010 16:14:33 +0200 (CEST)
Message-ID: <4C07B8C3.7080304@parrot.com>
Date: Thu, 3 Jun 2010 16:14:27 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] ubi : generate random image_seq when attaching empty MTD
	device
Content-Type: multipart/mixed; boundary="------------010705070502010306090208"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------010705070502010306090208
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

generate random image_seq when attaching empty MTD device (kernel do the 
ubi formating).

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

--------------010705070502010306090208
Content-Type: text/x-diff; name="ubi.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="ubi.diff"

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index aed19f3..7a95ff3 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -44,6 +44,7 @@
 #include <linux/slab.h>
 #include <linux/crc32.h>
 #include <linux/math64.h>
+#include <linux/random.h>
 #include "ubi.h"
 
 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
@@ -935,8 +936,10 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	if (si->ec_count)
 		si->mean_ec = div_u64(si->ec_sum, si->ec_count);
 
-	if (si->is_empty)
+	if (si->is_empty) {
 		ubi_msg("empty MTD device detected");
+		get_random_bytes(&ubi->image_seq, sizeof(ubi->image_seq));
+	}
 
 	/*
 	 * Few corrupted PEBs are not a problem and may be just a result of

--------------010705070502010306090208--
