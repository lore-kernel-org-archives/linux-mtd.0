Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OzyyW-0007lI-8S
	for linux-mtd@lists.infradead.org; Sun, 26 Sep 2010 21:41:36 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 3456E1B400B
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 21:41:35 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] recv_image: fix __USE_GNU hack
Date: Sun, 26 Sep 2010 17:42:29 -0400
Message-Id: <1285537349-6878-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285526931-4005-1-git-send-email-vapier@gentoo.org>
References: <1285526931-4005-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The __USE_GNU define is an internal define that source code should never
be touching.  So switch it to the proper exported _BSD_SOURCE define.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
note: this depends on the program_name cleanup only because it changes
	code in the same area

 recv_image.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recv_image.c b/recv_image.c
index fb8e8b3..a3c3fd5 100644
--- a/recv_image.c
+++ b/recv_image.c
@@ -1,11 +1,11 @@
 
 #define PROGRAM_NAME "recv_image"
 #define _XOPEN_SOURCE 500
+#define _BSD_SOURCE	/* struct ip_mreq */
 
 #include <errno.h>
 #include <error.h>
 #include <stdio.h>
-#define __USE_GNU
 #include <netdb.h>
 #include <stdlib.h>
 #include <string.h>
-- 
1.7.2.3
