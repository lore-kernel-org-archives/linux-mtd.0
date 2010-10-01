Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1YJg-0004hh-Hg
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 05:37:57 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 519DF1B41A7
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 05:37:55 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: introduce xzalloc() helper
Date: Fri,  1 Oct 2010 01:38:48 -0400
Message-Id: <1285911528-9268-1-git-send-email-vapier@gentoo.org>
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
 include/xalloc.h |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/include/xalloc.h b/include/xalloc.h
index d49a1ae..35a94af 100644
--- a/include/xalloc.h
+++ b/include/xalloc.h
@@ -56,6 +56,12 @@ static void *xcalloc(size_t nmemb, size_t size)
 }
 
 __attribute__((unused))
+static void *xzalloc(size_t size)
+{
+	return xcalloc(1, size);
+}
+
+__attribute__((unused))
 static void *xrealloc(void *ptr, size_t size)
 {
 	ptr = realloc(ptr, size);
-- 
1.7.3.1
