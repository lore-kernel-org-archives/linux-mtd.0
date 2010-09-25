Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OzNta-0006mY-8I
	for linux-mtd@lists.infradead.org; Sat, 25 Sep 2010 06:06:02 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 75B591B4382
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Sep 2010 06:05:58 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4 v2] mtd-utils: new strtoX helpers
Date: Sat, 25 Sep 2010 02:06:48 -0400
Message-Id: <1285394808-29795-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285293221-25028-3-git-send-email-vapier@gentoo.org>
References: <1285293221-25028-3-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Simply usage of converting strings to numbers by adding some wrappers
around the standard strtoX functions.  These helpers support both hex
and dec numbers transparently, and the caller need only provide a ptr
to an error integer if they want to be notified of problems.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- drop redundant parsing logic

 include/strtox.h |   58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 include/strtox.h

diff --git a/include/strtox.h b/include/strtox.h
new file mode 100644
index 0000000..0dcafc7
--- /dev/null
+++ b/include/strtox.h
@@ -0,0 +1,58 @@
+/*
+ * Copyright (c) Artem Bityutskiy, 2007, 2008
+ * Copyright (c) Mike Frysinger, 2010
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#ifndef __MTD_UTILS_STRTOX_H__
+#define __MTD_UTILS_STRTOX_H__
+
+#include "common.h"
+#include <stdlib.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/**
+ * simple_strtoX - convert a hex/dec string into a number
+ * @snum: buffer to convert
+ * @error: set to 1 when buffer isn't fully consumed
+ */
+#define simple_strtoX(func, type) \
+static inline type simple_##func(const char *snum, int *error) \
+{ \
+	char *endptr; \
+	type ret = func(snum, &endptr, 0); \
+ \
+	if (!*snum || *endptr) { \
+		errmsg("%s: unable to parse the number '%s'", #func, snum); \
+		if (error) \
+			*error = 1; \
+	} \
+ \
+	return ret; \
+}
+simple_strtoX(strtol, long int)
+simple_strtoX(strtoll, long int)
+simple_strtoX(strtoul, unsigned long int)
+simple_strtoX(strtoull, unsigned long int)
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* !__MTD_UTILS_STRTOX_H__ */
-- 
1.7.2.3
