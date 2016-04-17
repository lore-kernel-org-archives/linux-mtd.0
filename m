Received: from smtp.gentoo.org ([140.211.166.183])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arcC8-0008DG-FR
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 02:12:17 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id 48A98340AF3
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 02:11:54 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils] fix build warnings w/newer glibc & _BSD_SOURCE
Date: Sat, 16 Apr 2016 22:11:51 -0400
Message-Id: <1460859111-9977-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The _BSD_SOURCE define has been deprecated for a while now.  Instead,
code should be defining _DEFAULT_SOURCE.  By defining both, it'll work
with both new & old versions warning-free.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 misc-utils/recv_image.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/misc-utils/recv_image.c b/misc-utils/recv_image.c
index 0093831..8bd7356 100644
--- a/misc-utils/recv_image.c
+++ b/misc-utils/recv_image.c
@@ -2,6 +2,7 @@
 #define PROGRAM_NAME "recv_image"
 #define _XOPEN_SOURCE 500
 #define _BSD_SOURCE	/* struct ip_mreq */
+#define _DEFAULT_SOURCE
 
 #include <errno.h>
 #include <stdio.h>
-- 
2.7.4
