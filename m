Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1YKc-0004rl-FN
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 05:38:55 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id BDD0B1B403B
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 05:38:51 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: sys_errmsg: optimize indentation
Date: Fri,  1 Oct 2010 01:39:49 -0400
Message-Id: <1285911589-9323-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rather than do a for loop and output 1 space at a time, let the printf
code take care of indenting the string based on the constant length.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/common.h |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/common.h b/include/common.h
index 9f49f55..6684a73 100644
--- a/include/common.h
+++ b/include/common.h
@@ -65,11 +65,9 @@ extern "C" {
 /* System error messages */
 #define sys_errmsg(fmt, ...)  ({                                            \
 	int _err = errno;                                                   \
-	size_t _i;                                                          \
 	errmsg(fmt, ##__VA_ARGS__);                                         \
-	for (_i = 0; _i < sizeof(PROGRAM_NAME) + 1; _i++)                   \
-		fprintf(stderr, " ");                                       \
-	fprintf(stderr, "error %d (%s)\n", _err, strerror(_err));           \
+	fprintf(stderr, "%*serror %d (%s)\n", (int)sizeof(PROGRAM_NAME) + 1,\
+		"", _err, strerror(_err));                                  \
 	-1;                                                                 \
 })
 #define sys_errmsg_die(fmt, ...) do {                                       \
-- 
1.7.3.1
