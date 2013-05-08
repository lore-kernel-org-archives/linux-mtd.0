Received: from dev.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ua7CM-00068i-LY
 for linux-mtd@lists.infradead.org; Wed, 08 May 2013 16:26:35 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id F2A2633DEEC
 for <linux-mtd@lists.infradead.org>; Wed,  8 May 2013 16:26:11 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH [mtd-utils]] fix build errors w/newer kernel headers & glibc
Date: Wed,  8 May 2013 12:26:13 -0400
Message-Id: <1368030373-32584-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Building with linux-headers-3.9 and glibc-2.17 fails like so:
In file included from summary.h:15:0,
                 from jffs2dump.c:37:
/usr/include/linux/uio.h:16:8: error: redefinition of 'struct iovec'
 struct iovec
        ^
In file included from /usr/include/bits/fcntl-linux.h:38:0,
                 from /usr/include/bits/fcntl.h:61,
                 from /usr/include/fcntl.h:35,
                 from jffs2dump.c:25:
/usr/include/bits/uio.h:43:8: note: originally defined here
 struct iovec
        ^

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 summary.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/summary.h b/summary.h
index 95f25c6..e9d95a5 100644
--- a/summary.h
+++ b/summary.h
@@ -12,7 +12,6 @@
 #ifndef JFFS2_SUMMARY_H
 #define JFFS2_SUMMARY_H
 
-#include <linux/uio.h>
 #include <linux/jffs2.h>
 
 #define DIRTY_SPACE(x) do { typeof(x) _x = (x); \
-- 
1.8.2.1
