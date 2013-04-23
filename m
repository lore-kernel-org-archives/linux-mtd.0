Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUS3H-00052H-5c
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 01:29:47 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] UBI: drop redundant "UBI error" string
Date: Mon, 22 Apr 2013 21:29:55 -0400
Message-Id: <1366680595-6197-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ubi_err() macro automatically prefixes "UBI error" before the message.
By also using it here, we get a log like so:
	UBI error: ubi_init: UBI error: cannot initialize UBI, error -19

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/ubi/build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a561335..eaa2d4e 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1309,7 +1309,7 @@ out_version:
 out_class:
 	class_destroy(ubi_class);
 out:
-	ubi_err("UBI error: cannot initialize UBI, error %d", err);
+	ubi_err("cannot initialize UBI, error %d", err);
 	return err;
 }
 late_initcall(ubi_init);
-- 
1.8.2.1
