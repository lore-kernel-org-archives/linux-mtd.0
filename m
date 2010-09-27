Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P07P6-0002il-AG
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 06:41:38 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id D5E8B1B4091
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Sep 2010 06:41:33 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3] mtd-utils: new strtoX helpers
Date: Mon, 27 Sep 2010 02:42:28 -0400
Message-Id: <1285569748-16152-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285394808-29795-1-git-send-email-vapier@gentoo.org>
References: <1285394808-29795-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Simply usage of converting strings to numbers by adding some wrappers
around the standard strtoX functions.  These helpers simplify the api
of these functions a bit by providing an optional "error" pointer and
automatic error message.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v3
	- merge into common.h now that PROGRAM_NAME has been sorted out

 include/common.h |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/include/common.h b/include/common.h
index dce067b..472315e 100644
--- a/include/common.h
+++ b/include/common.h
@@ -20,6 +20,7 @@
 #define __MTD_UTILS_COMMON_H__
 
 #include <stdio.h>
+#include <stdlib.h>
 #include <ctype.h>
 #include <string.h>
 #include <errno.h>
@@ -79,6 +80,29 @@ static inline int is_power_of_2(unsigned long long n)
 	        return (n != 0 && ((n & (n - 1)) == 0));
 }
 
+/**
+ * simple_strtoX - convert a hex/dec/oct string into a number
+ * @snum: buffer to convert
+ * @error: set to 1 when buffer isn't fully consumed
+ */
+#define simple_strtoX(func, type) \
+static inline type simple_##func(const char *snum, int *error) \
+{ \
+	char *endptr; \
+	type ret = func(snum, &endptr, 0); \
+ \
+	if (error && (!*snum || *endptr)) { \
+		errmsg("%s: unable to parse the number '%s'", #func, snum); \
+		*error = 1; \
+	} \
+ \
+	return ret; \
+}
+simple_strtoX(strtol, long int)
+simple_strtoX(strtoll, long int)
+simple_strtoX(strtoul, unsigned long int)
+simple_strtoX(strtoull, unsigned long int)
+
 #ifdef __cplusplus
 }
 #endif
-- 
1.7.2.3
