Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1Bfo-0005Yz-5G
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 05:27:16 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 14E671B4131
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 05:27:14 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd-utils: add xasprintf() helper
Date: Thu, 30 Sep 2010 01:28:11 -0400
Message-Id: <1285824491-22018-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285803024-13572-2-git-send-email-vapier@gentoo.org>
References: <1285803024-13572-2-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- use shorter "die" func

 include/xalloc.h |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/include/xalloc.h b/include/xalloc.h
index 5d145d9..d49a1ae 100644
--- a/include/xalloc.h
+++ b/include/xalloc.h
@@ -77,4 +77,24 @@ static char *xstrdup(const char *s)
 	return t;
 }
 
+#ifdef _GNU_SOURCE
+#include <stdarg.h>
+
+__attribute__((unused))
+static int xasprintf(char **strp, const char *fmt, ...)
+{
+	int cnt;
+	va_list ap;
+
+	va_start(ap, fmt);
+	cnt = vasprintf(strp, fmt, ap);
+	va_end(ap);
+
+	if (cnt == -1)
+		sys_errmsg_die("asprintf(...) failed");
+
+	return cnt;
+}
+#endif
+
 #endif /* !__MTD_UTILS_XALLOC_H__ */
-- 
1.7.2.3
