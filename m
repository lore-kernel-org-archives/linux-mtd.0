Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUSDQ-0005Dx-0L
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 01:40:16 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] UBI: do not abort init when ubi.mtd devices cannot be found
Date: Mon, 22 Apr 2013 21:40:16 -0400
Message-Id: <1366681216-17378-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current ubi.mtd parsing logic will warn & continue on when attaching
the specified mtd device fails (for any reason).  It doesn't however skip
things when the specified mtd device can't be opened.

This scenario can be hit in a couple of different ways such as:
 - build NAND controller driver as a module
 - build UBI into the kernel
 - include ubi.mtd on the kernel command line
 - boot the system
 - MTD devices don't exist, so UBI init fails

This is problematic because failing init means the entire UBI layer is
unavailable until you reboot and modify the kernel command line.  If
we just warn and continue on, /dev/ubi_ctrl is available for userland
to add UBI volumes on the fly once it loads the NAND driver.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/ubi/build.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index eaa2d4e..474bc89 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1261,7 +1261,11 @@ static int __init ubi_init(void)
 		mtd = open_mtd_device(p->name);
 		if (IS_ERR(mtd)) {
 			err = PTR_ERR(mtd);
-			goto out_detach;
+			ubi_err("cannot open mtd %s, error %d", p->name, err);
+			/* See comment below re-ubi_is_module(). */
+			if (ubi_is_module())
+				goto out_detach;
+			continue;
 		}
 
 		mutex_lock(&ubi_devices_mutex);
-- 
1.8.2.1
