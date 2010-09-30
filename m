Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1BfJ-0005XT-99
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 05:26:46 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 9FDC11B4131
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 05:26:42 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3 v2] mtd-utils: new memory wrappers
Date: Thu, 30 Sep 2010 01:27:38 -0400
Message-Id: <1285824458-21933-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
References: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mkfs.jffs2 program has local wrappers for memory related functions
that are useful beyond mkfs.jffs2, so break them out into a common header.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- shorten "die" func names

 include/common.h |    8 +++++
 include/xalloc.h |   80 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 mkfs.jffs2.c     |   41 ---------------------------
 3 files changed, 88 insertions(+), 41 deletions(-)
 create mode 100644 include/xalloc.h

diff --git a/include/common.h b/include/common.h
index 472315e..9f49f55 100644
--- a/include/common.h
+++ b/include/common.h
@@ -58,6 +58,9 @@ extern "C" {
 	fprintf(stderr, "%s: error!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
 	-1;                                                                 \
 })
+#define errmsg_die(fmt, ...) do {                                           \
+	exit(errmsg(fmt, ##__VA_ARGS__));                                   \
+} while(0)
 
 /* System error messages */
 #define sys_errmsg(fmt, ...)  ({                                            \
@@ -69,6 +72,9 @@ extern "C" {
 	fprintf(stderr, "error %d (%s)\n", _err, strerror(_err));           \
 	-1;                                                                 \
 })
+#define sys_errmsg_die(fmt, ...) do {                                       \
+	exit(sys_errmsg(fmt, ##__VA_ARGS__));                               \
+} while(0)
 
 /* Warnings */
 #define warnmsg(fmt, ...) do {                                                \
@@ -103,6 +109,8 @@ simple_strtoX(strtoll, long int)
 simple_strtoX(strtoul, unsigned long int)
 simple_strtoX(strtoull, unsigned long int)
 
+#include "xalloc.h"
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/include/xalloc.h b/include/xalloc.h
new file mode 100644
index 0000000..5d145d9
--- /dev/null
+++ b/include/xalloc.h
@@ -0,0 +1,80 @@
+/*
+ * memory wrappers
+ *
+ * Copyright (c) Artem Bityutskiy, 2007, 2008
+ * Copyright 2001, 2002 Red Hat, Inc.
+ *           2001 David A. Schleef <ds@lineo.com>
+ *           2002 Axis Communications AB
+ *           2001, 2002 Erik Andersen <andersen@codepoet.org>
+ *           2004 University of Szeged, Hungary
+ *           2006 KaiGai Kohei <kaigai@ak.jp.nec.com>
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
+#ifndef __MTD_UTILS_XALLOC_H__
+#define __MTD_UTILS_XALLOC_H__
+
+#include <stdlib.h>
+#include <string.h>
+
+/*
+ * Mark these functions as unused so that gcc does not emit warnings
+ * when people include this header but don't use every function.
+ */
+
+__attribute__((unused))
+static void *xmalloc(size_t size)
+{
+	void *ptr = malloc(size);
+
+	if (ptr == NULL && size != 0)
+		sys_errmsg_die("malloc(%zu) failed", size);
+	return ptr;
+}
+
+__attribute__((unused))
+static void *xcalloc(size_t nmemb, size_t size)
+{
+	void *ptr = calloc(nmemb, size);
+
+	if (ptr == NULL && nmemb != 0 && size != 0)
+		sys_errmsg_die("calloc(%zu, %zu) failed", nmemb, size);
+	return ptr;
+}
+
+__attribute__((unused))
+static void *xrealloc(void *ptr, size_t size)
+{
+	ptr = realloc(ptr, size);
+	if (ptr == NULL && size != 0)
+		sys_errmsg_die("realloc(%p, %zu) failed", ptr, size);
+	return ptr;
+}
+
+__attribute__((unused))
+static char *xstrdup(const char *s)
+{
+	char *t;
+
+	if (s == NULL)
+		return NULL;
+	t = strdup(s);
+	if (t == NULL)
+		sys_errmsg_die("strdup(%p) failed", s);
+	return t;
+}
+
+#endif /* !__MTD_UTILS_XALLOC_H__ */
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 1abe09c..1ea3598 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -110,7 +110,6 @@ static int squash_uids = 0;
 static int squash_perms = 0;
 static int fake_times = 0;
 int target_endian = __BYTE_ORDER;
-static const char *const memory_exhausted = "memory exhausted";
 
 uint32_t find_hardlink(struct filesystem_entry *e)
 {
@@ -197,46 +196,6 @@ static void perror_msg_and_die(const char *s, ...)
 	exit(EXIT_FAILURE);
 }
 
-#ifndef DMALLOC
-extern void *xmalloc(size_t size)
-{
-	void *ptr = malloc(size);
-
-	if (ptr == NULL && size != 0)
-		error_msg_and_die(memory_exhausted);
-	return ptr;
-}
-
-extern void *xcalloc(size_t nmemb, size_t size)
-{
-	void *ptr = calloc(nmemb, size);
-
-	if (ptr == NULL && nmemb != 0 && size != 0)
-		error_msg_and_die(memory_exhausted);
-	return ptr;
-}
-
-extern void *xrealloc(void *ptr, size_t size)
-{
-	ptr = realloc(ptr, size);
-	if (ptr == NULL && size != 0)
-		error_msg_and_die(memory_exhausted);
-	return ptr;
-}
-
-extern char *xstrdup(const char *s)
-{
-	char *t;
-
-	if (s == NULL)
-		return NULL;
-	t = strdup(s);
-	if (t == NULL)
-		error_msg_and_die(memory_exhausted);
-	return t;
-}
-#endif
-
 extern char *xreadlink(const char *path)
 {
 	static const int GROWBY = 80; /* how large we will grow strings by */
-- 
1.7.2.3
