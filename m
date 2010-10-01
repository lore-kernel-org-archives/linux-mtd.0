Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1YOy-0006VW-EZ
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 05:43:25 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 7BFFD1B41A7
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 05:43:23 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: dont redefine MIN()
Date: Fri,  1 Oct 2010 01:44:21 -0400
Message-Id: <1285911861-9621-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some C library headers will define MIN(), so add an #ifndef check.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/common.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/common.h b/include/common.h
index 6684a73..25abc0c 100644
--- a/include/common.h
+++ b/include/common.h
@@ -33,7 +33,9 @@
 extern "C" {
 #endif
 
+#ifndef MIN	/* some C lib headers define this for us */
 #define MIN(a ,b) ((a) < (b) ? (a) : (b))
+#endif
 #define min(a, b) MIN(a, b) /* glue for linux kernel source */
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
 
-- 
1.7.3.1
